const std = @import("std");
pub const C = @import("sdl2-c-binding.zig");
const Types = @import("sdl2-types.zig");

pub const Error     = Types.Error;
pub const InitFlags = Types.InitFlags;
pub const Color     = Types.Color;
pub const Event     = Types.Event;
pub const EventType = Types.EventType;
pub const IRect     = Types.Rect(i16);
pub const FRect     = Types.Rect(f32);
pub const IPoint    = Types.Point(i16);
pub const FPoint    = Types.Point(f32);
pub const Size      = IPoint;
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
            @ptrCast(*C.SDL_Color, itemsColor.ptr), @sizeOf(Color), null, 0,
            @intCast(c_int, slice.len), null, 0, 4) < 0) return Error.RenderFailed;
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
            EventType.DISPLAYEVENT => { this.display_event(&event.display); },
            EventType.WINDOWEVENT => { this.window_event(&event.window); },
            EventType.SYSWMEVENT => { this.syswm_event(&event.syswm); },
            EventType.KEYDOWN,
            EventType.KEYUP => { this.key_event(&event.key); },
            EventType.TEXTEDITING => { this.text_edit_event(&event.edit); },
            EventType.TEXTINPUT => { this.text_input_event(&event.text); },
            EventType.KEYMAPCHANGED => {},
            EventType.MOUSEMOTION => { this.motion_event(&event.motion); },
            EventType.MOUSEBUTTONDOWN,
            EventType.MOUSEBUTTONUP => { this.button_event(&event.button); },
            EventType.MOUSEWHEEL => { this.wheel_event(&event.wheel); },
            EventType.JOYAXISMOTION => { this.joyaxis_event(&event.jaxis); },
            EventType.JOYBALLMOTION => { this.joyball_event(&event.jball); },
            EventType.JOYHATMOTION => { this.joyhat_event(&event.jhat); },
            EventType.JOYBUTTONDOWN,
            EventType.JOYBUTTONUP => { this.joybutton_event(&event.jbutton); },
            EventType.JOYDEVICEADDED,
            EventType.JOYDEVICEREMOVED => { this.joydevice_event(&event.jdevice); },
            EventType.CONTROLLERAXISMOTION => { this.controller_axis_event(&event.caxis); },
            EventType.CONTROLLERBUTTONDOWN,
            EventType.CONTROLLERBUTTONUP => { this.controller_button_event(&event.cbutton); },
            EventType.CONTROLLERDEVICEADDED,
            EventType.CONTROLLERDEVICEREMOVED,
            EventType.CONTROLLERDEVICEREMAPPED => { this.controller_device_event(&event.cdevice); },
            EventType.CONTROLLERTOUCHPADDOWN,
            EventType.CONTROLLERTOUCHPADMOTION,
            EventType.CONTROLLERTOUCHPADUP => { this.controller_touchpad_event(&event.ctouchpad); },
            EventType.CONTROLLERSENSORUPDATE => { this.controller_sensor_event(&event.csensor); },
            EventType.FINGERDOWN,
            EventType.FINGERUP,
            EventType.FINGERMOTION => { this.touch_finger_event(&event.tfinger); },
            EventType.DOLLARGESTURE,
            EventType.DOLLARRECORD => { this.dollar_gesture_event(&event.dgesture); },
            EventType.MULTIGESTURE => { this.multi_gesture_event(&event.mgesture); },
            EventType.CLIPBOARDUPDATE => {},
            EventType.DROPFILE,
            EventType.DROPTEXT,
            EventType.DROPBEGIN,
            EventType.DROPCOMPLETE => { this.drop_event(&event.drop); },
            EventType.AUDIODEVICEADDED,
            EventType.AUDIODEVICEREMOVED => { this.adevice_event(&event.adevice); },
            EventType.SENSORUPDATE => { this.sensor_event(&event.sensor); },
            EventType.RENDER_TARGETS_RESET => {},
            EventType.RENDER_DEVICE_RESET => {},
            EventType.POLLSENTINEL => {},
            EventType.USER => {},
            EventType.LAST => {},
            else => {},
        }
    }

    fn adevice_event_stub(event: *Event.AudioDevice) void { _ = event; }
    fn button_event_stub(event: *Event.MouseButton) void { _ = event; }
    fn controller_axis_event_stub(event: *Event.ControllerAxis) void { _ = event; }
    fn controller_button_event_stub(event: *Event.ControllerButton) void { _ = event; }
    fn controller_device_event_stub(event: *Event.ControllerDevice) void { _ = event; }
    fn controller_touchpad_event_stub(event: *Event.ControllerTouchpad) void { _ = event; }
    fn controller_sensor_event_stub(event: *Event.ControllerSensor) void { _ = event; }
    fn display_event_stub(event: *Event.Display) void { _ = event; }
    fn dollar_gesture_event_stub(event: *Event.DollarGesture) void { _ = event; }
    fn drop_event_stub(event: *Event.Drop) void { _ = event; }
    fn joyaxis_event_stub(event: *Event.JoyAxis) void { _ = event; }
    fn joyball_event_stub(event: *Event.JoyBall) void { _ = event; }
    fn joybutton_event_stub(event: *Event.JoyButton) void { _ = event; }
    fn joydevice_event_stub(event: *Event.JoyDevice) void { _ = event; }
    fn joyhat_event_stub(event: *Event.JoyHat) void { _ = event; }
    fn key_event_stub(event: *Event.Keyboard) void { _ = event; }
    fn motion_event_stub(event: *Event.MouseMotion) void { _ = event; }
    fn multi_gesture_event_stub(event: *Event.MultiGesture) void { _ = event; }
    fn quit_event_stub(event: *Event.Quit) void { _ = event; }
    fn sensor_event_stub(event: *Event.Sensor) void { _ = event; }
    fn syswm_event_stub(event: *Event.SysWM) void { _ = event; }
    fn text_edit_event_stub(event: *Event.TextEditing) void { _ = event; }
    fn text_input_event_stub(event: *Event.TextInput) void { _ = event; }
    fn touch_finger_event_stub(event: *Event.TouchFinger) void { _ = event; }
    fn wheel_event_stub(event: *Event.MouseWheel) void { _ = event; }
    fn window_event_stub(event: *Event.Window) void { _ = event; }

    adevice_event: fn(*Event.AudioDevice) void = adevice_event_stub,
    button_event: fn(*Event.MouseButton) void = button_event_stub,
    controller_axis_event: fn(*Event.ControllerAxis) void = controller_axis_event_stub,
    controller_button_event: fn(*Event.ControllerButton) void = controller_button_event_stub,
    controller_device_event: fn(*Event.ControllerDevice) void = controller_device_event_stub,
    controller_touchpad_event: fn(*Event.ControllerTouchpad) void = controller_touchpad_event_stub,
    controller_sensor_event: fn(*Event.ControllerSensor) void = controller_sensor_event_stub,
    display_event: fn(*Event.Display) void = display_event_stub,
    dollar_gesture_event: fn(*Event.DollarGesture) void = dollar_gesture_event_stub,
    drop_event: fn(*Event.Drop) void = drop_event_stub,
    joyaxis_event: fn(*Event.JoyAxis) void = joyaxis_event_stub,
    joyball_event: fn(*Event.JoyBall) void = joyball_event_stub,
    joybutton_event: fn(*Event.JoyButton) void = joybutton_event_stub,
    joydevice_event: fn(*Event.JoyDevice) void = joydevice_event_stub,
    joyhat_event: fn(*Event.JoyHat) void = joyhat_event_stub,
    key_event: fn(*Event.Keyboard) void = key_event_stub,
    motion_event: fn(*Event.MouseMotion) void = motion_event_stub,
    multi_gesture_event: fn(*Event.MultiGesture) void = multi_gesture_event_stub,
    quit_event: fn(*Event.Quit) void = quit_event_stub,
    sensor_event: fn(*Event.Sensor) void = sensor_event_stub,
    syswm_event: fn(*Event.SysWM) void = syswm_event_stub,
    text_edit_event: fn(*Event.TextEditing) void = text_edit_event_stub,
    text_input_event: fn(*Event.TextInput) void = text_input_event_stub,
    touch_finger_event: fn(*Event.TouchFinger) void = touch_finger_event_stub,
    wheel_event: fn(*Event.MouseWheel) void = wheel_event_stub,
    window_event: fn(*Event.Window) void = window_event_stub,
};
