const sdl2 = @import("sdl2.zig");
const C = @import("sdl2-c-binding.zig");
const IMG = @import("sdl-image-c-binding.zig");
pub const Types = @import("sdl2-types.zig");
pub const Flags = Types.ImageFlags;
pub const Error = Types.Error;

pub fn init(f: Flags) Error!void {
    if (IMG.IMG_Init(@intCast(c_int, f.toNum())) < 0) return Error.InitFailed;
}

pub fn quit() void {
    IMG.IMG_Quit();
}

