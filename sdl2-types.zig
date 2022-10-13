const C = @import("sdl2-c-binding.zig");
const IMG = @import("sdl-image-c-binding.zig");
const TTF = @import("sdl-ttf-c-binding.zig");

pub const Error = error {
    InitFailed,
    CreateFailed,
    RenderFailed,
    LoadFailed,
    InvalidData,
};

pub const InitFlags = packed struct {
    timer: u4 = 0,
    audio: u1 = 0,
    video: u4 = 0,
    joystick: u3 = 0,
    haptic: u1 = 0,
    gamectl: u1 = 0,
    events: u1 = 0,
    sensor: u1 = 0,
    noparachute: u1 = 0,
    __padding: u15 = 0,

    pub fn all() InitFlags {
        return .{
            .timer = 1,
            .audio = 1,
            .video = 1,
            .joystick = 1,
            .haptic = 1,
            .gamectl = 1,
            .events = 1,
            .sensor = 1,
        };
    }

    pub fn toNum(f: InitFlags) u32 {
        return @bitCast(u32, f);
    }
};

pub const WindowFlags = packed struct {
    fullscreen: u1 = 0,
    opengl: u1 = 0,
    shown: u1 = 0,
    hidden: u1 = 0,
    borderless: u1 = 0,
    resizable: u1 = 0,
    minimized: u1 = 0,
    maximized: u1 = 0,
    mouse_grabbed: u1 = 0,
    input_focus: u1 = 0,
    mouse_focus: u1 = 0,
    foreign: u1 = 0,
    desktop: u1 = 0,
    allow_highdpi: u1 = 0,
    mouse_capture: u1 = 0,
    always_on_top: u1 = 0,
    skip_taskbar: u1 = 0,
    unility: u1 = 0,
    tooltip: u1 = 0,
    popup_menu: u1 = 0,
    keyboard_grabbed: u1 = 0,
    __padding: u11 = 0,

    pub fn toNum(f: WindowFlags) u32 {
        return @bitCast(u32, f);
    }
};

pub const ImageFlags = packed struct {
    jpg: u1 = 0,
    png: u1 = 0,
    tiff: u1 = 0,
    __padding: u29 = 0,

    pub fn toNum(f: ImageFlags) u32 {
        return @bitCast(u32, f);
    }
};

pub const RendererFlags = packed struct {
    software: u1 = 0,
    accelerated: u1 = 0,
    vsync: u1 = 0,
    targtex: u1 = 0,
    __padding: u28 = 0,

    pub fn toNum(f: RendererFlags) u32 {
        return @bitCast(u32, f);
    }
};

pub const PixelFormat = enum(u32) {
    index1_lsb  = C.SDL_PIXELFORMAT_INDEX1LSB,
    index1_msb  = C.SDL_PIXELFORMAT_INDEX1MSB,
    index4_lsb  = C.SDL_PIXELFORMAT_INDEX4LSB,
    index4_msb  = C.SDL_PIXELFORMAT_INDEX4MSB,
    index8      = C.SDL_PIXELFORMAT_INDEX8,
    rgb332      = C.SDL_PIXELFORMAT_RGB332,
    rgb444      = C.SDL_PIXELFORMAT_RGB444,
    rgb555      = C.SDL_PIXELFORMAT_RGB555,
    bgr555      = C.SDL_PIXELFORMAT_BGR555,
    argb4444    = C.SDL_PIXELFORMAT_ARGB4444,
    rgba4444    = C.SDL_PIXELFORMAT_RGBA4444,
    abgr4444    = C.SDL_PIXELFORMAT_ABGR4444,
    bgra4444    = C.SDL_PIXELFORMAT_BGRA4444,
    argb1555    = C.SDL_PIXELFORMAT_ARGB1555,
    rgba5551    = C.SDL_PIXELFORMAT_RGBA5551,
    abgr1555    = C.SDL_PIXELFORMAT_ABGR1555,
    bgra5551    = C.SDL_PIXELFORMAT_BGRA5551,
    rgb565      = C.SDL_PIXELFORMAT_RGB565,
    bgr565      = C.SDL_PIXELFORMAT_BGR565,
    rgb24       = C.SDL_PIXELFORMAT_RGB24,
    bgr24       = C.SDL_PIXELFORMAT_BGR24,
    rgb888      = C.SDL_PIXELFORMAT_RGB888,
    rgbx8888    = C.SDL_PIXELFORMAT_RGBX8888,
    bgr888      = C.SDL_PIXELFORMAT_BGR888,
    bgrx8888    = C.SDL_PIXELFORMAT_BGRX8888,
    argb8888    = C.SDL_PIXELFORMAT_ARGB8888,
    rgba8888    = C.SDL_PIXELFORMAT_RGBA8888,
    abgr8888    = C.SDL_PIXELFORMAT_ABGR8888,
    bgra8888    = C.SDL_PIXELFORMAT_BGRA8888,
    argb2101010 = C.SDL_PIXELFORMAT_ARGB2101010,
    yv12        = C.SDL_PIXELFORMAT_YV12,
    iyuv        = C.SDL_PIXELFORMAT_IYUV,
    yuy2        = C.SDL_PIXELFORMAT_YUY2,
    uyvy        = C.SDL_PIXELFORMAT_UYVY,
    yvyu        = C.SDL_PIXELFORMAT_YVYU,
    nv12        = C.SDL_PIXELFORMAT_NV12,
    nv21        = C.SDL_PIXELFORMAT_NV21,
    externalOES = C.SDL_PIXELFORMAT_EXTERNAL_OES,
};

