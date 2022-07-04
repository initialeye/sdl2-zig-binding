const sdl2 = @import("sdl2.zig");
const C = @import("sdl2-c-binding.zig");
const TTF = @import("sdl-ttf-c-binding.zig");
pub const Types = @import("sdl2-types.zig");
pub const Error = Types.Error;

pub fn init() Error!void {
    if (TTF.TTF_Init() < 0) return Error.InitFailed;
}

pub fn quit() void {
    TTF.TTF_Quit();
}

pub const Font = struct {
    ptr: *TTF.TTF_Font,

    pub fn create(file: [:0]const u8, ftsize: u16) Error!Font {
        const font = TTF.TTF_OpenFontIndex(file.ptr, ftsize, 0);
        return Font{ .ptr = font orelse return Error.LoadFailed, };
    }

    pub fn destroy(f: Font) void {
        TTF.TTF_CloseFont(f.ptr);
    }

    pub fn renderText(f: Font, text: [:0]const u8, fg: Types.Color) Error!sdl2.Surface {
        var sur = TTF.TTF_RenderText_Solid(f.ptr, text, fg.toSdl());
        return sdl2.Surface{ .ptr = sur orelse return Error.RenderFailed, };
    }
};
