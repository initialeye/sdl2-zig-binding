const std = @import("std");
pub const C = @import("sdl2-c-binding.zig");
const Types = @import("sdl2-types.zig");

pub const Error     = Types.Error;
pub const InitFlags = Types.InitFlags;
pub const Color     = Types.Color;
pub const Event     = Types.Event;
pub const EventType = Types.EventType;
pub const Size      = Types.IPoint;
pub const IRect     = Types.IRect;
pub const FRect     = Types.FRect;
pub const IPoint    = Types.IPoint;
pub const FPoint    = Types.FPoint;
pub const ButtonState = Types.ButtonState;

pub fn init(flags: InitFlags) Error!void {
    if (C.SDL_Init(flags.toNum()) < 0) {
        return Error.InitFailed;
    }
}

pub fn quit() void {
    C.SDL_Quit();
}

pub const Window = struct {
    ptr: *C.SDL_Window,
    pub const Flags = Types.WindowFlags;

    pub fn create(title: []const u8, size: Size, flags: Flags) Error!Window {
        const w = C.SDL_CreateWindow(
            title.ptr, C.SDL_WINDOWPOS_UNDEFINED, C.SDL_WINDOWPOS_UNDEFINED, size.x, size.y, flags.toNum()
        );
        return Window {
            .ptr = w orelse return Error.CreateFailed,
        };
    }

    pub fn getId(w: Window) u32 {
        return C.SDL_GetWindowID(w.ptr);
    }

    pub fn destroy(w: Window) void {
        C.SDL_DestroyWindow(w.ptr);
    }
};