pub const TextureAccess = enum(u32) {
    static    = C.SDL_TEXTUREACCESS_STATIC,
    streaming = C.SDL_TEXTUREACCESS_STREAMING,
    target    = C.SDL_TEXTUREACCESS_TARGET,
};

pub const Event = struct {
    pub const Common = C.SDL_CommonEvent;
    pub const Display = C.SDL_DisplayEvent;
    pub const Window = C.SDL_WindowEvent;
    pub const Keyboard = C.SDL_KeyboardEvent;
    pub const TextEditing = C.SDL_TextEditingEvent;
    pub const TextEditingExt = C.SDL_TextEditingExtEvent;
    pub const TextInput = C.SDL_TextInputEvent;
    pub const MouseMotion = C.SDL_MouseMotionEvent;
    pub const MouseButton = C.SDL_MouseButtonEvent;
    pub const MouseWheel = C.SDL_MouseWheelEvent;
    pub const JoyAxis = C.SDL_JoyAxisEvent;
    pub const JoyBall = C.SDL_JoyBallEvent;
    pub const JoyHat = C.SDL_JoyHatEvent;
    pub const JoyButton = C.SDL_JoyButtonEvent;
    pub const JoyDevice = C.SDL_JoyDeviceEvent;
    pub const ControllerAxis = C.SDL_ControllerAxisEvent;
    pub const ControllerButton = C.SDL_ControllerButtonEvent;
    pub const ControllerDevice = C.SDL_ControllerDeviceEvent;
    pub const ControllerTouchpad = C.SDL_ControllerTouchpadEvent;
    pub const ControllerSensor = C.SDL_ControllerSensorEvent;
    pub const AudioDevice = C.SDL_AudioDeviceEvent;
    pub const Sensor = C.SDL_SensorEvent;
    pub const Quit = C.SDL_QuitEvent;
    pub const User = C.SDL_UserEvent;
    pub const SysWM = C.SDL_SysWMEvent;
    pub const TouchFinger = C.SDL_TouchFingerEvent;
    pub const MultiGesture = C.SDL_MultiGestureEvent;
    pub const DollarGesture = C.SDL_DollarGestureEvent;
    pub const Drop = C.SDL_DropEvent;
};