pub const Renderer = struct {
    ptr: *C.SDL_Renderer,

    pub const Flags = Types.RendererFlags;
    pub const VerticesC = std.MultiArrayList(Types.VertexColor);
    pub const VerticesT = std.MultiArrayList(Types.VertexTexture);

    pub fn create(w: Window, f: Flags) Error!Renderer {
        const ptr = C.SDL_CreateRenderer(w.ptr, -1, f.toNum());
        return Renderer {
            .ptr = ptr orelse return Error.CreateFailed,
        };
    }

    pub fn createDrawContext(surface: Surface) Error!Renderer {
        const renderer = C.SDL_CreateSoftwareRenderer(surface.ptr);
        return Renderer{ .ptr = renderer orelse return Error.CreateFailed, };
    }

    pub fn destroy(r: Renderer) void {
        C.SDL_DestroyRenderer(r.ptr);
    }

    pub fn clear(r: Renderer, color: Types.Color) Error!void {
        if (C.SDL_SetRenderDrawColor(r.ptr, color.a, color.g, color.b, color.a) < 0) return Error.RenderFailed;
        if (C.SDL_RenderClear(r.ptr) < 0) return Error.RenderFailed;
    }

    pub fn present(r: Renderer) void {
        C.SDL_RenderPresent(r.ptr);
    }

    pub fn getViewport(r: Renderer) IRect {
        var rect: C.SDL_Rect = undefined;
        C.SDL_RenderGetViewport(r.ptr, &rect);
        return IRect.init(rect);
    }

    pub fn setViewport(r: Renderer, v: IRect) Error!void {
        const rect = v.toSdl();
        if(C.SDL_RenderSetViewport(r.ptr, &rect) < 0) return Error.RenderFailed;
    }

    pub fn copy(r:Renderer, t: Texture, src: IRect, trg: FRect) Error!void {
        const sdlSrc = src.toSdl();
        const sdlTrg = trg.toSdl();
        if (C.SDL_RenderCopyF(r.ptr, t.ptr, &sdlSrc, &sdlTrg) < 0) return Error.RenderFailed;
    }

    pub fn copyFull(r:Renderer, t: Texture) Error!void {
        if (C.SDL_RenderCopyF(r.ptr, t.ptr, null, null) < 0) return Error.RenderFailed;
    }

    pub fn copyOriginal(r:Renderer, tex: Texture, targ: FRect) Error!void {
        const rect = targ.toSdl();
        if (C.SDL_RenderCopyF(r.ptr, tex.ptr, null, &rect) < 0) return Error.RenderFailed;
    }

    pub fn copyPartial(r:Renderer, tex: Texture, src: IRect) Error!void {
        const rect = src.toSdl();
        if (C.SDL_RenderCopyF(r.ptr, tex.ptr, &rect, null) < 0) return Error.RenderFailed;
    }

    pub fn setTarget(r:Renderer, t: Texture) Error!void {
        if (C.SDL_SetRenderTarget(r.ptr, t.ptr) < 0) return Error.RenderFailed;
    }

    pub fn getTarget(r:Renderer) ?Texture {
        const tex = C.SDL_GetRenderTarget(r.ptr) orelse return null;
        return .{
            .ptr = tex,
        };
    }

    pub fn freeTarget(r:Renderer) Error!void {
        if (C.SDL_SetRenderTarget(r.ptr, null) < 0) return Error.RenderFailed;
    }

    pub fn drawLines(r: Renderer, points: []const Types.PointF, color: Types.Color) Error!void {
        if (C.SDL_SetRenderDrawColor(r.ptr, color.a, color.g, color.b, color.a) < 0) return Error.RenderFailed;
        if (C.SDL_RenderDrawLinesF(r.ptr, points.ptr, points.len) < 0) return Error.RenderFailed;
    }

    pub fn drawRect(r: Renderer, rect: Types.RectF, color: Types.Color) Error!void {
        if (C.SDL_SetRenderDrawColor(r.ptr, color.a, color.g, color.b, color.a) < 0) return Error.RenderFailed;
        var points: [5]Types.PointF = .{
            .{ .x = rect.x, .y = rect.y },
            .{ .x = rect.x + rect.w, .y = rect.y },
            .{ .x = rect.x + rect.w, .y = rect.y + rect.h },
            .{ .x = rect.x, .y = rect.y + rect.h },
            .{ .x = rect.x, .y = rect.y },
        };
        if (C.SDL_RenderDrawLinesF(r.ptr, points.ptr, points.len) < 0) return Error.RenderFailed;
    }

    pub fn drawGeometryColor(r: Renderer, vertices: VerticesC) Error!void {
        const slice = vertices.slice();
        const itemsPos   = slice.items(.pos);
        const itemsColor = slice.items(.color);
        if (C.SDL_RenderGeometryRaw(r.ptr, null, @alignCast(4, &itemsPos.ptr.*.x), @sizeOf(FPoint),
            @ptrCast(*C.SDL_Color, itemsColor.ptr), @sizeOf(Color), null, 0, @intCast(c_int, slice.len), null, 0, 4) < 0) return Error.RenderFailed;

        _ = itemsColor;
        _ = itemsPos;
        //var v: [4]C.SDL_Vertex = undefined;
        //v[0] = .{ .position = .{ .x =  0, .y =  0, }, .color = .{ .r = 64, .g = 64, .b = 64, .a = 128, }, .tex_coord = .{ .x = 0, .y = 0, }};
        //v[1] = .{ .position = .{ .x = 10, .y =  0, }, .color = .{ .r = 64, .g =  0, .b = 64, .a = 128, }, .tex_coord = .{ .x = 0, .y = 0, }};
        //v[2] = .{ .position = .{ .x = 10, .y = 10, }, .color = .{ .r = 64, .g =  0, .b =  0, .a = 128, }, .tex_coord = .{ .x = 0, .y = 0, }};
        //v[3] = .{ .position = .{ .x =  0, .y = 10, }, .color = .{ .r =  0, .g =  0, .b =  0, .a = 128, }, .tex_coord = .{ .x = 0, .y = 0, }};
        //if (C.SDL_RenderGeometryRaw(r.ptr, null, &v[0].position.x, @sizeOf(C.SDL_Vertex),
        //    &v[0].color, @sizeOf(C.SDL_Vertex), null, 0, 4, null, 0, 4) < 0) return Error.RenderFailed;
    }

    pub fn drawGeometryTexture(r: Renderer, tex: Texture, vertices: VerticesT) Error!void {
        const slice = vertices.slice();
        const itemsPos = slice.items(.pos);
        const itemsTC  = slice.items(.texcord);
        if (C.SDL_RenderGeometryRaw(r.ptr, tex.ptr, itemsPos.ptr.*.x, @sizeOf(FPoint), null, 0,
            &itemsTC.ptr.*.x, @sizeOf(FPoint), slice.len, null, 0, 4) < 0) return Error.RenderFailed;
    }
};

pub const Texture = struct {
    ptr: *C.SDL_Texture,

    pub const Format = Types.PixelFormat;
    pub const Access = Types.TextureAccess;

    pub const Attributes = struct {
        format: Format,
        access: Access,
        size:   Size,
    };

    pub fn create(ctx: Renderer, format: Format, access: Access, size: Size) Error!Texture {
        const texture = C.SDL_CreateTexture(ctx.ptr, @enumToInt(format), @intCast(c_int, @enumToInt(access)), size.x, size.y);
        return Texture{ .ptr = texture orelse return Error.CreateFailed, };
    }

    pub fn createSurface(ctx: Renderer, surface: Surface) Error!Texture {
        const texture = C.SDL_CreateTextureFromSurface(ctx.ptr, surface.ptr);
        return Texture{ .ptr = texture orelse return Error.CreateFailed, };
    }

    pub fn getAttributes(this: Texture) Attributes {
        var x: c_int = undefined;
        var y: c_int = undefined;
        var access: c_int = undefined;
        var format: u32 = undefined;
        // Error only if this.ptr is invalid (wrong magic)
        if (C.SDL_QueryTexture(this.ptr, &format, &access, &x, &y) < 0) unreachable;
        return Attributes{
            .format = @intToEnum(Format, format),
            .access = @intToEnum(Access, access),
            .size = .{ .x = @intCast(i16, x), .y = @intCast(i16, y), },
        };
    }

    pub fn destroy(this: Texture) void {
        C.SDL_DestroyTexture(this.ptr);
    }
};