pub const EventType = struct {
    pub const FIRSTEVENT = C.SDL_FIRSTEVENT;
    pub const QUIT = C.SDL_QUIT;
    pub const APP_TERMINATING = C.SDL_APP_TERMINATING;
    pub const APP_LOWMEMORY = C.SDL_APP_LOWMEMORY;
    pub const APP_WILLENTERBACKGROUND = C.SDL_APP_WILLENTERBACKGROUND;
    pub const APP_DIDENTERBACKGROUND = C.SDL_APP_DIDENTERBACKGROUND;
    pub const APP_WILLENTERFOREGROUND = C.SDL_APP_WILLENTERFOREGROUND;
    pub const APP_DIDENTERFOREGROUND = C.SDL_APP_DIDENTERFOREGROUND;
    pub const LOCALECHANGED = C.SDL_LOCALECHANGED;
    pub const DISPLAYEVENT = C.SDL_DISPLAYEVENT;
    pub const WINDOWEVENT = C.SDL_WINDOWEVENT;
    pub const SYSWMEVENT = C.SDL_SYSWMEVENT;
    pub const KEYDOWN = C.SDL_KEYDOWN;
    pub const KEYUP = C.SDL_KEYUP;
    pub const TEXTEDITING = C.SDL_TEXTEDITING;
    pub const TEXTINPUT = C.SDL_TEXTINPUT;
    pub const KEYMAPCHANGED = C.SDL_KEYMAPCHANGED;
    pub const MOUSEMOTION = C.SDL_MOUSEMOTION;
    pub const MOUSEBUTTONDOWN = C.SDL_MOUSEBUTTONDOWN;
    pub const MOUSEBUTTONUP = C.SDL_MOUSEBUTTONUP;
    pub const MOUSEWHEEL = C.SDL_MOUSEWHEEL;
    pub const JOYAXISMOTION = C.SDL_JOYAXISMOTION;
    pub const JOYBALLMOTION = C.SDL_JOYBALLMOTION;
    pub const JOYHATMOTION = C.SDL_JOYHATMOTION;
    pub const JOYBUTTONDOWN = C.SDL_JOYBUTTONDOWN;
    pub const JOYBUTTONUP = C.SDL_JOYBUTTONUP;
    pub const JOYDEVICEADDED = C.SDL_JOYDEVICEADDED;
    pub const JOYDEVICEREMOVED = C.SDL_JOYDEVICEREMOVED;
    pub const CONTROLLERAXISMOTION = C.SDL_CONTROLLERAXISMOTION;
    pub const CONTROLLERBUTTONDOWN = C.SDL_CONTROLLERBUTTONDOWN;
    pub const CONTROLLERBUTTONUP = C.SDL_CONTROLLERBUTTONUP;
    pub const CONTROLLERDEVICEADDED = C.SDL_CONTROLLERDEVICEADDED;
    pub const CONTROLLERDEVICEREMOVED = C.SDL_CONTROLLERDEVICEREMOVED;
    pub const CONTROLLERDEVICEREMAPPED = C.SDL_CONTROLLERDEVICEREMAPPED;
    pub const CONTROLLERTOUCHPADDOWN = C.SDL_CONTROLLERTOUCHPADDOWN;
    pub const CONTROLLERTOUCHPADMOTION = C.SDL_CONTROLLERTOUCHPADMOTION;
    pub const CONTROLLERTOUCHPADUP = C.SDL_CONTROLLERTOUCHPADUP;
    pub const CONTROLLERSENSORUPDATE = C.SDL_CONTROLLERSENSORUPDATE;
    pub const FINGERDOWN = C.SDL_FINGERDOWN;
    pub const FINGERUP = C.SDL_FINGERUP;
    pub const FINGERMOTION = C.SDL_FINGERMOTION;
    pub const DOLLARGESTURE = C.SDL_DOLLARGESTURE;
    pub const DOLLARRECORD = C.SDL_DOLLARRECORD;
    pub const MULTIGESTURE = C.SDL_MULTIGESTURE;
    pub const CLIPBOARDUPDATE = C.SDL_CLIPBOARDUPDATE;
    pub const DROPFILE = C.SDL_DROPFILE;
    pub const DROPTEXT = C.SDL_DROPTEXT;
    pub const DROPBEGIN = C.SDL_DROPBEGIN;
    pub const DROPCOMPLETE = C.SDL_DROPCOMPLETE;
    pub const AUDIODEVICEADDED = C.SDL_AUDIODEVICEADDED;
    pub const AUDIODEVICEREMOVED = C.SDL_AUDIODEVICEREMOVED;
    pub const SENSORUPDATE = C.SDL_SENSORUPDATE;
    pub const RENDER_TARGETS_RESET = C.SDL_RENDER_TARGETS_RESET;
    pub const RENDER_DEVICE_RESET = C.SDL_RENDER_DEVICE_RESET;
    pub const POLLSENTINEL = C.SDL_POLLSENTINEL;
    pub const USER = C.SDL_USEREVENT;
    pub const LAST = C.SDL_LASTEVENT;
};

pub const ButtonState = enum(u8) {
    pressed  = C.SDL_PRESSED,
    released = C.SDL_RELEASED,
};