pub const Surface = struct {
    ptr: *C.SDL_Surface,

    pub const Format = Types.PixelFormat;

    pub fn create(format: Format, size: Size) Error!Surface {
        const surface = C.SDL_CreateRGBSurfaceWithFormat(0, size.x, size.y, 32, @enumToInt(format));
        return Surface{ .ptr = surface orelse return Error.CreateFailed, };
    }

    pub fn destroy(this: Surface) void {
        C.SDL_FreeSurface(this.ptr);
    }
};

pub const EventHandler = struct {

    pub fn handle(this: *const EventHandler) void {
        var event: C.SDL_Event = .{ .type = C.SDL_FIRSTEVENT, };
        while (C.SDL_PollEvent(&event) != 0) {
            this.process(&event);
        }
    }

    fn process(this: *const EventHandler, event: *C.SDL_Event) void {
        switch(event.type) {
            EventType.FIRSTEVENT => {},
            EventType.QUIT => { this.quit_event(&event.quit); },
            EventType.APP_TERMINATING => {},
            EventType.APP_LOWMEMORY => {},
            EventType.APP_WILLENTERBACKGROUND => {},
            EventType.APP_DIDENTERBACKGROUND => {},
            EventType.APP_WILLENTERFOREGROUND => {},
            EventType.APP_DIDENTERFOREGROUND => {},
            EventType.LOCALECHANGED => {},
            EventType.DISPLAYEVENT => {},
            EventType.WINDOWEVENT => {},
            EventType.SYSWMEVENT => {},
            EventType.KEYDOWN => {},
            EventType.KEYUP => {},
            EventType.TEXTEDITING => {},
            EventType.TEXTINPUT => {},
            EventType.KEYMAPCHANGED => {},
            EventType.MOUSEMOTION => {},
            EventType.MOUSEBUTTONDOWN,
            EventType.MOUSEBUTTONUP => { this.button_event(&event.button); },
            EventType.MOUSEWHEEL => {},
            EventType.JOYAXISMOTION => {},
            EventType.JOYBALLMOTION => {},
            EventType.JOYHATMOTION => {},
            EventType.JOYBUTTONDOWN => {},
            EventType.JOYBUTTONUP => {},
            EventType.JOYDEVICEADDED => {},
            EventType.JOYDEVICEREMOVED => {},
            EventType.CONTROLLERAXISMOTION => {},
            EventType.CONTROLLERBUTTONDOWN => {},
            EventType.CONTROLLERBUTTONUP => {},
            EventType.CONTROLLERDEVICEADDED => {},
            EventType.CONTROLLERDEVICEREMOVED => {},
            EventType.CONTROLLERDEVICEREMAPPED => {},
            EventType.CONTROLLERTOUCHPADDOWN => {},
            EventType.CONTROLLERTOUCHPADMOTION => {},
            EventType.CONTROLLERTOUCHPADUP => {},
            EventType.CONTROLLERSENSORUPDATE => {},
            EventType.FINGERDOWN => {},
            EventType.FINGERUP => {},
            EventType.FINGERMOTION => {},
            EventType.DOLLARGESTURE => {},
            EventType.DOLLARRECORD => {},
            EventType.MULTIGESTURE => {},
            EventType.CLIPBOARDUPDATE => {},
            EventType.DROPFILE => {},
            EventType.DROPTEXT => {},
            EventType.DROPBEGIN => {},
            EventType.DROPCOMPLETE => {},
            EventType.AUDIODEVICEADDED,
            EventType.AUDIODEVICEREMOVED => { this.adevice_event(&event.adevice); },
            EventType.SENSORUPDATE => {},
            EventType.RENDER_TARGETS_RESET => {},
            EventType.RENDER_DEVICE_RESET => {},
            EventType.POLLSENTINEL => {},
            EventType.USER => {},
            EventType.LAST => {},
            else => {},
        }
    }

    fn quit_event_stub(event: *Event.Quit) void { _ = event; }
    fn button_event_stub(event: *Event.MouseButton) void { _ = event; }
    fn adevice_event_stub(event: *Event.AudioDevice) void { _ = event; }

    quit_event: fn(*Event.Quit) void = quit_event_stub,
    button_event: fn(*Event.MouseButton) void = button_event_stub,
    adevice_event: fn(*Event.AudioDevice) void = adevice_event_stub,
};