pub const Color = packed struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,

    pub fn toSdl(c: Color) C.SDL_Color {
        return .{
            .r = c.r,
            .g = c.g,
            .b = c.b,
            .a = c.a,
        };
    }
};

pub const IPoint = packed struct {
    x: i16 = 0,
    y: i16 = 0,

    pub fn init(p: C.SDL_Point) IPoint {
        return .{
            .x = @intCast(i16, p.x),
            .y = @intCast(i16, p.y),
        };
    }

    pub fn inside(p: IPoint, r: IRect) bool {
        if (p.x >= r.x and p.x < r.x + r.w and p.y >= r.y and p.y < r.y + r.h) {
            return true;
        }
        return false;
    }

    pub fn eql(p1: IPoint, p2: IPoint) bool {
        return p1.x == p2.x and p1.y == p2.y;
    }

    pub fn toFloat(p: IPoint) FPoint {
        return .{ .x = @intToFloat(f32, p.x), .y = @intToFloat(f32, p.y), };
    }

    pub fn toRect(p: IPoint) IRect {
        return .{ .x = 0, .y = 0, .w = p.x, .h = p.y, };
    }

    pub fn toSdl(p: IPoint) C.SDL_Point {
        return .{
            .x = p.x,
            .y = p.y,
        };
    }
};

pub const FPoint = packed struct {
    x: f32,
    y: f32,

    pub fn toSdl(p: FPoint) C.SDL_PointF {
        return .{
            .x = p.x,
            .y = p.y,
        };
    }
};

pub const IRect = packed struct {
    x: i16,
    y: i16,
    w: i16,
    h: i16,

    pub fn init(r: C.SDL_Rect) IRect {
        return .{
            .x = @intCast(i16, r.x),
            .y = @intCast(i16, r.y),
            .w = @intCast(i16, r.w),
            .h = @intCast(i16, r.h),
        };
    }

    pub fn size(r: IRect) IPoint {
        return .{ .x = r.w, .y = r.h, };
    }

    pub fn center(r: IRect) IPoint {
        return .{ .x = r.x + (r.w >> 1), .y = r.y + (r.h >> 1), };
    }

    pub fn end(r: IRect) IPoint {
        return .{ .x = r.x + r.w, .y = r.y + r.h, };
    }

    pub fn inscribe(targ: IRect, point: IPoint) IRect {
        return .{ .x = point.x - (targ.w >> 1), .y = point.y - (targ.h >> 1), .w = targ.w, .h = targ.h, };
    }
    
    pub fn overlay(r1: IRect, r2: IRect) IRect {
        const x = if (r1.x > r2.x) r1.x else r2.x;
        const y = if (r1.y > r2.y) r1.y else r2.y;
        const re1 = r1.end();
        const re2 = r2.end();
        return .{
            .x = x,
            .y = y,
            .w = if (re1.x > re2.x) re2.x - x else re1.x - x,
            .h = if (re1.y > re2.y) re2.y - y else re1.y - y,
        };
    }

    pub fn toFloat(r: IRect) FRect {
        return .{
            .x = @intToFloat(f32, r.x),
            .y = @intToFloat(f32, r.y),
            .w = @intToFloat(f32, r.w),
            .h = @intToFloat(f32, r.h),
        };
    }
    pub fn toSdl(r: IRect) C.SDL_Rect {
        return .{
            .x = r.x,
            .y = r.y,
            .w = r.w,
            .h = r.h,
        };
    }
};

pub const FRect = packed struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,

    pub fn toInt(r: FRect) IRect {
        return .{
            .x = @floatToInt(i16, r.x),
            .y = @floatToInt(i16, r.y),
            .w = @floatToInt(i16, r.w),
            .h = @floatToInt(i16, r.h),
        };
    }
    pub fn toSdl(r: FRect) C.SDL_FRect {
        return .{
            .x = r.x,
            .y = r.y,
            .w = r.w,
            .h = r.h,
        };
    }
};

pub const VertexColor = packed struct {
    pos:   FPoint,
    color: Color,
};

pub const VertexTexture = packed struct {
    pos:     FPoint,
    texcord: FPoint,
};

const std = @import("std");
const expect = @import("std").testing.expect;

test "init flags conversion" {
    try expect((InitFlags{ .timer = 1, }).toNum() == C.SDL_INIT_TIMER);
    try expect((InitFlags{ .audio = 1, }).toNum() == C.SDL_INIT_AUDIO);
    try expect((InitFlags{ .video = 1, }).toNum() == C.SDL_INIT_VIDEO);
    try expect((InitFlags{ .joystick = 1, }).toNum() == C.SDL_INIT_JOYSTICK);
    try expect((InitFlags{ .haptic = 1, }).toNum() == C.SDL_INIT_HAPTIC);
    try expect((InitFlags{ .gamectl = 1, }).toNum() == C.SDL_INIT_GAMECONTROLLER);
    try expect((InitFlags{ .events = 1, }).toNum() == C.SDL_INIT_EVENTS);
    try expect((InitFlags{ .sensor = 1, }).toNum() == C.SDL_INIT_SENSOR);
    try expect((InitFlags.all()).toNum() == C.SDL_INIT_EVERYTHING);
}

test "window flags conversion" {
    try expect((WindowFlags{ .fullscreen = 1, }).toNum() == C.SDL_WINDOW_FULLSCREEN);
    try expect((WindowFlags{ .opengl = 1, }).toNum() == C.SDL_WINDOW_OPENGL);
    try expect((WindowFlags{ .shown = 1, }).toNum() == C.SDL_WINDOW_SHOWN);
    try expect((WindowFlags{ .hidden = 1, }).toNum() == C.SDL_WINDOW_HIDDEN);
    try expect((WindowFlags{ .borderless = 1, }).toNum() == C.SDL_WINDOW_BORDERLESS);
    try expect((WindowFlags{ .resizable = 1, }).toNum() == C.SDL_WINDOW_RESIZABLE);
    try expect((WindowFlags{ .minimized = 1, }).toNum() == C.SDL_WINDOW_MINIMIZED);
    try expect((WindowFlags{ .maximized = 1, }).toNum() == C.SDL_WINDOW_MAXIMIZED);
    try expect((WindowFlags{ .mouse_grabbed = 1, }).toNum() == C.SDL_WINDOW_MOUSE_GRABBED);
    try expect((WindowFlags{ .input_focus = 1, }).toNum() == C.SDL_WINDOW_INPUT_FOCUS);
    try expect((WindowFlags{ .mouse_focus = 1, }).toNum() == C.SDL_WINDOW_MOUSE_FOCUS);
    try expect((WindowFlags{ .fullscreen = 1, .desktop = 1, }).toNum() == C.SDL_WINDOW_FULLSCREEN_DESKTOP);
    try expect((WindowFlags{ .allow_highdpi = 1, }).toNum() == C.SDL_WINDOW_ALLOW_HIGHDPI);
    try expect((WindowFlags{ .mouse_capture = 1, }).toNum() == C.SDL_WINDOW_MOUSE_CAPTURE);
    try expect((WindowFlags{ .always_on_top = 1, }).toNum() == C.SDL_WINDOW_ALWAYS_ON_TOP);
    try expect((WindowFlags{ .skip_taskbar = 1, }).toNum() == C.SDL_WINDOW_SKIP_TASKBAR);
    try expect((WindowFlags{ .unility = 1, }).toNum() == C.SDL_WINDOW_UTILITY);
    try expect((WindowFlags{ .tooltip = 1, }).toNum() == C.SDL_WINDOW_TOOLTIP);
    try expect((WindowFlags{ .popup_menu = 1, }).toNum() == C.SDL_WINDOW_POPUP_MENU);
    try expect((WindowFlags{ .keyboard_grabbed = 1, }).toNum() == C.SDL_WINDOW_KEYBOARD_GRABBED);
}

test "render flags conversion" {
    try expect((RendererFlags{ .software = 1, }).toNum() == C.SDL_RENDERER_SOFTWARE);
    try expect((RendererFlags{ .accelerated = 1, }).toNum() == C.SDL_RENDERER_ACCELERATED);
    try expect((RendererFlags{ .vsync = 1, }).toNum() == C.SDL_RENDERER_PRESENTVSYNC);
    try expect((RendererFlags{ .targtex = 1, }).toNum() == C.SDL_RENDERER_TARGETTEXTURE);
}

test "image flags conversion" {
    try expect((ImageFlags{ .jpg = 1, }).toNum() == IMG.IMG_INIT_JPG);
    try expect((ImageFlags{ .png = 1, }).toNum() == IMG.IMG_INIT_PNG);
    try expect((ImageFlags{ .tiff = 1, }).toNum() == IMG.IMG_INIT_TIF);
}
