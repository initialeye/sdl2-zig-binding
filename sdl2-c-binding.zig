pub const wchar_t = u8;
pub const struct___va_list_tag = anyopaque;
pub const FILE = anyopaque;


pub const SDL_INIT_TIMER = 0x00000001;
pub const SDL_INIT_AUDIO = 0x00000010;
pub const SDL_INIT_VIDEO = 0x00000020;
pub const SDL_INIT_JOYSTICK = 0x00000200;
pub const SDL_INIT_HAPTIC = 0x00001000;
pub const SDL_INIT_GAMECONTROLLER = 0x00002000;
pub const SDL_INIT_EVENTS = 0x00004000;
pub const SDL_INIT_SENSOR = 0x00008000;
pub const SDL_INIT_NOPARACHUTE = 0x00100000;
pub const SDL_INIT_EVERYTHING = SDL_INIT_TIMER | SDL_INIT_AUDIO | SDL_INIT_VIDEO | SDL_INIT_EVENTS | SDL_INIT_JOYSTICK | SDL_INIT_HAPTIC | SDL_INIT_GAMECONTROLLER | SDL_INIT_SENSOR;



pub extern fn SDL_GetPlatform() [*c]const u8;
pub const SDL_FALSE: c_int = 0;
pub const SDL_TRUE: c_int = 1;
pub const SDL_bool = c_uint;
pub const SDL_compile_time_assert_uint8 = [1]c_int;
pub const SDL_compile_time_assert_sint8 = [1]c_int;
pub const SDL_compile_time_assert_uint16 = [1]c_int;
pub const SDL_compile_time_assert_sint16 = [1]c_int;
pub const SDL_compile_time_assert_uint32 = [1]c_int;
pub const SDL_compile_time_assert_sint32 = [1]c_int;
pub const SDL_compile_time_assert_uint64 = [1]c_int;
pub const SDL_compile_time_assert_sint64 = [1]c_int;
pub const DUMMY_ENUM_VALUE: c_int = 0;
pub const SDL_DUMMY_ENUM = c_uint;
pub const SDL_compile_time_assert_enum = [1]c_int;
pub extern fn SDL_malloc(size: usize) ?*anyopaque;
pub extern fn SDL_calloc(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free(mem: ?*anyopaque) void;
pub const SDL_malloc_func = ?fn (usize) callconv(.C) ?*anyopaque;
pub const SDL_calloc_func = ?fn (usize, usize) callconv(.C) ?*anyopaque;
pub const SDL_realloc_func = ?fn (?*anyopaque, usize) callconv(.C) ?*anyopaque;
pub const SDL_free_func = ?fn (?*anyopaque) callconv(.C) void;
pub extern fn SDL_GetMemoryFunctions(malloc_func: [*c]SDL_malloc_func, calloc_func: [*c]SDL_calloc_func, realloc_func: [*c]SDL_realloc_func, free_func: [*c]SDL_free_func) void;
pub extern fn SDL_SetMemoryFunctions(malloc_func: SDL_malloc_func, calloc_func: SDL_calloc_func, realloc_func: SDL_realloc_func, free_func: SDL_free_func) c_int;
pub extern fn SDL_GetNumAllocations() c_int;
pub extern fn SDL_getenv(name: [*c]const u8) [*c]u8;
pub extern fn SDL_setenv(name: [*c]const u8, value: [*c]const u8, overwrite: c_int) c_int;
pub extern fn SDL_qsort(base: ?*anyopaque, nmemb: usize, size: usize, compare: ?fn (?*const anyopaque, ?*const anyopaque) callconv(.C) c_int) void;
pub extern fn SDL_abs(x: c_int) c_int;
pub extern fn SDL_isalpha(x: c_int) c_int;
pub extern fn SDL_isalnum(x: c_int) c_int;
pub extern fn SDL_isblank(x: c_int) c_int;
pub extern fn SDL_iscntrl(x: c_int) c_int;
pub extern fn SDL_isdigit(x: c_int) c_int;
pub extern fn SDL_isxdigit(x: c_int) c_int;
pub extern fn SDL_ispunct(x: c_int) c_int;
pub extern fn SDL_isspace(x: c_int) c_int;
pub extern fn SDL_isupper(x: c_int) c_int;
pub extern fn SDL_islower(x: c_int) c_int;
pub extern fn SDL_isprint(x: c_int) c_int;
pub extern fn SDL_isgraph(x: c_int) c_int;
pub extern fn SDL_toupper(x: c_int) c_int;
pub extern fn SDL_tolower(x: c_int) c_int;
pub extern fn SDL_crc32(crc: u32, data: ?*const anyopaque, len: usize) u32;
pub extern fn SDL_memset(dst: ?*anyopaque, c: c_int, len: usize) ?*anyopaque;pub extern fn SDL_memset4(arg_dst: ?*anyopaque, arg_val: u32, arg_dwords: usize) void;
pub extern fn SDL_memcpy(dst: ?*anyopaque, src: ?*const anyopaque, len: usize) ?*anyopaque;
pub extern fn SDL_memmove(dst: ?*anyopaque, src: ?*const anyopaque, len: usize) ?*anyopaque;
pub extern fn SDL_memcmp(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_wcslen(wstr: [*c]const wchar_t) usize;
pub extern fn SDL_wcslcpy(dst: [*c]wchar_t, src: [*c]const wchar_t, maxlen: usize) usize;
pub extern fn SDL_wcslcat(dst: [*c]wchar_t, src: [*c]const wchar_t, maxlen: usize) usize;
pub extern fn SDL_wcsdup(wstr: [*c]const wchar_t) [*c]wchar_t;
pub extern fn SDL_wcsstr(haystack: [*c]const wchar_t, needle: [*c]const wchar_t) [*c]wchar_t;
pub extern fn SDL_wcscmp(str1: [*c]const wchar_t, str2: [*c]const wchar_t) c_int;
pub extern fn SDL_wcsncmp(str1: [*c]const wchar_t, str2: [*c]const wchar_t, maxlen: usize) c_int;
pub extern fn SDL_wcscasecmp(str1: [*c]const wchar_t, str2: [*c]const wchar_t) c_int;
pub extern fn SDL_wcsncasecmp(str1: [*c]const wchar_t, str2: [*c]const wchar_t, len: usize) c_int;
pub extern fn SDL_strlen(str: [*c]const u8) usize;
pub extern fn SDL_strlcpy(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_utf8strlcpy(dst: [*c]u8, src: [*c]const u8, dst_bytes: usize) usize;
pub extern fn SDL_strlcat(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strdup(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strrev(str: [*c]u8) [*c]u8;
pub extern fn SDL_strupr(str: [*c]u8) [*c]u8;
pub extern fn SDL_strlwr(str: [*c]u8) [*c]u8;
pub extern fn SDL_strchr(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strrchr(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strstr(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_strtokr(s1: [*c]u8, s2: [*c]const u8, saveptr: [*c][*c]u8) [*c]u8;
pub extern fn SDL_utf8strlen(str: [*c]const u8) usize;
pub extern fn SDL_itoa(value: c_int, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_uitoa(value: c_uint, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_ltoa(value: c_long, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_ultoa(value: c_ulong, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_lltoa(value: i64, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_ulltoa(value: u64, str: [*c]u8, radix: c_int) [*c]u8;
pub extern fn SDL_atoi(str: [*c]const u8) c_int;
pub extern fn SDL_atof(str: [*c]const u8) f64;
pub extern fn SDL_strtol(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_long;
pub extern fn SDL_strtoul(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) c_ulong;
pub extern fn SDL_strtoll(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) i64;
pub extern fn SDL_strtoull(str: [*c]const u8, endp: [*c][*c]u8, base: c_int) u64;
pub extern fn SDL_strtod(str: [*c]const u8, endp: [*c][*c]u8) f64;
pub extern fn SDL_strcmp(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_strcasecmp(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncasecmp(str1: [*c]const u8, str2: [*c]const u8, len: usize) c_int;
pub extern fn SDL_sscanf(text: [*c]const u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_vsscanf(text: [*c]const u8, fmt: [*c]const u8, ap: [*c]struct___va_list_tag) c_int;
pub extern fn SDL_snprintf(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_vsnprintf(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ap: [*c]struct___va_list_tag) c_int;
pub extern fn SDL_asprintf(strp: [*c][*c]u8, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_vasprintf(strp: [*c][*c]u8, fmt: [*c]const u8, ap: [*c]struct___va_list_tag) c_int;
pub extern fn SDL_acos(x: f64) f64;
pub extern fn SDL_acosf(x: f32) f32;
pub extern fn SDL_asin(x: f64) f64;
pub extern fn SDL_asinf(x: f32) f32;
pub extern fn SDL_atan(x: f64) f64;
pub extern fn SDL_atanf(x: f32) f32;
pub extern fn SDL_atan2(y: f64, x: f64) f64;
pub extern fn SDL_atan2f(y: f32, x: f32) f32;
pub extern fn SDL_ceil(x: f64) f64;
pub extern fn SDL_ceilf(x: f32) f32;
pub extern fn SDL_copysign(x: f64, y: f64) f64;
pub extern fn SDL_copysignf(x: f32, y: f32) f32;
pub extern fn SDL_cos(x: f64) f64;
pub extern fn SDL_cosf(x: f32) f32;
pub extern fn SDL_exp(x: f64) f64;
pub extern fn SDL_expf(x: f32) f32;
pub extern fn SDL_fabs(x: f64) f64;
pub extern fn SDL_fabsf(x: f32) f32;
pub extern fn SDL_floor(x: f64) f64;
pub extern fn SDL_floorf(x: f32) f32;
pub extern fn SDL_trunc(x: f64) f64;
pub extern fn SDL_truncf(x: f32) f32;
pub extern fn SDL_fmod(x: f64, y: f64) f64;
pub extern fn SDL_fmodf(x: f32, y: f32) f32;
pub extern fn SDL_log(x: f64) f64;
pub extern fn SDL_logf(x: f32) f32;
pub extern fn SDL_log10(x: f64) f64;
pub extern fn SDL_log10f(x: f32) f32;
pub extern fn SDL_pow(x: f64, y: f64) f64;
pub extern fn SDL_powf(x: f32, y: f32) f32;
pub extern fn SDL_round(x: f64) f64;
pub extern fn SDL_roundf(x: f32) f32;
pub extern fn SDL_lround(x: f64) c_long;
pub extern fn SDL_lroundf(x: f32) c_long;
pub extern fn SDL_scalbn(x: f64, n: c_int) f64;
pub extern fn SDL_scalbnf(x: f32, n: c_int) f32;
pub extern fn SDL_sin(x: f64) f64;
pub extern fn SDL_sinf(x: f32) f32;
pub extern fn SDL_sqrt(x: f64) f64;
pub extern fn SDL_sqrtf(x: f32) f32;
pub extern fn SDL_tan(x: f64) f64;
pub extern fn SDL_tanf(x: f32) f32;
pub const struct__SDL_iconv_t = opaque {};
pub const SDL_iconv_t = ?*struct__SDL_iconv_t;
pub extern fn SDL_iconv_open(tocode: [*c]const u8, fromcode: [*c]const u8) SDL_iconv_t;
pub extern fn SDL_iconv_close(cd: SDL_iconv_t) c_int;
pub extern fn SDL_iconv(cd: SDL_iconv_t, inbuf: [*c][*c]const u8, inbytesleft: [*c]usize, outbuf: [*c][*c]u8, outbytesleft: [*c]usize) usize;
pub extern fn SDL_iconv_string(tocode: [*c]const u8, fromcode: [*c]const u8, inbuf: [*c]const u8, inbytesleft: usize) [*c]u8;
pub const SDL_main_func = ?fn (c_int, [*c][*c]u8) callconv(.C) c_int;
pub extern fn SDL_main(argc: c_int, argv: [*c][*c]u8) c_int;
pub extern fn SDL_SetMainReady() void;
pub const SDL_ASSERTION_RETRY: c_int = 0;
pub const SDL_ASSERTION_BREAK: c_int = 1;
pub const SDL_ASSERTION_ABORT: c_int = 2;
pub const SDL_ASSERTION_IGNORE: c_int = 3;
pub const SDL_ASSERTION_ALWAYS_IGNORE: c_int = 4;
pub const SDL_AssertState = c_uint;
pub const struct_SDL_AssertData = extern struct {
    always_ignore: c_int,
    trigger_count: c_uint,
    condition: [*c]const u8,
    filename: [*c]const u8,
    linenum: c_int,
    function: [*c]const u8,
    next: [*c]const struct_SDL_AssertData,
};
pub const SDL_AssertData = struct_SDL_AssertData;
pub extern fn SDL_ReportAssertion([*c]SDL_AssertData, [*c]const u8, [*c]const u8, c_int) SDL_AssertState;
pub const SDL_AssertionHandler = ?fn ([*c]const SDL_AssertData, ?*anyopaque) callconv(.C) SDL_AssertState;
pub extern fn SDL_SetAssertionHandler(handler: SDL_AssertionHandler, userdata: ?*anyopaque) void;
pub extern fn SDL_GetDefaultAssertionHandler() SDL_AssertionHandler;
pub extern fn SDL_GetAssertionHandler(puserdata: [*c]?*anyopaque) SDL_AssertionHandler;
pub extern fn SDL_GetAssertionReport() [*c]const SDL_AssertData;
pub extern fn SDL_ResetAssertionReport() void;
pub const SDL_SpinLock = c_int;
pub extern fn SDL_AtomicTryLock(lock: [*c]SDL_SpinLock) SDL_bool;
pub extern fn SDL_AtomicLock(lock: [*c]SDL_SpinLock) void;
pub extern fn SDL_AtomicUnlock(lock: [*c]SDL_SpinLock) void;
pub extern fn SDL_MemoryBarrierReleaseFunction() void;
pub extern fn SDL_MemoryBarrierAcquireFunction() void;
pub const SDL_atomic_t = extern struct {
    value: c_int,
};
pub extern fn SDL_AtomicCAS(a: [*c]SDL_atomic_t, oldval: c_int, newval: c_int) SDL_bool;
pub extern fn SDL_AtomicSet(a: [*c]SDL_atomic_t, v: c_int) c_int;
pub extern fn SDL_AtomicGet(a: [*c]SDL_atomic_t) c_int;
pub extern fn SDL_AtomicAdd(a: [*c]SDL_atomic_t, v: c_int) c_int;
pub extern fn SDL_AtomicCASPtr(a: [*c]?*anyopaque, oldval: ?*anyopaque, newval: ?*anyopaque) SDL_bool;
pub extern fn SDL_AtomicSetPtr(a: [*c]?*anyopaque, v: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_AtomicGetPtr(a: [*c]?*anyopaque) ?*anyopaque;
pub extern fn SDL_SetError(fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_GetError() [*c]const u8;
pub extern fn SDL_GetErrorMsg(errstr: [*c]u8, maxlen: c_int) [*c]u8;
pub extern fn SDL_ClearError() void;
pub const SDL_ENOMEM: c_int = 0;
pub const SDL_EFREAD: c_int = 1;
pub const SDL_EFWRITE: c_int = 2;
pub const SDL_EFSEEK: c_int = 3;
pub const SDL_UNSUPPORTED: c_int = 4;
pub const SDL_LASTERROR: c_int = 5;
pub const SDL_errorcode = c_uint;
pub extern fn SDL_Error(code: SDL_errorcode) c_int;
pub const struct_SDL_mutex = opaque {};
pub const SDL_mutex = struct_SDL_mutex;
pub extern fn SDL_CreateMutex() ?*SDL_mutex;
pub extern fn SDL_LockMutex(mutex: ?*SDL_mutex) c_int;
pub extern fn SDL_TryLockMutex(mutex: ?*SDL_mutex) c_int;
pub extern fn SDL_UnlockMutex(mutex: ?*SDL_mutex) c_int;
pub extern fn SDL_DestroyMutex(mutex: ?*SDL_mutex) void;
pub const struct_SDL_semaphore = opaque {};
pub const SDL_sem = struct_SDL_semaphore;
pub extern fn SDL_CreateSemaphore(initial_value: u32) ?*SDL_sem;
pub extern fn SDL_DestroySemaphore(sem: ?*SDL_sem) void;
pub extern fn SDL_SemWait(sem: ?*SDL_sem) c_int;
pub extern fn SDL_SemTryWait(sem: ?*SDL_sem) c_int;
pub extern fn SDL_SemWaitTimeout(sem: ?*SDL_sem, ms: u32) c_int;
pub extern fn SDL_SemPost(sem: ?*SDL_sem) c_int;
pub extern fn SDL_SemValue(sem: ?*SDL_sem) u32;
pub const struct_SDL_cond = opaque {};
pub const SDL_cond = struct_SDL_cond;
pub extern fn SDL_CreateCond() ?*SDL_cond;
pub extern fn SDL_DestroyCond(cond: ?*SDL_cond) void;
pub extern fn SDL_CondSignal(cond: ?*SDL_cond) c_int;
pub extern fn SDL_CondBroadcast(cond: ?*SDL_cond) c_int;
pub extern fn SDL_CondWait(cond: ?*SDL_cond, mutex: ?*SDL_mutex) c_int;
pub extern fn SDL_CondWaitTimeout(cond: ?*SDL_cond, mutex: ?*SDL_mutex, ms: u32) c_int;
pub const struct_SDL_Thread = opaque {};
pub const SDL_Thread = struct_SDL_Thread;
pub const SDL_threadID = c_ulong;
pub const SDL_TLSID = c_uint;
pub const SDL_THREAD_PRIORITY_LOW: c_int = 0;
pub const SDL_THREAD_PRIORITY_NORMAL: c_int = 1;
pub const SDL_THREAD_PRIORITY_HIGH: c_int = 2;
pub const SDL_THREAD_PRIORITY_TIME_CRITICAL: c_int = 3;
pub const SDL_ThreadPriority = c_uint;
pub const SDL_ThreadFunction = ?fn (?*anyopaque) callconv(.C) c_int;
pub extern fn SDL_CreateThread(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque) ?*SDL_Thread;
pub extern fn SDL_CreateThreadWithStackSize(@"fn": SDL_ThreadFunction, name: [*c]const u8, stacksize: usize, data: ?*anyopaque) ?*SDL_Thread;
pub extern fn SDL_GetThreadName(thread: ?*SDL_Thread) [*c]const u8;
pub extern fn SDL_ThreadID() SDL_threadID;
pub extern fn SDL_GetThreadID(thread: ?*SDL_Thread) SDL_threadID;
pub extern fn SDL_SetThreadPriority(priority: SDL_ThreadPriority) c_int;
pub extern fn SDL_WaitThread(thread: ?*SDL_Thread, status: [*c]c_int) void;
pub extern fn SDL_DetachThread(thread: ?*SDL_Thread) void;
pub extern fn SDL_TLSCreate() SDL_TLSID;
pub extern fn SDL_TLSGet(id: SDL_TLSID) ?*anyopaque;
pub extern fn SDL_TLSSet(id: SDL_TLSID, value: ?*const anyopaque, destructor: ?fn (?*anyopaque) callconv(.C) void) c_int;
pub extern fn SDL_TLSCleanup() void;
const struct_unnamed_10 = extern struct {
    autoclose: SDL_bool,
    fp: [*c]FILE,
};
const struct_unnamed_11 = extern struct {
    base: [*c]u8,
    here: [*c]u8,
    stop: [*c]u8,
};
const struct_unnamed_12 = extern struct {
    data1: ?*anyopaque,
    data2: ?*anyopaque,
};
const union_unnamed_9 = extern union {
    stdio: struct_unnamed_10,
    mem: struct_unnamed_11,
    unknown: struct_unnamed_12,
};
pub const struct_SDL_RWops = extern struct {
    size: ?fn ([*c]struct_SDL_RWops) callconv(.C) i64,
    seek: ?fn ([*c]struct_SDL_RWops, i64, c_int) callconv(.C) i64,
    read: ?fn ([*c]struct_SDL_RWops, ?*anyopaque, usize, usize) callconv(.C) usize,
    write: ?fn ([*c]struct_SDL_RWops, ?*const anyopaque, usize, usize) callconv(.C) usize,
    close: ?fn ([*c]struct_SDL_RWops) callconv(.C) c_int,
    type: u32,
    hidden: union_unnamed_9,
};
pub const SDL_RWops = struct_SDL_RWops;
pub extern fn SDL_RWFromFile(file: [*c]const u8, mode: [*c]const u8) [*c]SDL_RWops;
pub extern fn SDL_RWFromFP(fp: [*c]FILE, autoclose: SDL_bool) [*c]SDL_RWops;
pub extern fn SDL_RWFromMem(mem: ?*anyopaque, size: c_int) [*c]SDL_RWops;
pub extern fn SDL_RWFromConstMem(mem: ?*const anyopaque, size: c_int) [*c]SDL_RWops;
pub extern fn SDL_AllocRW() [*c]SDL_RWops;
pub extern fn SDL_FreeRW(area: [*c]SDL_RWops) void;
pub extern fn SDL_RWsize(context: [*c]SDL_RWops) i64;
pub extern fn SDL_RWseek(context: [*c]SDL_RWops, offset: i64, whence: c_int) i64;
pub extern fn SDL_RWtell(context: [*c]SDL_RWops) i64;
pub extern fn SDL_RWread(context: [*c]SDL_RWops, ptr: ?*anyopaque, size: usize, maxnum: usize) usize;
pub extern fn SDL_RWwrite(context: [*c]SDL_RWops, ptr: ?*const anyopaque, size: usize, num: usize) usize;
pub extern fn SDL_RWclose(context: [*c]SDL_RWops) c_int;
pub extern fn SDL_LoadFile_RW(src: [*c]SDL_RWops, datasize: [*c]usize, freesrc: c_int) ?*anyopaque;
pub extern fn SDL_LoadFile(file: [*c]const u8, datasize: [*c]usize) ?*anyopaque;
pub extern fn SDL_ReadU8(src: [*c]SDL_RWops) u8;
pub extern fn SDL_ReadLE16(src: [*c]SDL_RWops) u16;
pub extern fn SDL_ReadBE16(src: [*c]SDL_RWops) u16;
pub extern fn SDL_ReadLE32(src: [*c]SDL_RWops) u32;
pub extern fn SDL_ReadBE32(src: [*c]SDL_RWops) u32;
pub extern fn SDL_ReadLE64(src: [*c]SDL_RWops) u64;
pub extern fn SDL_ReadBE64(src: [*c]SDL_RWops) u64;
pub extern fn SDL_WriteU8(dst: [*c]SDL_RWops, value: u8) usize;
pub extern fn SDL_WriteLE16(dst: [*c]SDL_RWops, value: u16) usize;
pub extern fn SDL_WriteBE16(dst: [*c]SDL_RWops, value: u16) usize;
pub extern fn SDL_WriteLE32(dst: [*c]SDL_RWops, value: u32) usize;
pub extern fn SDL_WriteBE32(dst: [*c]SDL_RWops, value: u32) usize;
pub extern fn SDL_WriteLE64(dst: [*c]SDL_RWops, value: u64) usize;
pub extern fn SDL_WriteBE64(dst: [*c]SDL_RWops, value: u64) usize;
pub const SDL_AudioFormat = u16;
pub const SDL_AudioCallback = ?fn (?*anyopaque, [*c]u8, c_int) callconv(.C) void;
pub const struct_SDL_AudioSpec = extern struct {
    freq: c_int,
    format: SDL_AudioFormat,
    channels: u8,
    silence: u8,
    samples: u16,
    padding: u16,
    size: u32,
    callback: SDL_AudioCallback,
    userdata: ?*anyopaque,
};
pub const SDL_AudioSpec = struct_SDL_AudioSpec;
pub const SDL_AudioFilter = ?fn ([*c]struct_SDL_AudioCVT, SDL_AudioFormat) callconv(.C) void;
pub const struct_SDL_AudioCVT = extern struct {
    needed: c_int,
    src_format: SDL_AudioFormat,
    dst_format: SDL_AudioFormat,
    rate_incr: f64,
    buf: [*c]u8,
    len: c_int,
    len_cvt: c_int,
    len_mult: c_int,
    len_ratio: f64,
    filters: [10]SDL_AudioFilter,
    filter_index: c_int,
};
pub const SDL_AudioCVT = struct_SDL_AudioCVT;
pub extern fn SDL_GetNumAudioDrivers() c_int;
pub extern fn SDL_GetAudioDriver(index: c_int) [*c]const u8;
pub extern fn SDL_AudioInit(driver_name: [*c]const u8) c_int;
pub extern fn SDL_AudioQuit() void;
pub extern fn SDL_GetCurrentAudioDriver() [*c]const u8;
pub extern fn SDL_OpenAudio(desired: [*c]SDL_AudioSpec, obtained: [*c]SDL_AudioSpec) c_int;
pub const SDL_AudioDeviceID = u32;
pub extern fn SDL_GetNumAudioDevices(iscapture: c_int) c_int;
pub extern fn SDL_GetAudioDeviceName(index: c_int, iscapture: c_int) [*c]const u8;
pub extern fn SDL_GetAudioDeviceSpec(index: c_int, iscapture: c_int, spec: [*c]SDL_AudioSpec) c_int;
pub extern fn SDL_OpenAudioDevice(device: [*c]const u8, iscapture: c_int, desired: [*c]const SDL_AudioSpec, obtained: [*c]SDL_AudioSpec, allowed_changes: c_int) SDL_AudioDeviceID;
pub const SDL_AUDIO_STOPPED: c_int = 0;
pub const SDL_AUDIO_PLAYING: c_int = 1;
pub const SDL_AUDIO_PAUSED: c_int = 2;
pub const SDL_AudioStatus = c_uint;
pub extern fn SDL_GetAudioStatus() SDL_AudioStatus;
pub extern fn SDL_GetAudioDeviceStatus(dev: SDL_AudioDeviceID) SDL_AudioStatus;
pub extern fn SDL_PauseAudio(pause_on: c_int) void;
pub extern fn SDL_PauseAudioDevice(dev: SDL_AudioDeviceID, pause_on: c_int) void;
pub extern fn SDL_LoadWAV_RW(src: [*c]SDL_RWops, freesrc: c_int, spec: [*c]SDL_AudioSpec, audio_buf: [*c][*c]u8, audio_len: [*c]u32) [*c]SDL_AudioSpec;
pub extern fn SDL_FreeWAV(audio_buf: [*c]u8) void;
pub extern fn SDL_BuildAudioCVT(cvt: [*c]SDL_AudioCVT, src_format: SDL_AudioFormat, src_channels: u8, src_rate: c_int, dst_format: SDL_AudioFormat, dst_channels: u8, dst_rate: c_int) c_int;
pub extern fn SDL_ConvertAudio(cvt: [*c]SDL_AudioCVT) c_int;
pub const struct__SDL_AudioStream = opaque {};
pub const SDL_AudioStream = struct__SDL_AudioStream;
pub extern fn SDL_NewAudioStream(src_format: SDL_AudioFormat, src_channels: u8, src_rate: c_int, dst_format: SDL_AudioFormat, dst_channels: u8, dst_rate: c_int) ?*SDL_AudioStream;
pub extern fn SDL_AudioStreamPut(stream: ?*SDL_AudioStream, buf: ?*const anyopaque, len: c_int) c_int;
pub extern fn SDL_AudioStreamGet(stream: ?*SDL_AudioStream, buf: ?*anyopaque, len: c_int) c_int;
pub extern fn SDL_AudioStreamAvailable(stream: ?*SDL_AudioStream) c_int;
pub extern fn SDL_AudioStreamFlush(stream: ?*SDL_AudioStream) c_int;
pub extern fn SDL_AudioStreamClear(stream: ?*SDL_AudioStream) void;
pub extern fn SDL_FreeAudioStream(stream: ?*SDL_AudioStream) void;
pub extern fn SDL_MixAudio(dst: [*c]u8, src: [*c]const u8, len: u32, volume: c_int) void;
pub extern fn SDL_MixAudioFormat(dst: [*c]u8, src: [*c]const u8, format: SDL_AudioFormat, len: u32, volume: c_int) void;
pub extern fn SDL_QueueAudio(dev: SDL_AudioDeviceID, data: ?*const anyopaque, len: u32) c_int;
pub extern fn SDL_DequeueAudio(dev: SDL_AudioDeviceID, data: ?*anyopaque, len: u32) u32;
pub extern fn SDL_GetQueuedAudioSize(dev: SDL_AudioDeviceID) u32;
pub extern fn SDL_ClearQueuedAudio(dev: SDL_AudioDeviceID) void;
pub extern fn SDL_LockAudio() void;
pub extern fn SDL_LockAudioDevice(dev: SDL_AudioDeviceID) void;
pub extern fn SDL_UnlockAudio() void;
pub extern fn SDL_UnlockAudioDevice(dev: SDL_AudioDeviceID) void;
pub extern fn SDL_CloseAudio() void;
pub extern fn SDL_CloseAudioDevice(dev: SDL_AudioDeviceID) void;
pub extern fn SDL_SetClipboardText(text: [*c]const u8) c_int;
pub extern fn SDL_GetClipboardText() [*c]u8;
pub extern fn SDL_HasClipboardText() SDL_bool;pub const struct___uintr_frame = extern struct {
    rip: c_ulonglong,
    rflags: c_ulonglong,
    rsp: c_ulonglong,
};
pub extern fn SDL_GetCPUCacheLineSize() c_int;
pub extern fn SDL_HasRDTSC() SDL_bool;
pub extern fn SDL_HasAltiVec() SDL_bool;
pub extern fn SDL_HasMMX() SDL_bool;
pub extern fn SDL_Has3DNow() SDL_bool;
pub extern fn SDL_HasSSE() SDL_bool;
pub extern fn SDL_HasSSE2() SDL_bool;
pub extern fn SDL_HasSSE3() SDL_bool;
pub extern fn SDL_HasSSE41() SDL_bool;
pub extern fn SDL_HasSSE42() SDL_bool;
pub extern fn SDL_HasAVX() SDL_bool;
pub extern fn SDL_HasAVX2() SDL_bool;
pub extern fn SDL_HasAVX512F() SDL_bool;
pub extern fn SDL_HasARMSIMD() SDL_bool;
pub extern fn SDL_HasNEON() SDL_bool;
pub extern fn SDL_GetSystemRAM() c_int;
pub extern fn SDL_SIMDGetAlignment() usize;
pub extern fn SDL_SIMDAlloc(len: usize) ?*anyopaque;
pub extern fn SDL_SIMDRealloc(mem: ?*anyopaque, len: usize) ?*anyopaque;
pub extern fn SDL_SIMDFree(ptr: ?*anyopaque) void;
pub const SDL_PIXELTYPE_UNKNOWN: c_int = 0;
pub const SDL_PIXELTYPE_INDEX1: c_int = 1;
pub const SDL_PIXELTYPE_INDEX4: c_int = 2;
pub const SDL_PIXELTYPE_INDEX8: c_int = 3;
pub const SDL_PIXELTYPE_PACKED8: c_int = 4;
pub const SDL_PIXELTYPE_PACKED16: c_int = 5;
pub const SDL_PIXELTYPE_PACKED32: c_int = 6;
pub const SDL_PIXELTYPE_ARRAYU8: c_int = 7;
pub const SDL_PIXELTYPE_ARRAYU16: c_int = 8;
pub const SDL_PIXELTYPE_ARRAYU32: c_int = 9;
pub const SDL_PIXELTYPE_ARRAYF16: c_int = 10;
pub const SDL_PIXELTYPE_ARRAYF32: c_int = 11;
pub const SDL_PixelType = c_uint;
pub const SDL_BITMAPORDER_NONE: c_int = 0;
pub const SDL_BITMAPORDER_4321: c_int = 1;
pub const SDL_BITMAPORDER_1234: c_int = 2;
pub const SDL_BitmapOrder = c_uint;
pub const SDL_PACKEDORDER_NONE: c_int = 0;
pub const SDL_PACKEDORDER_XRGB: c_int = 1;
pub const SDL_PACKEDORDER_RGBX: c_int = 2;
pub const SDL_PACKEDORDER_ARGB: c_int = 3;
pub const SDL_PACKEDORDER_RGBA: c_int = 4;
pub const SDL_PACKEDORDER_XBGR: c_int = 5;
pub const SDL_PACKEDORDER_BGRX: c_int = 6;
pub const SDL_PACKEDORDER_ABGR: c_int = 7;
pub const SDL_PACKEDORDER_BGRA: c_int = 8;
pub const SDL_PackedOrder = c_uint;
pub const SDL_ARRAYORDER_NONE: c_int = 0;
pub const SDL_ARRAYORDER_RGB: c_int = 1;
pub const SDL_ARRAYORDER_RGBA: c_int = 2;
pub const SDL_ARRAYORDER_ARGB: c_int = 3;
pub const SDL_ARRAYORDER_BGR: c_int = 4;
pub const SDL_ARRAYORDER_BGRA: c_int = 5;
pub const SDL_ARRAYORDER_ABGR: c_int = 6;
pub const SDL_ArrayOrder = c_uint;
pub const SDL_PACKEDLAYOUT_NONE: c_int = 0;
pub const SDL_PACKEDLAYOUT_332: c_int = 1;
pub const SDL_PACKEDLAYOUT_4444: c_int = 2;
pub const SDL_PACKEDLAYOUT_1555: c_int = 3;
pub const SDL_PACKEDLAYOUT_5551: c_int = 4;
pub const SDL_PACKEDLAYOUT_565: c_int = 5;
pub const SDL_PACKEDLAYOUT_8888: c_int = 6;
pub const SDL_PACKEDLAYOUT_2101010: c_int = 7;
pub const SDL_PACKEDLAYOUT_1010102: c_int = 8;
pub const SDL_PackedLayout = c_uint;
pub const SDL_PIXELFORMAT_UNKNOWN: c_int = 0;
pub const SDL_PIXELFORMAT_INDEX1LSB: c_int = 286261504;
pub const SDL_PIXELFORMAT_INDEX1MSB: c_int = 287310080;
pub const SDL_PIXELFORMAT_INDEX4LSB: c_int = 303039488;
pub const SDL_PIXELFORMAT_INDEX4MSB: c_int = 304088064;
pub const SDL_PIXELFORMAT_INDEX8: c_int = 318769153;
pub const SDL_PIXELFORMAT_RGB332: c_int = 336660481;
pub const SDL_PIXELFORMAT_XRGB4444: c_int = 353504258;
pub const SDL_PIXELFORMAT_RGB444: c_int = 353504258;
pub const SDL_PIXELFORMAT_XBGR4444: c_int = 357698562;
pub const SDL_PIXELFORMAT_BGR444: c_int = 357698562;
pub const SDL_PIXELFORMAT_XRGB1555: c_int = 353570562;
pub const SDL_PIXELFORMAT_RGB555: c_int = 353570562;
pub const SDL_PIXELFORMAT_XBGR1555: c_int = 357764866;
pub const SDL_PIXELFORMAT_BGR555: c_int = 357764866;
pub const SDL_PIXELFORMAT_ARGB4444: c_int = 355602434;
pub const SDL_PIXELFORMAT_RGBA4444: c_int = 356651010;
pub const SDL_PIXELFORMAT_ABGR4444: c_int = 359796738;
pub const SDL_PIXELFORMAT_BGRA4444: c_int = 360845314;
pub const SDL_PIXELFORMAT_ARGB1555: c_int = 355667970;
pub const SDL_PIXELFORMAT_RGBA5551: c_int = 356782082;
pub const SDL_PIXELFORMAT_ABGR1555: c_int = 359862274;
pub const SDL_PIXELFORMAT_BGRA5551: c_int = 360976386;
pub const SDL_PIXELFORMAT_RGB565: c_int = 353701890;
pub const SDL_PIXELFORMAT_BGR565: c_int = 357896194;
pub const SDL_PIXELFORMAT_RGB24: c_int = 386930691;
pub const SDL_PIXELFORMAT_BGR24: c_int = 390076419;
pub const SDL_PIXELFORMAT_XRGB8888: c_int = 370546692;
pub const SDL_PIXELFORMAT_RGB888: c_int = 370546692;
pub const SDL_PIXELFORMAT_RGBX8888: c_int = 371595268;
pub const SDL_PIXELFORMAT_XBGR8888: c_int = 374740996;
pub const SDL_PIXELFORMAT_BGR888: c_int = 374740996;
pub const SDL_PIXELFORMAT_BGRX8888: c_int = 375789572;
pub const SDL_PIXELFORMAT_ARGB8888: c_int = 372645892;
pub const SDL_PIXELFORMAT_RGBA8888: c_int = 373694468;
pub const SDL_PIXELFORMAT_ABGR8888: c_int = 376840196;
pub const SDL_PIXELFORMAT_BGRA8888: c_int = 377888772;
pub const SDL_PIXELFORMAT_ARGB2101010: c_int = 372711428;
pub const SDL_PIXELFORMAT_RGBA32: c_int = 376840196;
pub const SDL_PIXELFORMAT_ARGB32: c_int = 377888772;
pub const SDL_PIXELFORMAT_BGRA32: c_int = 372645892;
pub const SDL_PIXELFORMAT_ABGR32: c_int = 373694468;
pub const SDL_PIXELFORMAT_YV12: c_int = 842094169;
pub const SDL_PIXELFORMAT_IYUV: c_int = 1448433993;
pub const SDL_PIXELFORMAT_YUY2: c_int = 844715353;
pub const SDL_PIXELFORMAT_UYVY: c_int = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: c_int = 1431918169;
pub const SDL_PIXELFORMAT_NV12: c_int = 842094158;
pub const SDL_PIXELFORMAT_NV21: c_int = 825382478;
pub const SDL_PIXELFORMAT_EXTERNAL_OES: c_int = 542328143;
pub const SDL_PixelFormatEnum = c_uint;
pub const struct_SDL_Color = extern struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,
};
pub const SDL_Color = struct_SDL_Color;
pub const struct_SDL_Palette = extern struct {
    ncolors: c_int,
    colors: [*c]SDL_Color,
    version: u32,
    refcount: c_int,
};
pub const SDL_Palette = struct_SDL_Palette;
pub const struct_SDL_PixelFormat = extern struct {
    format: u32,
    palette: [*c]SDL_Palette,
    BitsPerPixel: u8,
    BytesPerPixel: u8,
    padding: [2]u8,
    Rmask: u32,
    Gmask: u32,
    Bmask: u32,
    Amask: u32,
    Rloss: u8,
    Gloss: u8,
    Bloss: u8,
    Aloss: u8,
    Rshift: u8,
    Gshift: u8,
    Bshift: u8,
    Ashift: u8,
    refcount: c_int,
    next: [*c]struct_SDL_PixelFormat,
};
pub const SDL_PixelFormat = struct_SDL_PixelFormat;
pub extern fn SDL_GetPixelFormatName(format: u32) [*c]const u8;
pub extern fn SDL_PixelFormatEnumToMasks(format: u32, bpp: [*c]c_int, Rmask: [*c]u32, Gmask: [*c]u32, Bmask: [*c]u32, Amask: [*c]u32) SDL_bool;
pub extern fn SDL_MasksToPixelFormatEnum(bpp: c_int, Rmask: u32, Gmask: u32, Bmask: u32, Amask: u32) u32;
pub extern fn SDL_AllocFormat(pixel_format: u32) [*c]SDL_PixelFormat;
pub extern fn SDL_FreeFormat(format: [*c]SDL_PixelFormat) void;
pub extern fn SDL_AllocPalette(ncolors: c_int) [*c]SDL_Palette;
pub extern fn SDL_SetPixelFormatPalette(format: [*c]SDL_PixelFormat, palette: [*c]SDL_Palette) c_int;
pub extern fn SDL_SetPaletteColors(palette: [*c]SDL_Palette, colors: [*c]const SDL_Color, firstcolor: c_int, ncolors: c_int) c_int;
pub extern fn SDL_FreePalette(palette: [*c]SDL_Palette) void;
pub extern fn SDL_MapRGB(format: [*c]const SDL_PixelFormat, r: u8, g: u8, b: u8) u32;
pub extern fn SDL_MapRGBA(format: [*c]const SDL_PixelFormat, r: u8, g: u8, b: u8, a: u8) u32;
pub extern fn SDL_GetRGB(pixel: u32, format: [*c]const SDL_PixelFormat, r: [*c]u8, g: [*c]u8, b: [*c]u8) void;
pub extern fn SDL_GetRGBA(pixel: u32, format: [*c]const SDL_PixelFormat, r: [*c]u8, g: [*c]u8, b: [*c]u8, a: [*c]u8) void;
pub extern fn SDL_CalculateGammaRamp(gamma: f32, ramp: [*c]u16) void;
pub const struct_SDL_Point = extern struct {
    x: c_int,
    y: c_int,
};
pub const SDL_Point = struct_SDL_Point;
pub const struct_SDL_FPoint = extern struct {
    x: f32,
    y: f32,
};
pub const SDL_FPoint = struct_SDL_FPoint;
pub const struct_SDL_Rect = extern struct {
    x: c_int,
    y: c_int,
    w: c_int,
    h: c_int,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const struct_SDL_FRect = extern struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,
};
pub const SDL_FRect = struct_SDL_FRect;
pub extern fn SDL_HasIntersection(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect) SDL_bool;
pub extern fn SDL_IntersectRect(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) SDL_bool;
pub extern fn SDL_UnionRect(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) void;
pub extern fn SDL_EnclosePoints(points: [*c]const SDL_Point, count: c_int, clip: [*c]const SDL_Rect, result: [*c]SDL_Rect) SDL_bool;
pub extern fn SDL_IntersectRectAndLine(rect: [*c]const SDL_Rect, X1: [*c]c_int, Y1: [*c]c_int, X2: [*c]c_int, Y2: [*c]c_int) SDL_bool;
pub const SDL_BLENDMODE_NONE: c_int = 0;
pub const SDL_BLENDMODE_BLEND: c_int = 1;
pub const SDL_BLENDMODE_ADD: c_int = 2;
pub const SDL_BLENDMODE_MOD: c_int = 4;
pub const SDL_BLENDMODE_MUL: c_int = 8;
pub const SDL_BLENDMODE_INVALID: c_int = 2147483647;
pub const SDL_BlendMode = c_uint;
pub const SDL_BLENDOPERATION_ADD: c_int = 1;
pub const SDL_BLENDOPERATION_SUBTRACT: c_int = 2;
pub const SDL_BLENDOPERATION_REV_SUBTRACT: c_int = 3;
pub const SDL_BLENDOPERATION_MINIMUM: c_int = 4;
pub const SDL_BLENDOPERATION_MAXIMUM: c_int = 5;
pub const SDL_BlendOperation = c_uint;
pub const SDL_BLENDFACTOR_ZERO: c_int = 1;
pub const SDL_BLENDFACTOR_ONE: c_int = 2;
pub const SDL_BLENDFACTOR_SRC_COLOR: c_int = 3;
pub const SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR: c_int = 4;
pub const SDL_BLENDFACTOR_SRC_ALPHA: c_int = 5;
pub const SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA: c_int = 6;
pub const SDL_BLENDFACTOR_DST_COLOR: c_int = 7;
pub const SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR: c_int = 8;
pub const SDL_BLENDFACTOR_DST_ALPHA: c_int = 9;
pub const SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA: c_int = 10;
pub const SDL_BlendFactor = c_uint;
pub extern fn SDL_ComposeCustomBlendMode(srcColorFactor: SDL_BlendFactor, dstColorFactor: SDL_BlendFactor, colorOperation: SDL_BlendOperation, srcAlphaFactor: SDL_BlendFactor, dstAlphaFactor: SDL_BlendFactor, alphaOperation: SDL_BlendOperation) SDL_BlendMode;
pub const struct_SDL_BlitMap = opaque {};
pub const struct_SDL_Surface = extern struct {
    flags: u32,
    format: [*c]SDL_PixelFormat,
    w: c_int,
    h: c_int,
    pitch: c_int,
    pixels: ?*anyopaque,
    userdata: ?*anyopaque,
    locked: c_int,
    list_blitmap: ?*anyopaque,
    clip_rect: SDL_Rect,
    map: ?*struct_SDL_BlitMap,
    refcount: c_int,
};
pub const SDL_Surface = struct_SDL_Surface;
pub const SDL_blit = ?fn ([*c]struct_SDL_Surface, [*c]SDL_Rect, [*c]struct_SDL_Surface, [*c]SDL_Rect) callconv(.C) c_int;
pub const SDL_YUV_CONVERSION_JPEG: c_int = 0;
pub const SDL_YUV_CONVERSION_BT601: c_int = 1;
pub const SDL_YUV_CONVERSION_BT709: c_int = 2;
pub const SDL_YUV_CONVERSION_AUTOMATIC: c_int = 3;
pub const SDL_YUV_CONVERSION_MODE = c_uint;
pub extern fn SDL_CreateRGBSurface(flags: u32, width: c_int, height: c_int, depth: c_int, Rmask: u32, Gmask: u32, Bmask: u32, Amask: u32) [*c]SDL_Surface;
pub extern fn SDL_CreateRGBSurfaceWithFormat(flags: u32, width: c_int, height: c_int, depth: c_int, format: u32) [*c]SDL_Surface;
pub extern fn SDL_CreateRGBSurfaceFrom(pixels: ?*anyopaque, width: c_int, height: c_int, depth: c_int, pitch: c_int, Rmask: u32, Gmask: u32, Bmask: u32, Amask: u32) [*c]SDL_Surface;
pub extern fn SDL_CreateRGBSurfaceWithFormatFrom(pixels: ?*anyopaque, width: c_int, height: c_int, depth: c_int, pitch: c_int, format: u32) [*c]SDL_Surface;
pub extern fn SDL_FreeSurface(surface: [*c]SDL_Surface) void;
pub extern fn SDL_SetSurfacePalette(surface: [*c]SDL_Surface, palette: [*c]SDL_Palette) c_int;
pub extern fn SDL_LockSurface(surface: [*c]SDL_Surface) c_int;
pub extern fn SDL_UnlockSurface(surface: [*c]SDL_Surface) void;
pub extern fn SDL_LoadBMP_RW(src: [*c]SDL_RWops, freesrc: c_int) [*c]SDL_Surface;
pub extern fn SDL_SaveBMP_RW(surface: [*c]SDL_Surface, dst: [*c]SDL_RWops, freedst: c_int) c_int;
pub extern fn SDL_SetSurfaceRLE(surface: [*c]SDL_Surface, flag: c_int) c_int;
pub extern fn SDL_HasSurfaceRLE(surface: [*c]SDL_Surface) SDL_bool;
pub extern fn SDL_SetColorKey(surface: [*c]SDL_Surface, flag: c_int, key: u32) c_int;
pub extern fn SDL_HasColorKey(surface: [*c]SDL_Surface) SDL_bool;
pub extern fn SDL_GetColorKey(surface: [*c]SDL_Surface, key: [*c]u32) c_int;
pub extern fn SDL_SetSurfaceColorMod(surface: [*c]SDL_Surface, r: u8, g: u8, b: u8) c_int;
pub extern fn SDL_GetSurfaceColorMod(surface: [*c]SDL_Surface, r: [*c]u8, g: [*c]u8, b: [*c]u8) c_int;
pub extern fn SDL_SetSurfaceAlphaMod(surface: [*c]SDL_Surface, alpha: u8) c_int;
pub extern fn SDL_GetSurfaceAlphaMod(surface: [*c]SDL_Surface, alpha: [*c]u8) c_int;
pub extern fn SDL_SetSurfaceBlendMode(surface: [*c]SDL_Surface, blendMode: SDL_BlendMode) c_int;
pub extern fn SDL_GetSurfaceBlendMode(surface: [*c]SDL_Surface, blendMode: [*c]SDL_BlendMode) c_int;
pub extern fn SDL_SetClipRect(surface: [*c]SDL_Surface, rect: [*c]const SDL_Rect) SDL_bool;
pub extern fn SDL_GetClipRect(surface: [*c]SDL_Surface, rect: [*c]SDL_Rect) void;
pub extern fn SDL_DuplicateSurface(surface: [*c]SDL_Surface) [*c]SDL_Surface;
pub extern fn SDL_ConvertSurface(src: [*c]SDL_Surface, fmt: [*c]const SDL_PixelFormat, flags: u32) [*c]SDL_Surface;
pub extern fn SDL_ConvertSurfaceFormat(src: [*c]SDL_Surface, pixel_format: u32, flags: u32) [*c]SDL_Surface;
pub extern fn SDL_ConvertPixels(width: c_int, height: c_int, src_format: u32, src: ?*const anyopaque, src_pitch: c_int, dst_format: u32, dst: ?*anyopaque, dst_pitch: c_int) c_int;
pub extern fn SDL_PremultiplyAlpha(width: c_int, height: c_int, src_format: u32, src: ?*const anyopaque, src_pitch: c_int, dst_format: u32, dst: ?*anyopaque, dst_pitch: c_int) c_int;
pub extern fn SDL_FillRect(dst: [*c]SDL_Surface, rect: [*c]const SDL_Rect, color: u32) c_int;
pub extern fn SDL_FillRects(dst: [*c]SDL_Surface, rects: [*c]const SDL_Rect, count: c_int, color: u32) c_int;
pub extern fn SDL_UpperBlit(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]SDL_Rect) c_int;
pub extern fn SDL_LowerBlit(src: [*c]SDL_Surface, srcrect: [*c]SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]SDL_Rect) c_int;
pub extern fn SDL_SoftStretch(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) c_int;
pub extern fn SDL_SoftStretchLinear(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]const SDL_Rect) c_int;
pub extern fn SDL_UpperBlitScaled(src: [*c]SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]SDL_Rect) c_int;
pub extern fn SDL_LowerBlitScaled(src: [*c]SDL_Surface, srcrect: [*c]SDL_Rect, dst: [*c]SDL_Surface, dstrect: [*c]SDL_Rect) c_int;
pub extern fn SDL_SetYUVConversionMode(mode: SDL_YUV_CONVERSION_MODE) void;
pub extern fn SDL_GetYUVConversionMode() SDL_YUV_CONVERSION_MODE;
pub extern fn SDL_GetYUVConversionModeForResolution(width: c_int, height: c_int) SDL_YUV_CONVERSION_MODE;
pub const SDL_DisplayMode = extern struct {
    format: u32,
    w: c_int,
    h: c_int,
    refresh_rate: c_int,
    driverdata: ?*anyopaque,
};
pub const struct_SDL_Window = opaque {};
pub const SDL_Window = struct_SDL_Window;
pub const SDL_WINDOW_FULLSCREEN: c_int = 1;
pub const SDL_WINDOW_OPENGL: c_int = 2;
pub const SDL_WINDOW_SHOWN: c_int = 4;
pub const SDL_WINDOW_HIDDEN: c_int = 8;
pub const SDL_WINDOW_BORDERLESS: c_int = 16;
pub const SDL_WINDOW_RESIZABLE: c_int = 32;
pub const SDL_WINDOW_MINIMIZED: c_int = 64;
pub const SDL_WINDOW_MAXIMIZED: c_int = 128;
pub const SDL_WINDOW_MOUSE_GRABBED: c_int = 256;
pub const SDL_WINDOW_INPUT_FOCUS: c_int = 512;
pub const SDL_WINDOW_MOUSE_FOCUS: c_int = 1024;
pub const SDL_WINDOW_FULLSCREEN_DESKTOP: c_int = 4097;
pub const SDL_WINDOW_FOREIGN: c_int = 2048;
pub const SDL_WINDOW_ALLOW_HIGHDPI: c_int = 8192;
pub const SDL_WINDOW_MOUSE_CAPTURE: c_int = 16384;
pub const SDL_WINDOW_ALWAYS_ON_TOP: c_int = 32768;
pub const SDL_WINDOW_SKIP_TASKBAR: c_int = 65536;
pub const SDL_WINDOW_UTILITY: c_int = 131072;
pub const SDL_WINDOW_TOOLTIP: c_int = 262144;
pub const SDL_WINDOW_POPUP_MENU: c_int = 524288;
pub const SDL_WINDOW_KEYBOARD_GRABBED: c_int = 1048576;
pub const SDL_WINDOW_VULKAN: c_int = 268435456;
pub const SDL_WINDOW_METAL: c_int = 536870912;
pub const SDL_WINDOW_INPUT_GRABBED: c_int = 256;
pub const SDL_WindowFlags = c_uint;
pub const SDL_WINDOWEVENT_NONE: c_int = 0;
pub const SDL_WINDOWEVENT_SHOWN: c_int = 1;
pub const SDL_WINDOWEVENT_HIDDEN: c_int = 2;
pub const SDL_WINDOWEVENT_EXPOSED: c_int = 3;
pub const SDL_WINDOWEVENT_MOVED: c_int = 4;
pub const SDL_WINDOWEVENT_RESIZED: c_int = 5;
pub const SDL_WINDOWEVENT_SIZE_CHANGED: c_int = 6;
pub const SDL_WINDOWEVENT_MINIMIZED: c_int = 7;
pub const SDL_WINDOWEVENT_MAXIMIZED: c_int = 8;
pub const SDL_WINDOWEVENT_RESTORED: c_int = 9;
pub const SDL_WINDOWEVENT_ENTER: c_int = 10;
pub const SDL_WINDOWEVENT_LEAVE: c_int = 11;
pub const SDL_WINDOWEVENT_FOCUS_GAINED: c_int = 12;
pub const SDL_WINDOWEVENT_FOCUS_LOST: c_int = 13;
pub const SDL_WINDOWEVENT_CLOSE: c_int = 14;
pub const SDL_WINDOWEVENT_TAKE_FOCUS: c_int = 15;
pub const SDL_WINDOWEVENT_HIT_TEST: c_int = 16;
pub const SDL_WINDOWEVENT_ICCPROF_CHANGED: c_int = 17;
pub const SDL_WINDOWEVENT_DISPLAY_CHANGED: c_int = 18;
pub const SDL_WINDOWPOS_UNDEFINED: c_int = @bitCast(c_int, @as(c_uint, 536805376));
pub const SDL_WINDOWPOS_CENTERED: c_int = @bitCast(c_int, @as(c_uint, 805240832));
pub const SDL_WindowEventID = c_uint;
pub const SDL_DISPLAYEVENT_NONE: c_int = 0;
pub const SDL_DISPLAYEVENT_ORIENTATION: c_int = 1;
pub const SDL_DISPLAYEVENT_CONNECTED: c_int = 2;
pub const SDL_DISPLAYEVENT_DISCONNECTED: c_int = 3;
pub const SDL_DisplayEventID = c_uint;
pub const SDL_ORIENTATION_UNKNOWN: c_int = 0;
pub const SDL_ORIENTATION_LANDSCAPE: c_int = 1;
pub const SDL_ORIENTATION_LANDSCAPE_FLIPPED: c_int = 2;
pub const SDL_ORIENTATION_PORTRAIT: c_int = 3;
pub const SDL_ORIENTATION_PORTRAIT_FLIPPED: c_int = 4;
pub const SDL_DisplayOrientation = c_uint;
pub const SDL_FLASH_CANCEL: c_int = 0;
pub const SDL_FLASH_BRIEFLY: c_int = 1;
pub const SDL_FLASH_UNTIL_FOCUSED: c_int = 2;
pub const SDL_FlashOperation = c_uint;
pub const SDL_GLContext = ?*anyopaque;
pub const SDL_GL_RED_SIZE: c_int = 0;
pub const SDL_GL_GREEN_SIZE: c_int = 1;
pub const SDL_GL_BLUE_SIZE: c_int = 2;
pub const SDL_GL_ALPHA_SIZE: c_int = 3;
pub const SDL_GL_BUFFER_SIZE: c_int = 4;
pub const SDL_GL_DOUBLEBUFFER: c_int = 5;
pub const SDL_GL_DEPTH_SIZE: c_int = 6;
pub const SDL_GL_STENCIL_SIZE: c_int = 7;
pub const SDL_GL_ACCUM_RED_SIZE: c_int = 8;
pub const SDL_GL_ACCUM_GREEN_SIZE: c_int = 9;
pub const SDL_GL_ACCUM_BLUE_SIZE: c_int = 10;
pub const SDL_GL_ACCUM_ALPHA_SIZE: c_int = 11;
pub const SDL_GL_STEREO: c_int = 12;
pub const SDL_GL_MULTISAMPLEBUFFERS: c_int = 13;
pub const SDL_GL_MULTISAMPLESAMPLES: c_int = 14;
pub const SDL_GL_ACCELERATED_VISUAL: c_int = 15;
pub const SDL_GL_RETAINED_BACKING: c_int = 16;
pub const SDL_GL_CONTEXT_MAJOR_VERSION: c_int = 17;
pub const SDL_GL_CONTEXT_MINOR_VERSION: c_int = 18;
pub const SDL_GL_CONTEXT_EGL: c_int = 19;
pub const SDL_GL_CONTEXT_FLAGS: c_int = 20;
pub const SDL_GL_CONTEXT_PROFILE_MASK: c_int = 21;
pub const SDL_GL_SHARE_WITH_CURRENT_CONTEXT: c_int = 22;
pub const SDL_GL_FRAMEBUFFER_SRGB_CAPABLE: c_int = 23;
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR: c_int = 24;
pub const SDL_GL_CONTEXT_RESET_NOTIFICATION: c_int = 25;
pub const SDL_GL_CONTEXT_NO_ERROR: c_int = 26;
pub const SDL_GLattr = c_uint;
pub const SDL_GL_CONTEXT_PROFILE_CORE: c_int = 1;
pub const SDL_GL_CONTEXT_PROFILE_COMPATIBILITY: c_int = 2;
pub const SDL_GL_CONTEXT_PROFILE_ES: c_int = 4;
pub const SDL_GLprofile = c_uint;
pub const SDL_GL_CONTEXT_DEBUG_FLAG: c_int = 1;
pub const SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG: c_int = 2;
pub const SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG: c_int = 4;
pub const SDL_GL_CONTEXT_RESET_ISOLATION_FLAG: c_int = 8;
pub const SDL_GLcontextFlag = c_uint;
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE: c_int = 0;
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH: c_int = 1;
pub const SDL_GLcontextReleaseFlag = c_uint;
pub const SDL_GL_CONTEXT_RESET_NO_NOTIFICATION: c_int = 0;
pub const SDL_GL_CONTEXT_RESET_LOSE_CONTEXT: c_int = 1;
pub const SDL_GLContextResetNotification = c_uint;
pub extern fn SDL_GetNumVideoDrivers() c_int;
pub extern fn SDL_GetVideoDriver(index: c_int) [*c]const u8;
pub extern fn SDL_VideoInit(driver_name: [*c]const u8) c_int;
pub extern fn SDL_VideoQuit() void;
pub extern fn SDL_GetCurrentVideoDriver() [*c]const u8;
pub extern fn SDL_GetNumVideoDisplays() c_int;
pub extern fn SDL_GetDisplayName(displayIndex: c_int) [*c]const u8;
pub extern fn SDL_GetDisplayBounds(displayIndex: c_int, rect: [*c]SDL_Rect) c_int;
pub extern fn SDL_GetDisplayUsableBounds(displayIndex: c_int, rect: [*c]SDL_Rect) c_int;
pub extern fn SDL_GetDisplayDPI(displayIndex: c_int, ddpi: [*c]f32, hdpi: [*c]f32, vdpi: [*c]f32) c_int;
pub extern fn SDL_GetDisplayOrientation(displayIndex: c_int) SDL_DisplayOrientation;
pub extern fn SDL_GetNumDisplayModes(displayIndex: c_int) c_int;
pub extern fn SDL_GetDisplayMode(displayIndex: c_int, modeIndex: c_int, mode: [*c]SDL_DisplayMode) c_int;
pub extern fn SDL_GetDesktopDisplayMode(displayIndex: c_int, mode: [*c]SDL_DisplayMode) c_int;
pub extern fn SDL_GetCurrentDisplayMode(displayIndex: c_int, mode: [*c]SDL_DisplayMode) c_int;
pub extern fn SDL_GetClosestDisplayMode(displayIndex: c_int, mode: [*c]const SDL_DisplayMode, closest: [*c]SDL_DisplayMode) [*c]SDL_DisplayMode;
pub extern fn SDL_GetWindowDisplayIndex(window: ?*SDL_Window) c_int;
pub extern fn SDL_SetWindowDisplayMode(window: ?*SDL_Window, mode: [*c]const SDL_DisplayMode) c_int;
pub extern fn SDL_GetWindowDisplayMode(window: ?*SDL_Window, mode: [*c]SDL_DisplayMode) c_int;
pub extern fn SDL_GetWindowICCProfile(window: ?*SDL_Window, size: [*c]usize) ?*anyopaque;
pub extern fn SDL_GetWindowPixelFormat(window: ?*SDL_Window) u32;
pub extern fn SDL_CreateWindow(title: [*c]const u8, x: c_int, y: c_int, w: c_int, h: c_int, flags: u32) ?*SDL_Window;
pub extern fn SDL_CreateWindowFrom(data: ?*const anyopaque) ?*SDL_Window;
pub extern fn SDL_GetWindowID(window: ?*SDL_Window) u32;
pub extern fn SDL_GetWindowFromID(id: u32) ?*SDL_Window;
pub extern fn SDL_GetWindowFlags(window: ?*SDL_Window) u32;
pub extern fn SDL_SetWindowTitle(window: ?*SDL_Window, title: [*c]const u8) void;
pub extern fn SDL_GetWindowTitle(window: ?*SDL_Window) [*c]const u8;
pub extern fn SDL_SetWindowIcon(window: ?*SDL_Window, icon: [*c]SDL_Surface) void;
pub extern fn SDL_SetWindowData(window: ?*SDL_Window, name: [*c]const u8, userdata: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetWindowData(window: ?*SDL_Window, name: [*c]const u8) ?*anyopaque;
pub extern fn SDL_SetWindowPosition(window: ?*SDL_Window, x: c_int, y: c_int) void;
pub extern fn SDL_GetWindowPosition(window: ?*SDL_Window, x: [*c]c_int, y: [*c]c_int) void;
pub extern fn SDL_SetWindowSize(window: ?*SDL_Window, w: c_int, h: c_int) void;
pub extern fn SDL_GetWindowSize(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) void;
pub extern fn SDL_GetWindowBordersSize(window: ?*SDL_Window, top: [*c]c_int, left: [*c]c_int, bottom: [*c]c_int, right: [*c]c_int) c_int;
pub extern fn SDL_SetWindowMinimumSize(window: ?*SDL_Window, min_w: c_int, min_h: c_int) void;
pub extern fn SDL_GetWindowMinimumSize(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) void;
pub extern fn SDL_SetWindowMaximumSize(window: ?*SDL_Window, max_w: c_int, max_h: c_int) void;
pub extern fn SDL_GetWindowMaximumSize(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) void;
pub extern fn SDL_SetWindowBordered(window: ?*SDL_Window, bordered: SDL_bool) void;
pub extern fn SDL_SetWindowResizable(window: ?*SDL_Window, resizable: SDL_bool) void;
pub extern fn SDL_SetWindowAlwaysOnTop(window: ?*SDL_Window, on_top: SDL_bool) void;
pub extern fn SDL_ShowWindow(window: ?*SDL_Window) void;
pub extern fn SDL_HideWindow(window: ?*SDL_Window) void;
pub extern fn SDL_RaiseWindow(window: ?*SDL_Window) void;
pub extern fn SDL_MaximizeWindow(window: ?*SDL_Window) void;
pub extern fn SDL_MinimizeWindow(window: ?*SDL_Window) void;
pub extern fn SDL_RestoreWindow(window: ?*SDL_Window) void;
pub extern fn SDL_SetWindowFullscreen(window: ?*SDL_Window, flags: u32) c_int;
pub extern fn SDL_GetWindowSurface(window: ?*SDL_Window) [*c]SDL_Surface;
pub extern fn SDL_UpdateWindowSurface(window: ?*SDL_Window) c_int;
pub extern fn SDL_UpdateWindowSurfaceRects(window: ?*SDL_Window, rects: [*c]const SDL_Rect, numrects: c_int) c_int;
pub extern fn SDL_SetWindowGrab(window: ?*SDL_Window, grabbed: SDL_bool) void;
pub extern fn SDL_SetWindowKeyboardGrab(window: ?*SDL_Window, grabbed: SDL_bool) void;
pub extern fn SDL_SetWindowMouseGrab(window: ?*SDL_Window, grabbed: SDL_bool) void;
pub extern fn SDL_GetWindowGrab(window: ?*SDL_Window) SDL_bool;
pub extern fn SDL_GetWindowKeyboardGrab(window: ?*SDL_Window) SDL_bool;
pub extern fn SDL_GetWindowMouseGrab(window: ?*SDL_Window) SDL_bool;
pub extern fn SDL_GetGrabbedWindow() ?*SDL_Window;
pub extern fn SDL_SetWindowMouseRect(window: ?*SDL_Window, rect: [*c]const SDL_Rect) c_int;
pub extern fn SDL_GetWindowMouseRect(window: ?*SDL_Window) [*c]const SDL_Rect;
pub extern fn SDL_SetWindowBrightness(window: ?*SDL_Window, brightness: f32) c_int;
pub extern fn SDL_GetWindowBrightness(window: ?*SDL_Window) f32;
pub extern fn SDL_SetWindowOpacity(window: ?*SDL_Window, opacity: f32) c_int;
pub extern fn SDL_GetWindowOpacity(window: ?*SDL_Window, out_opacity: [*c]f32) c_int;
pub extern fn SDL_SetWindowModalFor(modal_window: ?*SDL_Window, parent_window: ?*SDL_Window) c_int;
pub extern fn SDL_SetWindowInputFocus(window: ?*SDL_Window) c_int;
pub extern fn SDL_SetWindowGammaRamp(window: ?*SDL_Window, red: [*c]const u16, green: [*c]const u16, blue: [*c]const u16) c_int;
pub extern fn SDL_GetWindowGammaRamp(window: ?*SDL_Window, red: [*c]u16, green: [*c]u16, blue: [*c]u16) c_int;
pub const SDL_HITTEST_NORMAL: c_int = 0;
pub const SDL_HITTEST_DRAGGABLE: c_int = 1;
pub const SDL_HITTEST_RESIZE_TOPLEFT: c_int = 2;
pub const SDL_HITTEST_RESIZE_TOP: c_int = 3;
pub const SDL_HITTEST_RESIZE_TOPRIGHT: c_int = 4;
pub const SDL_HITTEST_RESIZE_RIGHT: c_int = 5;
pub const SDL_HITTEST_RESIZE_BOTTOMRIGHT: c_int = 6;
pub const SDL_HITTEST_RESIZE_BOTTOM: c_int = 7;
pub const SDL_HITTEST_RESIZE_BOTTOMLEFT: c_int = 8;
pub const SDL_HITTEST_RESIZE_LEFT: c_int = 9;
pub const SDL_HitTestResult = c_uint;
pub const SDL_HitTest = ?fn (?*SDL_Window, [*c]const SDL_Point, ?*anyopaque) callconv(.C) SDL_HitTestResult;
pub extern fn SDL_SetWindowHitTest(window: ?*SDL_Window, callback: SDL_HitTest, callback_data: ?*anyopaque) c_int;
pub extern fn SDL_FlashWindow(window: ?*SDL_Window, operation: SDL_FlashOperation) c_int;
pub extern fn SDL_DestroyWindow(window: ?*SDL_Window) void;
pub extern fn SDL_IsScreenSaverEnabled() SDL_bool;
pub extern fn SDL_EnableScreenSaver() void;
pub extern fn SDL_DisableScreenSaver() void;
pub extern fn SDL_GL_LoadLibrary(path: [*c]const u8) c_int;
pub extern fn SDL_GL_GetProcAddress(proc: [*c]const u8) ?*anyopaque;
pub extern fn SDL_GL_UnloadLibrary() void;
pub extern fn SDL_GL_ExtensionSupported(extension: [*c]const u8) SDL_bool;
pub extern fn SDL_GL_ResetAttributes() void;
pub extern fn SDL_GL_SetAttribute(attr: SDL_GLattr, value: c_int) c_int;
pub extern fn SDL_GL_GetAttribute(attr: SDL_GLattr, value: [*c]c_int) c_int;
pub extern fn SDL_GL_CreateContext(window: ?*SDL_Window) SDL_GLContext;
pub extern fn SDL_GL_MakeCurrent(window: ?*SDL_Window, context: SDL_GLContext) c_int;
pub extern fn SDL_GL_GetCurrentWindow() ?*SDL_Window;
pub extern fn SDL_GL_GetCurrentContext() SDL_GLContext;
pub extern fn SDL_GL_GetDrawableSize(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) void;
pub extern fn SDL_GL_SetSwapInterval(interval: c_int) c_int;
pub extern fn SDL_GL_GetSwapInterval() c_int;
pub extern fn SDL_GL_SwapWindow(window: ?*SDL_Window) void;
pub extern fn SDL_GL_DeleteContext(context: SDL_GLContext) void;
pub const SDL_SCANCODE_UNKNOWN: c_int = 0;
pub const SDL_SCANCODE_A: c_int = 4;
pub const SDL_SCANCODE_B: c_int = 5;
pub const SDL_SCANCODE_C: c_int = 6;
pub const SDL_SCANCODE_D: c_int = 7;
pub const SDL_SCANCODE_E: c_int = 8;
pub const SDL_SCANCODE_F: c_int = 9;
pub const SDL_SCANCODE_G: c_int = 10;
pub const SDL_SCANCODE_H: c_int = 11;
pub const SDL_SCANCODE_I: c_int = 12;
pub const SDL_SCANCODE_J: c_int = 13;
pub const SDL_SCANCODE_K: c_int = 14;
pub const SDL_SCANCODE_L: c_int = 15;
pub const SDL_SCANCODE_M: c_int = 16;
pub const SDL_SCANCODE_N: c_int = 17;
pub const SDL_SCANCODE_O: c_int = 18;
pub const SDL_SCANCODE_P: c_int = 19;
pub const SDL_SCANCODE_Q: c_int = 20;
pub const SDL_SCANCODE_R: c_int = 21;
pub const SDL_SCANCODE_S: c_int = 22;
pub const SDL_SCANCODE_T: c_int = 23;
pub const SDL_SCANCODE_U: c_int = 24;
pub const SDL_SCANCODE_V: c_int = 25;
pub const SDL_SCANCODE_W: c_int = 26;
pub const SDL_SCANCODE_X: c_int = 27;
pub const SDL_SCANCODE_Y: c_int = 28;
pub const SDL_SCANCODE_Z: c_int = 29;
pub const SDL_SCANCODE_1: c_int = 30;
pub const SDL_SCANCODE_2: c_int = 31;
pub const SDL_SCANCODE_3: c_int = 32;
pub const SDL_SCANCODE_4: c_int = 33;
pub const SDL_SCANCODE_5: c_int = 34;
pub const SDL_SCANCODE_6: c_int = 35;
pub const SDL_SCANCODE_7: c_int = 36;
pub const SDL_SCANCODE_8: c_int = 37;
pub const SDL_SCANCODE_9: c_int = 38;
pub const SDL_SCANCODE_0: c_int = 39;
pub const SDL_SCANCODE_RETURN: c_int = 40;
pub const SDL_SCANCODE_ESCAPE: c_int = 41;
pub const SDL_SCANCODE_BACKSPACE: c_int = 42;
pub const SDL_SCANCODE_TAB: c_int = 43;
pub const SDL_SCANCODE_SPACE: c_int = 44;
pub const SDL_SCANCODE_MINUS: c_int = 45;
pub const SDL_SCANCODE_EQUALS: c_int = 46;
pub const SDL_SCANCODE_LEFTBRACKET: c_int = 47;
pub const SDL_SCANCODE_RIGHTBRACKET: c_int = 48;
pub const SDL_SCANCODE_BACKSLASH: c_int = 49;
pub const SDL_SCANCODE_NONUSHASH: c_int = 50;
pub const SDL_SCANCODE_SEMICOLON: c_int = 51;
pub const SDL_SCANCODE_APOSTROPHE: c_int = 52;
pub const SDL_SCANCODE_GRAVE: c_int = 53;
pub const SDL_SCANCODE_COMMA: c_int = 54;
pub const SDL_SCANCODE_PERIOD: c_int = 55;
pub const SDL_SCANCODE_SLASH: c_int = 56;
pub const SDL_SCANCODE_CAPSLOCK: c_int = 57;
pub const SDL_SCANCODE_F1: c_int = 58;
pub const SDL_SCANCODE_F2: c_int = 59;
pub const SDL_SCANCODE_F3: c_int = 60;
pub const SDL_SCANCODE_F4: c_int = 61;
pub const SDL_SCANCODE_F5: c_int = 62;
pub const SDL_SCANCODE_F6: c_int = 63;
pub const SDL_SCANCODE_F7: c_int = 64;
pub const SDL_SCANCODE_F8: c_int = 65;
pub const SDL_SCANCODE_F9: c_int = 66;
pub const SDL_SCANCODE_F10: c_int = 67;
pub const SDL_SCANCODE_F11: c_int = 68;
pub const SDL_SCANCODE_F12: c_int = 69;
pub const SDL_SCANCODE_PRINTSCREEN: c_int = 70;
pub const SDL_SCANCODE_SCROLLLOCK: c_int = 71;
pub const SDL_SCANCODE_PAUSE: c_int = 72;
pub const SDL_SCANCODE_INSERT: c_int = 73;
pub const SDL_SCANCODE_HOME: c_int = 74;
pub const SDL_SCANCODE_PAGEUP: c_int = 75;
pub const SDL_SCANCODE_DELETE: c_int = 76;
pub const SDL_SCANCODE_END: c_int = 77;
pub const SDL_SCANCODE_PAGEDOWN: c_int = 78;
pub const SDL_SCANCODE_RIGHT: c_int = 79;
pub const SDL_SCANCODE_LEFT: c_int = 80;
pub const SDL_SCANCODE_DOWN: c_int = 81;
pub const SDL_SCANCODE_UP: c_int = 82;
pub const SDL_SCANCODE_NUMLOCKCLEAR: c_int = 83;
pub const SDL_SCANCODE_KP_DIVIDE: c_int = 84;
pub const SDL_SCANCODE_KP_MULTIPLY: c_int = 85;
pub const SDL_SCANCODE_KP_MINUS: c_int = 86;
pub const SDL_SCANCODE_KP_PLUS: c_int = 87;
pub const SDL_SCANCODE_KP_ENTER: c_int = 88;
pub const SDL_SCANCODE_KP_1: c_int = 89;
pub const SDL_SCANCODE_KP_2: c_int = 90;
pub const SDL_SCANCODE_KP_3: c_int = 91;
pub const SDL_SCANCODE_KP_4: c_int = 92;
pub const SDL_SCANCODE_KP_5: c_int = 93;
pub const SDL_SCANCODE_KP_6: c_int = 94;
pub const SDL_SCANCODE_KP_7: c_int = 95;
pub const SDL_SCANCODE_KP_8: c_int = 96;
pub const SDL_SCANCODE_KP_9: c_int = 97;
pub const SDL_SCANCODE_KP_0: c_int = 98;
pub const SDL_SCANCODE_KP_PERIOD: c_int = 99;
pub const SDL_SCANCODE_NONUSBACKSLASH: c_int = 100;
pub const SDL_SCANCODE_APPLICATION: c_int = 101;
pub const SDL_SCANCODE_POWER: c_int = 102;
pub const SDL_SCANCODE_KP_EQUALS: c_int = 103;
pub const SDL_SCANCODE_F13: c_int = 104;
pub const SDL_SCANCODE_F14: c_int = 105;
pub const SDL_SCANCODE_F15: c_int = 106;
pub const SDL_SCANCODE_F16: c_int = 107;
pub const SDL_SCANCODE_F17: c_int = 108;
pub const SDL_SCANCODE_F18: c_int = 109;
pub const SDL_SCANCODE_F19: c_int = 110;
pub const SDL_SCANCODE_F20: c_int = 111;
pub const SDL_SCANCODE_F21: c_int = 112;
pub const SDL_SCANCODE_F22: c_int = 113;
pub const SDL_SCANCODE_F23: c_int = 114;
pub const SDL_SCANCODE_F24: c_int = 115;
pub const SDL_SCANCODE_EXECUTE: c_int = 116;
pub const SDL_SCANCODE_HELP: c_int = 117;
pub const SDL_SCANCODE_MENU: c_int = 118;
pub const SDL_SCANCODE_SELECT: c_int = 119;
pub const SDL_SCANCODE_STOP: c_int = 120;
pub const SDL_SCANCODE_AGAIN: c_int = 121;
pub const SDL_SCANCODE_UNDO: c_int = 122;
pub const SDL_SCANCODE_CUT: c_int = 123;
pub const SDL_SCANCODE_COPY: c_int = 124;
pub const SDL_SCANCODE_PASTE: c_int = 125;
pub const SDL_SCANCODE_FIND: c_int = 126;
pub const SDL_SCANCODE_MUTE: c_int = 127;
pub const SDL_SCANCODE_VOLUMEUP: c_int = 128;
pub const SDL_SCANCODE_VOLUMEDOWN: c_int = 129;
pub const SDL_SCANCODE_KP_COMMA: c_int = 133;
pub const SDL_SCANCODE_KP_EQUALSAS400: c_int = 134;
pub const SDL_SCANCODE_INTERNATIONAL1: c_int = 135;
pub const SDL_SCANCODE_INTERNATIONAL2: c_int = 136;
pub const SDL_SCANCODE_INTERNATIONAL3: c_int = 137;
pub const SDL_SCANCODE_INTERNATIONAL4: c_int = 138;
pub const SDL_SCANCODE_INTERNATIONAL5: c_int = 139;
pub const SDL_SCANCODE_INTERNATIONAL6: c_int = 140;
pub const SDL_SCANCODE_INTERNATIONAL7: c_int = 141;
pub const SDL_SCANCODE_INTERNATIONAL8: c_int = 142;
pub const SDL_SCANCODE_INTERNATIONAL9: c_int = 143;
pub const SDL_SCANCODE_LANG1: c_int = 144;
pub const SDL_SCANCODE_LANG2: c_int = 145;
pub const SDL_SCANCODE_LANG3: c_int = 146;
pub const SDL_SCANCODE_LANG4: c_int = 147;
pub const SDL_SCANCODE_LANG5: c_int = 148;
pub const SDL_SCANCODE_LANG6: c_int = 149;
pub const SDL_SCANCODE_LANG7: c_int = 150;
pub const SDL_SCANCODE_LANG8: c_int = 151;
pub const SDL_SCANCODE_LANG9: c_int = 152;
pub const SDL_SCANCODE_ALTERASE: c_int = 153;
pub const SDL_SCANCODE_SYSREQ: c_int = 154;
pub const SDL_SCANCODE_CANCEL: c_int = 155;
pub const SDL_SCANCODE_CLEAR: c_int = 156;
pub const SDL_SCANCODE_PRIOR: c_int = 157;
pub const SDL_SCANCODE_RETURN2: c_int = 158;
pub const SDL_SCANCODE_SEPARATOR: c_int = 159;
pub const SDL_SCANCODE_OUT: c_int = 160;
pub const SDL_SCANCODE_OPER: c_int = 161;
pub const SDL_SCANCODE_CLEARAGAIN: c_int = 162;
pub const SDL_SCANCODE_CRSEL: c_int = 163;
pub const SDL_SCANCODE_EXSEL: c_int = 164;
pub const SDL_SCANCODE_KP_00: c_int = 176;
pub const SDL_SCANCODE_KP_000: c_int = 177;
pub const SDL_SCANCODE_THOUSANDSSEPARATOR: c_int = 178;
pub const SDL_SCANCODE_DECIMALSEPARATOR: c_int = 179;
pub const SDL_SCANCODE_CURRENCYUNIT: c_int = 180;
pub const SDL_SCANCODE_CURRENCYSUBUNIT: c_int = 181;
pub const SDL_SCANCODE_KP_LEFTPAREN: c_int = 182;
pub const SDL_SCANCODE_KP_RIGHTPAREN: c_int = 183;
pub const SDL_SCANCODE_KP_LEFTBRACE: c_int = 184;
pub const SDL_SCANCODE_KP_RIGHTBRACE: c_int = 185;
pub const SDL_SCANCODE_KP_TAB: c_int = 186;
pub const SDL_SCANCODE_KP_BACKSPACE: c_int = 187;
pub const SDL_SCANCODE_KP_A: c_int = 188;
pub const SDL_SCANCODE_KP_B: c_int = 189;
pub const SDL_SCANCODE_KP_C: c_int = 190;
pub const SDL_SCANCODE_KP_D: c_int = 191;
pub const SDL_SCANCODE_KP_E: c_int = 192;
pub const SDL_SCANCODE_KP_F: c_int = 193;
pub const SDL_SCANCODE_KP_XOR: c_int = 194;
pub const SDL_SCANCODE_KP_POWER: c_int = 195;
pub const SDL_SCANCODE_KP_PERCENT: c_int = 196;
pub const SDL_SCANCODE_KP_LESS: c_int = 197;
pub const SDL_SCANCODE_KP_GREATER: c_int = 198;
pub const SDL_SCANCODE_KP_AMPERSAND: c_int = 199;
pub const SDL_SCANCODE_KP_DBLAMPERSAND: c_int = 200;
pub const SDL_SCANCODE_KP_VERTICALBAR: c_int = 201;
pub const SDL_SCANCODE_KP_DBLVERTICALBAR: c_int = 202;
pub const SDL_SCANCODE_KP_COLON: c_int = 203;
pub const SDL_SCANCODE_KP_HASH: c_int = 204;
pub const SDL_SCANCODE_KP_SPACE: c_int = 205;
pub const SDL_SCANCODE_KP_AT: c_int = 206;
pub const SDL_SCANCODE_KP_EXCLAM: c_int = 207;
pub const SDL_SCANCODE_KP_MEMSTORE: c_int = 208;
pub const SDL_SCANCODE_KP_MEMRECALL: c_int = 209;
pub const SDL_SCANCODE_KP_MEMCLEAR: c_int = 210;
pub const SDL_SCANCODE_KP_MEMADD: c_int = 211;
pub const SDL_SCANCODE_KP_MEMSUBTRACT: c_int = 212;
pub const SDL_SCANCODE_KP_MEMMULTIPLY: c_int = 213;
pub const SDL_SCANCODE_KP_MEMDIVIDE: c_int = 214;
pub const SDL_SCANCODE_KP_PLUSMINUS: c_int = 215;
pub const SDL_SCANCODE_KP_CLEAR: c_int = 216;
pub const SDL_SCANCODE_KP_CLEARENTRY: c_int = 217;
pub const SDL_SCANCODE_KP_BINARY: c_int = 218;
pub const SDL_SCANCODE_KP_OCTAL: c_int = 219;
pub const SDL_SCANCODE_KP_DECIMAL: c_int = 220;
pub const SDL_SCANCODE_KP_HEXADECIMAL: c_int = 221;
pub const SDL_SCANCODE_LCTRL: c_int = 224;
pub const SDL_SCANCODE_LSHIFT: c_int = 225;
pub const SDL_SCANCODE_LALT: c_int = 226;
pub const SDL_SCANCODE_LGUI: c_int = 227;
pub const SDL_SCANCODE_RCTRL: c_int = 228;
pub const SDL_SCANCODE_RSHIFT: c_int = 229;
pub const SDL_SCANCODE_RALT: c_int = 230;
pub const SDL_SCANCODE_RGUI: c_int = 231;
pub const SDL_SCANCODE_MODE: c_int = 257;
pub const SDL_SCANCODE_AUDIONEXT: c_int = 258;
pub const SDL_SCANCODE_AUDIOPREV: c_int = 259;
pub const SDL_SCANCODE_AUDIOSTOP: c_int = 260;
pub const SDL_SCANCODE_AUDIOPLAY: c_int = 261;
pub const SDL_SCANCODE_AUDIOMUTE: c_int = 262;
pub const SDL_SCANCODE_MEDIASELECT: c_int = 263;
pub const SDL_SCANCODE_WWW: c_int = 264;
pub const SDL_SCANCODE_MAIL: c_int = 265;
pub const SDL_SCANCODE_CALCULATOR: c_int = 266;
pub const SDL_SCANCODE_COMPUTER: c_int = 267;
pub const SDL_SCANCODE_AC_SEARCH: c_int = 268;
pub const SDL_SCANCODE_AC_HOME: c_int = 269;
pub const SDL_SCANCODE_AC_BACK: c_int = 270;
pub const SDL_SCANCODE_AC_FORWARD: c_int = 271;
pub const SDL_SCANCODE_AC_STOP: c_int = 272;
pub const SDL_SCANCODE_AC_REFRESH: c_int = 273;
pub const SDL_SCANCODE_AC_BOOKMARKS: c_int = 274;
pub const SDL_SCANCODE_BRIGHTNESSDOWN: c_int = 275;
pub const SDL_SCANCODE_BRIGHTNESSUP: c_int = 276;
pub const SDL_SCANCODE_DISPLAYSWITCH: c_int = 277;
pub const SDL_SCANCODE_KBDILLUMTOGGLE: c_int = 278;
pub const SDL_SCANCODE_KBDILLUMDOWN: c_int = 279;
pub const SDL_SCANCODE_KBDILLUMUP: c_int = 280;
pub const SDL_SCANCODE_EJECT: c_int = 281;
pub const SDL_SCANCODE_SLEEP: c_int = 282;
pub const SDL_SCANCODE_APP1: c_int = 283;
pub const SDL_SCANCODE_APP2: c_int = 284;
pub const SDL_SCANCODE_AUDIOREWIND: c_int = 285;
pub const SDL_SCANCODE_AUDIOFASTFORWARD: c_int = 286;
pub const SDL_NUM_SCANCODES: c_int = 512;
pub const SDL_Scancode = c_uint;
pub const SDL_Keycode = i32;
pub const SDLK_UNKNOWN: c_int = 0;
pub const SDLK_RETURN: c_int = 13;
pub const SDLK_ESCAPE: c_int = 27;
pub const SDLK_BACKSPACE: c_int = 8;
pub const SDLK_TAB: c_int = 9;
pub const SDLK_SPACE: c_int = 32;
pub const SDLK_EXCLAIM: c_int = 33;
pub const SDLK_QUOTEDBL: c_int = 34;
pub const SDLK_HASH: c_int = 35;
pub const SDLK_PERCENT: c_int = 37;
pub const SDLK_DOLLAR: c_int = 36;
pub const SDLK_AMPERSAND: c_int = 38;
pub const SDLK_QUOTE: c_int = 39;
pub const SDLK_LEFTPAREN: c_int = 40;
pub const SDLK_RIGHTPAREN: c_int = 41;
pub const SDLK_ASTERISK: c_int = 42;
pub const SDLK_PLUS: c_int = 43;
pub const SDLK_COMMA: c_int = 44;
pub const SDLK_MINUS: c_int = 45;
pub const SDLK_PERIOD: c_int = 46;
pub const SDLK_SLASH: c_int = 47;
pub const SDLK_0: c_int = 48;
pub const SDLK_1: c_int = 49;
pub const SDLK_2: c_int = 50;
pub const SDLK_3: c_int = 51;
pub const SDLK_4: c_int = 52;
pub const SDLK_5: c_int = 53;
pub const SDLK_6: c_int = 54;
pub const SDLK_7: c_int = 55;
pub const SDLK_8: c_int = 56;
pub const SDLK_9: c_int = 57;
pub const SDLK_COLON: c_int = 58;
pub const SDLK_SEMICOLON: c_int = 59;
pub const SDLK_LESS: c_int = 60;
pub const SDLK_EQUALS: c_int = 61;
pub const SDLK_GREATER: c_int = 62;
pub const SDLK_QUESTION: c_int = 63;
pub const SDLK_AT: c_int = 64;
pub const SDLK_LEFTBRACKET: c_int = 91;
pub const SDLK_BACKSLASH: c_int = 92;
pub const SDLK_RIGHTBRACKET: c_int = 93;
pub const SDLK_CARET: c_int = 94;
pub const SDLK_UNDERSCORE: c_int = 95;
pub const SDLK_BACKQUOTE: c_int = 96;
pub const SDLK_a: c_int = 97;
pub const SDLK_b: c_int = 98;
pub const SDLK_c: c_int = 99;
pub const SDLK_d: c_int = 100;
pub const SDLK_e: c_int = 101;
pub const SDLK_f: c_int = 102;
pub const SDLK_g: c_int = 103;
pub const SDLK_h: c_int = 104;
pub const SDLK_i: c_int = 105;
pub const SDLK_j: c_int = 106;
pub const SDLK_k: c_int = 107;
pub const SDLK_l: c_int = 108;
pub const SDLK_m: c_int = 109;
pub const SDLK_n: c_int = 110;
pub const SDLK_o: c_int = 111;
pub const SDLK_p: c_int = 112;
pub const SDLK_q: c_int = 113;
pub const SDLK_r: c_int = 114;
pub const SDLK_s: c_int = 115;
pub const SDLK_t: c_int = 116;
pub const SDLK_u: c_int = 117;
pub const SDLK_v: c_int = 118;
pub const SDLK_w: c_int = 119;
pub const SDLK_x: c_int = 120;
pub const SDLK_y: c_int = 121;
pub const SDLK_z: c_int = 122;
pub const SDLK_CAPSLOCK: c_int = 1073741881;
pub const SDLK_F1: c_int = 1073741882;
pub const SDLK_F2: c_int = 1073741883;
pub const SDLK_F3: c_int = 1073741884;
pub const SDLK_F4: c_int = 1073741885;
pub const SDLK_F5: c_int = 1073741886;
pub const SDLK_F6: c_int = 1073741887;
pub const SDLK_F7: c_int = 1073741888;
pub const SDLK_F8: c_int = 1073741889;
pub const SDLK_F9: c_int = 1073741890;
pub const SDLK_F10: c_int = 1073741891;
pub const SDLK_F11: c_int = 1073741892;
pub const SDLK_F12: c_int = 1073741893;
pub const SDLK_PRINTSCREEN: c_int = 1073741894;
pub const SDLK_SCROLLLOCK: c_int = 1073741895;
pub const SDLK_PAUSE: c_int = 1073741896;
pub const SDLK_INSERT: c_int = 1073741897;
pub const SDLK_HOME: c_int = 1073741898;
pub const SDLK_PAGEUP: c_int = 1073741899;
pub const SDLK_DELETE: c_int = 127;
pub const SDLK_END: c_int = 1073741901;
pub const SDLK_PAGEDOWN: c_int = 1073741902;
pub const SDLK_RIGHT: c_int = 1073741903;
pub const SDLK_LEFT: c_int = 1073741904;
pub const SDLK_DOWN: c_int = 1073741905;
pub const SDLK_UP: c_int = 1073741906;
pub const SDLK_NUMLOCKCLEAR: c_int = 1073741907;
pub const SDLK_KP_DIVIDE: c_int = 1073741908;
pub const SDLK_KP_MULTIPLY: c_int = 1073741909;
pub const SDLK_KP_MINUS: c_int = 1073741910;
pub const SDLK_KP_PLUS: c_int = 1073741911;
pub const SDLK_KP_ENTER: c_int = 1073741912;
pub const SDLK_KP_1: c_int = 1073741913;
pub const SDLK_KP_2: c_int = 1073741914;
pub const SDLK_KP_3: c_int = 1073741915;
pub const SDLK_KP_4: c_int = 1073741916;
pub const SDLK_KP_5: c_int = 1073741917;
pub const SDLK_KP_6: c_int = 1073741918;
pub const SDLK_KP_7: c_int = 1073741919;
pub const SDLK_KP_8: c_int = 1073741920;
pub const SDLK_KP_9: c_int = 1073741921;
pub const SDLK_KP_0: c_int = 1073741922;
pub const SDLK_KP_PERIOD: c_int = 1073741923;
pub const SDLK_APPLICATION: c_int = 1073741925;
pub const SDLK_POWER: c_int = 1073741926;
pub const SDLK_KP_EQUALS: c_int = 1073741927;
pub const SDLK_F13: c_int = 1073741928;
pub const SDLK_F14: c_int = 1073741929;
pub const SDLK_F15: c_int = 1073741930;
pub const SDLK_F16: c_int = 1073741931;
pub const SDLK_F17: c_int = 1073741932;
pub const SDLK_F18: c_int = 1073741933;
pub const SDLK_F19: c_int = 1073741934;
pub const SDLK_F20: c_int = 1073741935;
pub const SDLK_F21: c_int = 1073741936;
pub const SDLK_F22: c_int = 1073741937;
pub const SDLK_F23: c_int = 1073741938;
pub const SDLK_F24: c_int = 1073741939;
pub const SDLK_EXECUTE: c_int = 1073741940;
pub const SDLK_HELP: c_int = 1073741941;
pub const SDLK_MENU: c_int = 1073741942;
pub const SDLK_SELECT: c_int = 1073741943;
pub const SDLK_STOP: c_int = 1073741944;
pub const SDLK_AGAIN: c_int = 1073741945;
pub const SDLK_UNDO: c_int = 1073741946;
pub const SDLK_CUT: c_int = 1073741947;
pub const SDLK_COPY: c_int = 1073741948;
pub const SDLK_PASTE: c_int = 1073741949;
pub const SDLK_FIND: c_int = 1073741950;
pub const SDLK_MUTE: c_int = 1073741951;
pub const SDLK_VOLUMEUP: c_int = 1073741952;
pub const SDLK_VOLUMEDOWN: c_int = 1073741953;
pub const SDLK_KP_COMMA: c_int = 1073741957;
pub const SDLK_KP_EQUALSAS400: c_int = 1073741958;
pub const SDLK_ALTERASE: c_int = 1073741977;
pub const SDLK_SYSREQ: c_int = 1073741978;
pub const SDLK_CANCEL: c_int = 1073741979;
pub const SDLK_CLEAR: c_int = 1073741980;
pub const SDLK_PRIOR: c_int = 1073741981;
pub const SDLK_RETURN2: c_int = 1073741982;
pub const SDLK_SEPARATOR: c_int = 1073741983;
pub const SDLK_OUT: c_int = 1073741984;
pub const SDLK_OPER: c_int = 1073741985;
pub const SDLK_CLEARAGAIN: c_int = 1073741986;
pub const SDLK_CRSEL: c_int = 1073741987;
pub const SDLK_EXSEL: c_int = 1073741988;
pub const SDLK_KP_00: c_int = 1073742000;
pub const SDLK_KP_000: c_int = 1073742001;
pub const SDLK_THOUSANDSSEPARATOR: c_int = 1073742002;
pub const SDLK_DECIMALSEPARATOR: c_int = 1073742003;
pub const SDLK_CURRENCYUNIT: c_int = 1073742004;
pub const SDLK_CURRENCYSUBUNIT: c_int = 1073742005;
pub const SDLK_KP_LEFTPAREN: c_int = 1073742006;
pub const SDLK_KP_RIGHTPAREN: c_int = 1073742007;
pub const SDLK_KP_LEFTBRACE: c_int = 1073742008;
pub const SDLK_KP_RIGHTBRACE: c_int = 1073742009;
pub const SDLK_KP_TAB: c_int = 1073742010;
pub const SDLK_KP_BACKSPACE: c_int = 1073742011;
pub const SDLK_KP_A: c_int = 1073742012;
pub const SDLK_KP_B: c_int = 1073742013;
pub const SDLK_KP_C: c_int = 1073742014;
pub const SDLK_KP_D: c_int = 1073742015;
pub const SDLK_KP_E: c_int = 1073742016;
pub const SDLK_KP_F: c_int = 1073742017;
pub const SDLK_KP_XOR: c_int = 1073742018;
pub const SDLK_KP_POWER: c_int = 1073742019;
pub const SDLK_KP_PERCENT: c_int = 1073742020;
pub const SDLK_KP_LESS: c_int = 1073742021;
pub const SDLK_KP_GREATER: c_int = 1073742022;
pub const SDLK_KP_AMPERSAND: c_int = 1073742023;
pub const SDLK_KP_DBLAMPERSAND: c_int = 1073742024;
pub const SDLK_KP_VERTICALBAR: c_int = 1073742025;
pub const SDLK_KP_DBLVERTICALBAR: c_int = 1073742026;
pub const SDLK_KP_COLON: c_int = 1073742027;
pub const SDLK_KP_HASH: c_int = 1073742028;
pub const SDLK_KP_SPACE: c_int = 1073742029;
pub const SDLK_KP_AT: c_int = 1073742030;
pub const SDLK_KP_EXCLAM: c_int = 1073742031;
pub const SDLK_KP_MEMSTORE: c_int = 1073742032;
pub const SDLK_KP_MEMRECALL: c_int = 1073742033;
pub const SDLK_KP_MEMCLEAR: c_int = 1073742034;
pub const SDLK_KP_MEMADD: c_int = 1073742035;
pub const SDLK_KP_MEMSUBTRACT: c_int = 1073742036;
pub const SDLK_KP_MEMMULTIPLY: c_int = 1073742037;
pub const SDLK_KP_MEMDIVIDE: c_int = 1073742038;
pub const SDLK_KP_PLUSMINUS: c_int = 1073742039;
pub const SDLK_KP_CLEAR: c_int = 1073742040;
pub const SDLK_KP_CLEARENTRY: c_int = 1073742041;
pub const SDLK_KP_BINARY: c_int = 1073742042;
pub const SDLK_KP_OCTAL: c_int = 1073742043;
pub const SDLK_KP_DECIMAL: c_int = 1073742044;
pub const SDLK_KP_HEXADECIMAL: c_int = 1073742045;
pub const SDLK_LCTRL: c_int = 1073742048;
pub const SDLK_LSHIFT: c_int = 1073742049;
pub const SDLK_LALT: c_int = 1073742050;
pub const SDLK_LGUI: c_int = 1073742051;
pub const SDLK_RCTRL: c_int = 1073742052;
pub const SDLK_RSHIFT: c_int = 1073742053;
pub const SDLK_RALT: c_int = 1073742054;
pub const SDLK_RGUI: c_int = 1073742055;
pub const SDLK_MODE: c_int = 1073742081;
pub const SDLK_AUDIONEXT: c_int = 1073742082;
pub const SDLK_AUDIOPREV: c_int = 1073742083;
pub const SDLK_AUDIOSTOP: c_int = 1073742084;
pub const SDLK_AUDIOPLAY: c_int = 1073742085;
pub const SDLK_AUDIOMUTE: c_int = 1073742086;
pub const SDLK_MEDIASELECT: c_int = 1073742087;
pub const SDLK_WWW: c_int = 1073742088;
pub const SDLK_MAIL: c_int = 1073742089;
pub const SDLK_CALCULATOR: c_int = 1073742090;
pub const SDLK_COMPUTER: c_int = 1073742091;
pub const SDLK_AC_SEARCH: c_int = 1073742092;
pub const SDLK_AC_HOME: c_int = 1073742093;
pub const SDLK_AC_BACK: c_int = 1073742094;
pub const SDLK_AC_FORWARD: c_int = 1073742095;
pub const SDLK_AC_STOP: c_int = 1073742096;
pub const SDLK_AC_REFRESH: c_int = 1073742097;
pub const SDLK_AC_BOOKMARKS: c_int = 1073742098;
pub const SDLK_BRIGHTNESSDOWN: c_int = 1073742099;
pub const SDLK_BRIGHTNESSUP: c_int = 1073742100;
pub const SDLK_DISPLAYSWITCH: c_int = 1073742101;
pub const SDLK_KBDILLUMTOGGLE: c_int = 1073742102;
pub const SDLK_KBDILLUMDOWN: c_int = 1073742103;
pub const SDLK_KBDILLUMUP: c_int = 1073742104;
pub const SDLK_EJECT: c_int = 1073742105;
pub const SDLK_SLEEP: c_int = 1073742106;
pub const SDLK_APP1: c_int = 1073742107;
pub const SDLK_APP2: c_int = 1073742108;
pub const SDLK_AUDIOREWIND: c_int = 1073742109;
pub const SDLK_AUDIOFASTFORWARD: c_int = 1073742110;
pub const SDL_KeyCode = c_uint;
pub const KMOD_NONE: c_int = 0;
pub const KMOD_LSHIFT: c_int = 1;
pub const KMOD_RSHIFT: c_int = 2;
pub const KMOD_LCTRL: c_int = 64;
pub const KMOD_RCTRL: c_int = 128;
pub const KMOD_LALT: c_int = 256;
pub const KMOD_RALT: c_int = 512;
pub const KMOD_LGUI: c_int = 1024;
pub const KMOD_RGUI: c_int = 2048;
pub const KMOD_NUM: c_int = 4096;
pub const KMOD_CAPS: c_int = 8192;
pub const KMOD_MODE: c_int = 16384;
pub const KMOD_SCROLL: c_int = 32768;
pub const KMOD_CTRL: c_int = 192;
pub const KMOD_SHIFT: c_int = 3;
pub const KMOD_ALT: c_int = 768;
pub const KMOD_GUI: c_int = 3072;
pub const KMOD_RESERVED: c_int = 32768;
pub const SDL_Keymod = c_uint;
pub const struct_SDL_Keysym = extern struct {
    scancode: SDL_Scancode,
    sym: SDL_Keycode,
    mod: u16,
    unused: u32,
};
pub const SDL_Keysym = struct_SDL_Keysym;
pub extern fn SDL_GetKeyboardFocus() ?*SDL_Window;
pub extern fn SDL_GetKeyboardState(numkeys: [*c]c_int) [*c]const u8;
pub extern fn SDL_GetModState() SDL_Keymod;
pub extern fn SDL_SetModState(modstate: SDL_Keymod) void;
pub extern fn SDL_GetKeyFromScancode(scancode: SDL_Scancode) SDL_Keycode;
pub extern fn SDL_GetScancodeFromKey(key: SDL_Keycode) SDL_Scancode;
pub extern fn SDL_GetScancodeName(scancode: SDL_Scancode) [*c]const u8;
pub extern fn SDL_GetScancodeFromName(name: [*c]const u8) SDL_Scancode;
pub extern fn SDL_GetKeyName(key: SDL_Keycode) [*c]const u8;
pub extern fn SDL_GetKeyFromName(name: [*c]const u8) SDL_Keycode;
pub extern fn SDL_StartTextInput() void;
pub extern fn SDL_IsTextInputActive() SDL_bool;
pub extern fn SDL_StopTextInput() void;
pub extern fn SDL_SetTextInputRect(rect: [*c]SDL_Rect) void;
pub extern fn SDL_HasScreenKeyboardSupport() SDL_bool;
pub extern fn SDL_IsScreenKeyboardShown(window: ?*SDL_Window) SDL_bool;
pub const struct_SDL_Cursor = opaque {};
pub const SDL_Cursor = struct_SDL_Cursor;
pub const SDL_SYSTEM_CURSOR_ARROW: c_int = 0;
pub const SDL_SYSTEM_CURSOR_IBEAM: c_int = 1;
pub const SDL_SYSTEM_CURSOR_WAIT: c_int = 2;
pub const SDL_SYSTEM_CURSOR_CROSSHAIR: c_int = 3;
pub const SDL_SYSTEM_CURSOR_WAITARROW: c_int = 4;
pub const SDL_SYSTEM_CURSOR_SIZENWSE: c_int = 5;
pub const SDL_SYSTEM_CURSOR_SIZENESW: c_int = 6;
pub const SDL_SYSTEM_CURSOR_SIZEWE: c_int = 7;
pub const SDL_SYSTEM_CURSOR_SIZENS: c_int = 8;
pub const SDL_SYSTEM_CURSOR_SIZEALL: c_int = 9;
pub const SDL_SYSTEM_CURSOR_NO: c_int = 10;
pub const SDL_SYSTEM_CURSOR_HAND: c_int = 11;
pub const SDL_NUM_SYSTEM_CURSORS: c_int = 12;
pub const SDL_SystemCursor = c_uint;
pub const SDL_MOUSEWHEEL_NORMAL: c_int = 0;
pub const SDL_MOUSEWHEEL_FLIPPED: c_int = 1;
pub const SDL_RELEASED: u8 = 0;
pub const SDL_PRESSED: u8 = 1;
pub const SDL_MouseWheelDirection = c_uint;
pub extern fn SDL_GetMouseFocus() ?*SDL_Window;
pub extern fn SDL_GetMouseState(x: [*c]c_int, y: [*c]c_int) u32;
pub extern fn SDL_GetGlobalMouseState(x: [*c]c_int, y: [*c]c_int) u32;
pub extern fn SDL_GetRelativeMouseState(x: [*c]c_int, y: [*c]c_int) u32;
pub extern fn SDL_WarpMouseInWindow(window: ?*SDL_Window, x: c_int, y: c_int) void;
pub extern fn SDL_WarpMouseGlobal(x: c_int, y: c_int) c_int;
pub extern fn SDL_SetRelativeMouseMode(enabled: SDL_bool) c_int;
pub extern fn SDL_CaptureMouse(enabled: SDL_bool) c_int;
pub extern fn SDL_GetRelativeMouseMode() SDL_bool;
pub extern fn SDL_CreateCursor(data: [*c]const u8, mask: [*c]const u8, w: c_int, h: c_int, hot_x: c_int, hot_y: c_int) ?*SDL_Cursor;
pub extern fn SDL_CreateColorCursor(surface: [*c]SDL_Surface, hot_x: c_int, hot_y: c_int) ?*SDL_Cursor;
pub extern fn SDL_CreateSystemCursor(id: SDL_SystemCursor) ?*SDL_Cursor;
pub extern fn SDL_SetCursor(cursor: ?*SDL_Cursor) void;
pub extern fn SDL_GetCursor() ?*SDL_Cursor;
pub extern fn SDL_GetDefaultCursor() ?*SDL_Cursor;
pub extern fn SDL_FreeCursor(cursor: ?*SDL_Cursor) void;
pub extern fn SDL_ShowCursor(toggle: c_int) c_int;
pub const struct__SDL_Joystick = opaque {};
pub const SDL_Joystick = struct__SDL_Joystick;
pub const SDL_JoystickGUID = extern struct {
    data: [16]u8,
};
pub const SDL_JoystickID = i32;
pub const SDL_JOYSTICK_TYPE_UNKNOWN: c_int = 0;
pub const SDL_JOYSTICK_TYPE_GAMECONTROLLER: c_int = 1;
pub const SDL_JOYSTICK_TYPE_WHEEL: c_int = 2;
pub const SDL_JOYSTICK_TYPE_ARCADE_STICK: c_int = 3;
pub const SDL_JOYSTICK_TYPE_FLIGHT_STICK: c_int = 4;
pub const SDL_JOYSTICK_TYPE_DANCE_PAD: c_int = 5;
pub const SDL_JOYSTICK_TYPE_GUITAR: c_int = 6;
pub const SDL_JOYSTICK_TYPE_DRUM_KIT: c_int = 7;
pub const SDL_JOYSTICK_TYPE_ARCADE_PAD: c_int = 8;
pub const SDL_JOYSTICK_TYPE_THROTTLE: c_int = 9;
pub const SDL_JoystickType = c_uint;
pub const SDL_JOYSTICK_POWER_UNKNOWN: c_int = -1;
pub const SDL_JOYSTICK_POWER_EMPTY: c_int = 0;
pub const SDL_JOYSTICK_POWER_LOW: c_int = 1;
pub const SDL_JOYSTICK_POWER_MEDIUM: c_int = 2;
pub const SDL_JOYSTICK_POWER_FULL: c_int = 3;
pub const SDL_JOYSTICK_POWER_WIRED: c_int = 4;
pub const SDL_JOYSTICK_POWER_MAX: c_int = 5;
pub const SDL_JoystickPowerLevel = c_int;
pub extern fn SDL_LockJoysticks() void;
pub extern fn SDL_UnlockJoysticks() void;
pub extern fn SDL_NumJoysticks() c_int;
pub extern fn SDL_JoystickNameForIndex(device_index: c_int) [*c]const u8;
pub extern fn SDL_JoystickGetDevicePlayerIndex(device_index: c_int) c_int;
pub extern fn SDL_JoystickGetDeviceGUID(device_index: c_int) SDL_JoystickGUID;
pub extern fn SDL_JoystickGetDeviceVendor(device_index: c_int) u16;
pub extern fn SDL_JoystickGetDeviceProduct(device_index: c_int) u16;
pub extern fn SDL_JoystickGetDeviceProductVersion(device_index: c_int) u16;
pub extern fn SDL_JoystickGetDeviceType(device_index: c_int) SDL_JoystickType;
pub extern fn SDL_JoystickGetDeviceInstanceID(device_index: c_int) SDL_JoystickID;
pub extern fn SDL_JoystickOpen(device_index: c_int) ?*SDL_Joystick;
pub extern fn SDL_JoystickFromInstanceID(instance_id: SDL_JoystickID) ?*SDL_Joystick;
pub extern fn SDL_JoystickFromPlayerIndex(player_index: c_int) ?*SDL_Joystick;
pub extern fn SDL_JoystickAttachVirtual(@"type": SDL_JoystickType, naxes: c_int, nbuttons: c_int, nhats: c_int) c_int;
pub extern fn SDL_JoystickDetachVirtual(device_index: c_int) c_int;
pub extern fn SDL_JoystickIsVirtual(device_index: c_int) SDL_bool;
pub extern fn SDL_JoystickSetVirtualAxis(joystick: ?*SDL_Joystick, axis: c_int, value: i16) c_int;
pub extern fn SDL_JoystickSetVirtualButton(joystick: ?*SDL_Joystick, button: c_int, value: u8) c_int;
pub extern fn SDL_JoystickSetVirtualHat(joystick: ?*SDL_Joystick, hat: c_int, value: u8) c_int;
pub extern fn SDL_JoystickName(joystick: ?*SDL_Joystick) [*c]const u8;
pub extern fn SDL_JoystickGetPlayerIndex(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_JoystickSetPlayerIndex(joystick: ?*SDL_Joystick, player_index: c_int) void;
pub extern fn SDL_JoystickGetGUID(joystick: ?*SDL_Joystick) SDL_JoystickGUID;
pub extern fn SDL_JoystickGetVendor(joystick: ?*SDL_Joystick) u16;
pub extern fn SDL_JoystickGetProduct(joystick: ?*SDL_Joystick) u16;
pub extern fn SDL_JoystickGetProductVersion(joystick: ?*SDL_Joystick) u16;
pub extern fn SDL_JoystickGetSerial(joystick: ?*SDL_Joystick) [*c]const u8;
pub extern fn SDL_JoystickGetType(joystick: ?*SDL_Joystick) SDL_JoystickType;
pub extern fn SDL_JoystickGetGUIDString(guid: SDL_JoystickGUID, pszGUID: [*c]u8, cbGUID: c_int) void;
pub extern fn SDL_JoystickGetGUIDFromString(pchGUID: [*c]const u8) SDL_JoystickGUID;
pub extern fn SDL_JoystickGetAttached(joystick: ?*SDL_Joystick) SDL_bool;
pub extern fn SDL_JoystickInstanceID(joystick: ?*SDL_Joystick) SDL_JoystickID;
pub extern fn SDL_JoystickNumAxes(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_JoystickNumBalls(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_JoystickNumHats(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_JoystickNumButtons(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_JoystickUpdate() void;
pub extern fn SDL_JoystickEventState(state: c_int) c_int;
pub extern fn SDL_JoystickGetAxis(joystick: ?*SDL_Joystick, axis: c_int) i16;
pub extern fn SDL_JoystickGetAxisInitialState(joystick: ?*SDL_Joystick, axis: c_int, state: [*c]i16) SDL_bool;
pub extern fn SDL_JoystickGetHat(joystick: ?*SDL_Joystick, hat: c_int) u8;
pub extern fn SDL_JoystickGetBall(joystick: ?*SDL_Joystick, ball: c_int, dx: [*c]c_int, dy: [*c]c_int) c_int;
pub extern fn SDL_JoystickGetButton(joystick: ?*SDL_Joystick, button: c_int) u8;
pub extern fn SDL_JoystickRumble(joystick: ?*SDL_Joystick, low_frequency_rumble: u16, high_frequency_rumble: u16, duration_ms: u32) c_int;
pub extern fn SDL_JoystickRumbleTriggers(joystick: ?*SDL_Joystick, left_rumble: u16, right_rumble: u16, duration_ms: u32) c_int;
pub extern fn SDL_JoystickHasLED(joystick: ?*SDL_Joystick) SDL_bool;
pub extern fn SDL_JoystickHasRumble(joystick: ?*SDL_Joystick) SDL_bool;
pub extern fn SDL_JoystickHasRumbleTriggers(joystick: ?*SDL_Joystick) SDL_bool;
pub extern fn SDL_JoystickSetLED(joystick: ?*SDL_Joystick, red: u8, green: u8, blue: u8) c_int;
pub extern fn SDL_JoystickSendEffect(joystick: ?*SDL_Joystick, data: ?*const anyopaque, size: c_int) c_int;
pub extern fn SDL_JoystickClose(joystick: ?*SDL_Joystick) void;
pub extern fn SDL_JoystickCurrentPowerLevel(joystick: ?*SDL_Joystick) SDL_JoystickPowerLevel;
pub const struct__SDL_Sensor = opaque {};
pub const SDL_Sensor = struct__SDL_Sensor;
pub const SDL_SensorID = i32;
pub const SDL_SENSOR_INVALID: c_int = -1;
pub const SDL_SENSOR_UNKNOWN: c_int = 0;
pub const SDL_SENSOR_ACCEL: c_int = 1;
pub const SDL_SENSOR_GYRO: c_int = 2;
pub const SDL_SensorType = c_int;
pub extern fn SDL_LockSensors() void;
pub extern fn SDL_UnlockSensors() void;
pub extern fn SDL_NumSensors() c_int;
pub extern fn SDL_SensorGetDeviceName(device_index: c_int) [*c]const u8;
pub extern fn SDL_SensorGetDeviceType(device_index: c_int) SDL_SensorType;
pub extern fn SDL_SensorGetDeviceNonPortableType(device_index: c_int) c_int;
pub extern fn SDL_SensorGetDeviceInstanceID(device_index: c_int) SDL_SensorID;
pub extern fn SDL_SensorOpen(device_index: c_int) ?*SDL_Sensor;
pub extern fn SDL_SensorFromInstanceID(instance_id: SDL_SensorID) ?*SDL_Sensor;
pub extern fn SDL_SensorGetName(sensor: ?*SDL_Sensor) [*c]const u8;
pub extern fn SDL_SensorGetType(sensor: ?*SDL_Sensor) SDL_SensorType;
pub extern fn SDL_SensorGetNonPortableType(sensor: ?*SDL_Sensor) c_int;
pub extern fn SDL_SensorGetInstanceID(sensor: ?*SDL_Sensor) SDL_SensorID;
pub extern fn SDL_SensorGetData(sensor: ?*SDL_Sensor, data: [*c]f32, num_values: c_int) c_int;
pub extern fn SDL_SensorClose(sensor: ?*SDL_Sensor) void;
pub extern fn SDL_SensorUpdate() void;
pub const struct__SDL_GameController = opaque {};
pub const SDL_GameController = struct__SDL_GameController;
pub const SDL_CONTROLLER_TYPE_UNKNOWN: c_int = 0;
pub const SDL_CONTROLLER_TYPE_XBOX360: c_int = 1;
pub const SDL_CONTROLLER_TYPE_XBOXONE: c_int = 2;
pub const SDL_CONTROLLER_TYPE_PS3: c_int = 3;
pub const SDL_CONTROLLER_TYPE_PS4: c_int = 4;
pub const SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO: c_int = 5;
pub const SDL_CONTROLLER_TYPE_VIRTUAL: c_int = 6;
pub const SDL_CONTROLLER_TYPE_PS5: c_int = 7;
pub const SDL_CONTROLLER_TYPE_AMAZON_LUNA: c_int = 8;
pub const SDL_CONTROLLER_TYPE_GOOGLE_STADIA: c_int = 9;
pub const SDL_GameControllerType = c_uint;
pub const SDL_CONTROLLER_BINDTYPE_NONE: c_int = 0;
pub const SDL_CONTROLLER_BINDTYPE_BUTTON: c_int = 1;
pub const SDL_CONTROLLER_BINDTYPE_AXIS: c_int = 2;
pub const SDL_CONTROLLER_BINDTYPE_HAT: c_int = 3;
pub const SDL_GameControllerBindType = c_uint;
const struct_unnamed_14 = extern struct {
    hat: c_int,
    hat_mask: c_int,
};
const union_unnamed_13 = extern union {
    button: c_int,
    axis: c_int,
    hat: struct_unnamed_14,
};
pub const struct_SDL_GameControllerButtonBind = extern struct {
    bindType: SDL_GameControllerBindType,
    value: union_unnamed_13,
};
pub const SDL_GameControllerButtonBind = struct_SDL_GameControllerButtonBind;
pub extern fn SDL_GameControllerAddMappingsFromRW(rw: [*c]SDL_RWops, freerw: c_int) c_int;
pub extern fn SDL_GameControllerAddMapping(mappingString: [*c]const u8) c_int;
pub extern fn SDL_GameControllerNumMappings() c_int;
pub extern fn SDL_GameControllerMappingForIndex(mapping_index: c_int) [*c]u8;
pub extern fn SDL_GameControllerMappingForGUID(guid: SDL_JoystickGUID) [*c]u8;
pub extern fn SDL_GameControllerMapping(gamecontroller: ?*SDL_GameController) [*c]u8;
pub extern fn SDL_IsGameController(joystick_index: c_int) SDL_bool;
pub extern fn SDL_GameControllerNameForIndex(joystick_index: c_int) [*c]const u8;
pub extern fn SDL_GameControllerTypeForIndex(joystick_index: c_int) SDL_GameControllerType;
pub extern fn SDL_GameControllerMappingForDeviceIndex(joystick_index: c_int) [*c]u8;
pub extern fn SDL_GameControllerOpen(joystick_index: c_int) ?*SDL_GameController;
pub extern fn SDL_GameControllerFromInstanceID(joyid: SDL_JoystickID) ?*SDL_GameController;
pub extern fn SDL_GameControllerFromPlayerIndex(player_index: c_int) ?*SDL_GameController;
pub extern fn SDL_GameControllerName(gamecontroller: ?*SDL_GameController) [*c]const u8;
pub extern fn SDL_GameControllerGetType(gamecontroller: ?*SDL_GameController) SDL_GameControllerType;
pub extern fn SDL_GameControllerGetPlayerIndex(gamecontroller: ?*SDL_GameController) c_int;
pub extern fn SDL_GameControllerSetPlayerIndex(gamecontroller: ?*SDL_GameController, player_index: c_int) void;
pub extern fn SDL_GameControllerGetVendor(gamecontroller: ?*SDL_GameController) u16;
pub extern fn SDL_GameControllerGetProduct(gamecontroller: ?*SDL_GameController) u16;
pub extern fn SDL_GameControllerGetProductVersion(gamecontroller: ?*SDL_GameController) u16;
pub extern fn SDL_GameControllerGetSerial(gamecontroller: ?*SDL_GameController) [*c]const u8;
pub extern fn SDL_GameControllerGetAttached(gamecontroller: ?*SDL_GameController) SDL_bool;
pub extern fn SDL_GameControllerGetJoystick(gamecontroller: ?*SDL_GameController) ?*SDL_Joystick;
pub extern fn SDL_GameControllerEventState(state: c_int) c_int;
pub extern fn SDL_GameControllerUpdate() void;
pub const SDL_CONTROLLER_AXIS_INVALID: c_int = -1;
pub const SDL_CONTROLLER_AXIS_LEFTX: c_int = 0;
pub const SDL_CONTROLLER_AXIS_LEFTY: c_int = 1;
pub const SDL_CONTROLLER_AXIS_RIGHTX: c_int = 2;
pub const SDL_CONTROLLER_AXIS_RIGHTY: c_int = 3;
pub const SDL_CONTROLLER_AXIS_TRIGGERLEFT: c_int = 4;
pub const SDL_CONTROLLER_AXIS_TRIGGERRIGHT: c_int = 5;
pub const SDL_CONTROLLER_AXIS_MAX: c_int = 6;
pub const SDL_GameControllerAxis = c_int;
pub extern fn SDL_GameControllerGetAxisFromString(str: [*c]const u8) SDL_GameControllerAxis;
pub extern fn SDL_GameControllerGetStringForAxis(axis: SDL_GameControllerAxis) [*c]const u8;
pub extern fn SDL_GameControllerGetBindForAxis(gamecontroller: ?*SDL_GameController, axis: SDL_GameControllerAxis) SDL_GameControllerButtonBind;
pub extern fn SDL_GameControllerHasAxis(gamecontroller: ?*SDL_GameController, axis: SDL_GameControllerAxis) SDL_bool;
pub extern fn SDL_GameControllerGetAxis(gamecontroller: ?*SDL_GameController, axis: SDL_GameControllerAxis) i16;
pub const SDL_CONTROLLER_BUTTON_INVALID: c_int = -1;
pub const SDL_CONTROLLER_BUTTON_A: c_int = 0;
pub const SDL_CONTROLLER_BUTTON_B: c_int = 1;
pub const SDL_CONTROLLER_BUTTON_X: c_int = 2;
pub const SDL_CONTROLLER_BUTTON_Y: c_int = 3;
pub const SDL_CONTROLLER_BUTTON_BACK: c_int = 4;
pub const SDL_CONTROLLER_BUTTON_GUIDE: c_int = 5;
pub const SDL_CONTROLLER_BUTTON_START: c_int = 6;
pub const SDL_CONTROLLER_BUTTON_LEFTSTICK: c_int = 7;
pub const SDL_CONTROLLER_BUTTON_RIGHTSTICK: c_int = 8;
pub const SDL_CONTROLLER_BUTTON_LEFTSHOULDER: c_int = 9;
pub const SDL_CONTROLLER_BUTTON_RIGHTSHOULDER: c_int = 10;
pub const SDL_CONTROLLER_BUTTON_DPAD_UP: c_int = 11;
pub const SDL_CONTROLLER_BUTTON_DPAD_DOWN: c_int = 12;
pub const SDL_CONTROLLER_BUTTON_DPAD_LEFT: c_int = 13;
pub const SDL_CONTROLLER_BUTTON_DPAD_RIGHT: c_int = 14;
pub const SDL_CONTROLLER_BUTTON_MISC1: c_int = 15;
pub const SDL_CONTROLLER_BUTTON_PADDLE1: c_int = 16;
pub const SDL_CONTROLLER_BUTTON_PADDLE2: c_int = 17;
pub const SDL_CONTROLLER_BUTTON_PADDLE3: c_int = 18;
pub const SDL_CONTROLLER_BUTTON_PADDLE4: c_int = 19;
pub const SDL_CONTROLLER_BUTTON_TOUCHPAD: c_int = 20;
pub const SDL_CONTROLLER_BUTTON_MAX: c_int = 21;
pub const SDL_GameControllerButton = c_int;
pub extern fn SDL_GameControllerGetButtonFromString(str: [*c]const u8) SDL_GameControllerButton;
pub extern fn SDL_GameControllerGetStringForButton(button: SDL_GameControllerButton) [*c]const u8;
pub extern fn SDL_GameControllerGetBindForButton(gamecontroller: ?*SDL_GameController, button: SDL_GameControllerButton) SDL_GameControllerButtonBind;
pub extern fn SDL_GameControllerHasButton(gamecontroller: ?*SDL_GameController, button: SDL_GameControllerButton) SDL_bool;
pub extern fn SDL_GameControllerGetButton(gamecontroller: ?*SDL_GameController, button: SDL_GameControllerButton) u8;
pub extern fn SDL_GameControllerGetNumTouchpads(gamecontroller: ?*SDL_GameController) c_int;
pub extern fn SDL_GameControllerGetNumTouchpadFingers(gamecontroller: ?*SDL_GameController, touchpad: c_int) c_int;
pub extern fn SDL_GameControllerGetTouchpadFinger(gamecontroller: ?*SDL_GameController, touchpad: c_int, finger: c_int, state: [*c]u8, x: [*c]f32, y: [*c]f32, pressure: [*c]f32) c_int;
pub extern fn SDL_GameControllerHasSensor(gamecontroller: ?*SDL_GameController, @"type": SDL_SensorType) SDL_bool;
pub extern fn SDL_GameControllerSetSensorEnabled(gamecontroller: ?*SDL_GameController, @"type": SDL_SensorType, enabled: SDL_bool) c_int;
pub extern fn SDL_GameControllerIsSensorEnabled(gamecontroller: ?*SDL_GameController, @"type": SDL_SensorType) SDL_bool;
pub extern fn SDL_GameControllerGetSensorDataRate(gamecontroller: ?*SDL_GameController, @"type": SDL_SensorType) f32;
pub extern fn SDL_GameControllerGetSensorData(gamecontroller: ?*SDL_GameController, @"type": SDL_SensorType, data: [*c]f32, num_values: c_int) c_int;
pub extern fn SDL_GameControllerRumble(gamecontroller: ?*SDL_GameController, low_frequency_rumble: u16, high_frequency_rumble: u16, duration_ms: u32) c_int;
pub extern fn SDL_GameControllerRumbleTriggers(gamecontroller: ?*SDL_GameController, left_rumble: u16, right_rumble: u16, duration_ms: u32) c_int;
pub extern fn SDL_GameControllerHasLED(gamecontroller: ?*SDL_GameController) SDL_bool;
pub extern fn SDL_GameControllerHasRumble(gamecontroller: ?*SDL_GameController) SDL_bool;
pub extern fn SDL_GameControllerHasRumbleTriggers(gamecontroller: ?*SDL_GameController) SDL_bool;
pub extern fn SDL_GameControllerSetLED(gamecontroller: ?*SDL_GameController, red: u8, green: u8, blue: u8) c_int;
pub extern fn SDL_GameControllerSendEffect(gamecontroller: ?*SDL_GameController, data: ?*const anyopaque, size: c_int) c_int;
pub extern fn SDL_GameControllerClose(gamecontroller: ?*SDL_GameController) void;
pub extern fn SDL_GameControllerGetAppleSFSymbolsNameForButton(gamecontroller: ?*SDL_GameController, button: SDL_GameControllerButton) [*c]const u8;
pub extern fn SDL_GameControllerGetAppleSFSymbolsNameForAxis(gamecontroller: ?*SDL_GameController, axis: SDL_GameControllerAxis) [*c]const u8;
pub const SDL_TouchID = i64;
pub const SDL_FingerID = i64;
pub const SDL_TOUCH_DEVICE_INVALID: c_int = -1;
pub const SDL_TOUCH_DEVICE_DIRECT: c_int = 0;
pub const SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE: c_int = 1;
pub const SDL_TOUCH_DEVICE_INDIRECT_RELATIVE: c_int = 2;
pub const SDL_TouchDeviceType = c_int;
pub const struct_SDL_Finger = extern struct {
    id: SDL_FingerID,
    x: f32,
    y: f32,
    pressure: f32,
};
pub const SDL_Finger = struct_SDL_Finger;
pub extern fn SDL_GetNumTouchDevices() c_int;
pub extern fn SDL_GetTouchDevice(index: c_int) SDL_TouchID;
pub extern fn SDL_GetTouchDeviceType(touchID: SDL_TouchID) SDL_TouchDeviceType;
pub extern fn SDL_GetNumTouchFingers(touchID: SDL_TouchID) c_int;
pub extern fn SDL_GetTouchFinger(touchID: SDL_TouchID, index: c_int) [*c]SDL_Finger;
pub const SDL_GestureID = i64;
pub extern fn SDL_RecordGesture(touchId: SDL_TouchID) c_int;
pub extern fn SDL_SaveAllDollarTemplates(dst: [*c]SDL_RWops) c_int;
pub extern fn SDL_SaveDollarTemplate(gestureId: SDL_GestureID, dst: [*c]SDL_RWops) c_int;
pub extern fn SDL_LoadDollarTemplates(touchId: SDL_TouchID, src: [*c]SDL_RWops) c_int;
pub const SDL_FIRSTEVENT: c_int = 0;
pub const SDL_QUIT: c_int = 256;
pub const SDL_APP_TERMINATING: c_int = 257;
pub const SDL_APP_LOWMEMORY: c_int = 258;
pub const SDL_APP_WILLENTERBACKGROUND: c_int = 259;
pub const SDL_APP_DIDENTERBACKGROUND: c_int = 260;
pub const SDL_APP_WILLENTERFOREGROUND: c_int = 261;
pub const SDL_APP_DIDENTERFOREGROUND: c_int = 262;
pub const SDL_LOCALECHANGED: c_int = 263;
pub const SDL_DISPLAYEVENT: c_int = 336;
pub const SDL_WINDOWEVENT: c_int = 512;
pub const SDL_SYSWMEVENT: c_int = 513;
pub const SDL_KEYDOWN: c_int = 768;
pub const SDL_KEYUP: c_int = 769;
pub const SDL_TEXTEDITING: c_int = 770;
pub const SDL_TEXTINPUT: c_int = 771;
pub const SDL_KEYMAPCHANGED: c_int = 772;
pub const SDL_MOUSEMOTION: c_int = 1024;
pub const SDL_MOUSEBUTTONDOWN: c_int = 1025;
pub const SDL_MOUSEBUTTONUP: c_int = 1026;
pub const SDL_MOUSEWHEEL: c_int = 1027;
pub const SDL_JOYAXISMOTION: c_int = 1536;
pub const SDL_JOYBALLMOTION: c_int = 1537;
pub const SDL_JOYHATMOTION: c_int = 1538;
pub const SDL_JOYBUTTONDOWN: c_int = 1539;
pub const SDL_JOYBUTTONUP: c_int = 1540;
pub const SDL_JOYDEVICEADDED: c_int = 1541;
pub const SDL_JOYDEVICEREMOVED: c_int = 1542;
pub const SDL_CONTROLLERAXISMOTION: c_int = 1616;
pub const SDL_CONTROLLERBUTTONDOWN: c_int = 1617;
pub const SDL_CONTROLLERBUTTONUP: c_int = 1618;
pub const SDL_CONTROLLERDEVICEADDED: c_int = 1619;
pub const SDL_CONTROLLERDEVICEREMOVED: c_int = 1620;
pub const SDL_CONTROLLERDEVICEREMAPPED: c_int = 1621;
pub const SDL_CONTROLLERTOUCHPADDOWN: c_int = 1622;
pub const SDL_CONTROLLERTOUCHPADMOTION: c_int = 1623;
pub const SDL_CONTROLLERTOUCHPADUP: c_int = 1624;
pub const SDL_CONTROLLERSENSORUPDATE: c_int = 1625;
pub const SDL_FINGERDOWN: c_int = 1792;
pub const SDL_FINGERUP: c_int = 1793;
pub const SDL_FINGERMOTION: c_int = 1794;
pub const SDL_DOLLARGESTURE: c_int = 2048;
pub const SDL_DOLLARRECORD: c_int = 2049;
pub const SDL_MULTIGESTURE: c_int = 2050;
pub const SDL_CLIPBOARDUPDATE: c_int = 2304;
pub const SDL_DROPFILE: c_int = 4096;
pub const SDL_DROPTEXT: c_int = 4097;
pub const SDL_DROPBEGIN: c_int = 4098;
pub const SDL_DROPCOMPLETE: c_int = 4099;
pub const SDL_AUDIODEVICEADDED: c_int = 4352;
pub const SDL_AUDIODEVICEREMOVED: c_int = 4353;
pub const SDL_SENSORUPDATE: c_int = 4608;
pub const SDL_RENDER_TARGETS_RESET: c_int = 8192;
pub const SDL_RENDER_DEVICE_RESET: c_int = 8193;
pub const SDL_POLLSENTINEL: c_int = 32512;
pub const SDL_USEREVENT: c_int = 32768;
pub const SDL_LASTEVENT: c_int = 65535;
pub const SDL_EventType = c_uint;
pub const struct_SDL_CommonEvent = extern struct {
    type: u32,
    timestamp: u32,
};
pub const SDL_CommonEvent = struct_SDL_CommonEvent;
pub const struct_SDL_DisplayEvent = extern struct {
    type: u32,
    timestamp: u32,
    display: u32,
    event: u8,
    padding1: u8,
    padding2: u8,
    padding3: u8,
    data1: i32,
};
pub const SDL_DisplayEvent = struct_SDL_DisplayEvent;
pub const struct_SDL_WindowEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    event: u8,
    padding1: u8,
    padding2: u8,
    padding3: u8,
    data1: i32,
    data2: i32,
};
pub const SDL_WindowEvent = struct_SDL_WindowEvent;
pub const struct_SDL_KeyboardEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    state: u8,
    repeat: u8,
    padding2: u8,
    padding3: u8,
    keysym: SDL_Keysym,
};
pub const SDL_KeyboardEvent = struct_SDL_KeyboardEvent;
pub const struct_SDL_TextEditingEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    text: [32]u8,
    start: i32,
    length: i32,
};
pub const SDL_TextEditingEvent = struct_SDL_TextEditingEvent;
pub const struct_SDL_TextInputEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    text: [32]u8,
};
pub const SDL_TextInputEvent = struct_SDL_TextInputEvent;
pub const struct_SDL_MouseMotionEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    which: u32,
    state: u32,
    x: i32,
    y: i32,
    xrel: i32,
    yrel: i32,
};
pub const SDL_MouseMotionEvent = struct_SDL_MouseMotionEvent;
pub const struct_SDL_MouseButtonEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    which: u32,
    button: u8,
    state: u8,
    clicks: u8,
    padding1: u8,
    x: i32,
    y: i32,
};
pub const SDL_MouseButtonEvent = struct_SDL_MouseButtonEvent;
pub const struct_SDL_MouseWheelEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    which: u32,
    x: i32,
    y: i32,
    direction: u32,
    preciseX: f32,
    preciseY: f32,
};
pub const SDL_MouseWheelEvent = struct_SDL_MouseWheelEvent;
pub const struct_SDL_JoyAxisEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: SDL_JoystickID,
    axis: u8,
    padding1: u8,
    padding2: u8,
    padding3: u8,
    value: i16,
    padding4: u16,
};
pub const SDL_JoyAxisEvent = struct_SDL_JoyAxisEvent;
pub const struct_SDL_JoyBallEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: SDL_JoystickID,
    ball: u8,
    padding1: u8,
    padding2: u8,
    padding3: u8,
    xrel: i16,
    yrel: i16,
};
pub const SDL_JoyBallEvent = struct_SDL_JoyBallEvent;
pub const struct_SDL_JoyHatEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: SDL_JoystickID,
    hat: u8,
    value: u8,
    padding1: u8,
    padding2: u8,
};
pub const SDL_JoyHatEvent = struct_SDL_JoyHatEvent;
pub const struct_SDL_JoyButtonEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: SDL_JoystickID,
    button: u8,
    state: u8,
    padding1: u8,
    padding2: u8,
};
pub const SDL_JoyButtonEvent = struct_SDL_JoyButtonEvent;
pub const struct_SDL_JoyDeviceEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: i32,
};
pub const SDL_JoyDeviceEvent = struct_SDL_JoyDeviceEvent;
pub const struct_SDL_ControllerAxisEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: SDL_JoystickID,
    axis: u8,
    padding1: u8,
    padding2: u8,
    padding3: u8,
    value: i16,
    padding4: u16,
};
pub const SDL_ControllerAxisEvent = struct_SDL_ControllerAxisEvent;
pub const struct_SDL_ControllerButtonEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: SDL_JoystickID,
    button: u8,
    state: u8,
    padding1: u8,
    padding2: u8,
};
pub const SDL_ControllerButtonEvent = struct_SDL_ControllerButtonEvent;
pub const struct_SDL_ControllerDeviceEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: i32,
};
pub const SDL_ControllerDeviceEvent = struct_SDL_ControllerDeviceEvent;
pub const struct_SDL_ControllerTouchpadEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: SDL_JoystickID,
    touchpad: i32,
    finger: i32,
    x: f32,
    y: f32,
    pressure: f32,
};
pub const SDL_ControllerTouchpadEvent = struct_SDL_ControllerTouchpadEvent;
pub const struct_SDL_ControllerSensorEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: SDL_JoystickID,
    sensor: i32,
    data: [3]f32,
};
pub const SDL_ControllerSensorEvent = struct_SDL_ControllerSensorEvent;
pub const struct_SDL_AudioDeviceEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: u32,
    iscapture: u8,
    padding1: u8,
    padding2: u8,
    padding3: u8,
};
pub const SDL_AudioDeviceEvent = struct_SDL_AudioDeviceEvent;
pub const struct_SDL_TouchFingerEvent = extern struct {
    type: u32,
    timestamp: u32,
    touchId: SDL_TouchID,
    fingerId: SDL_FingerID,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    pressure: f32,
    windowID: u32,
};
pub const SDL_TouchFingerEvent = struct_SDL_TouchFingerEvent;
pub const struct_SDL_MultiGestureEvent = extern struct {
    type: u32,
    timestamp: u32,
    touchId: SDL_TouchID,
    dTheta: f32,
    dDist: f32,
    x: f32,
    y: f32,
    numFingers: u16,
    padding: u16,
};
pub const SDL_MultiGestureEvent = struct_SDL_MultiGestureEvent;
pub const struct_SDL_DollarGestureEvent = extern struct {
    type: u32,
    timestamp: u32,
    touchId: SDL_TouchID,
    gestureId: SDL_GestureID,
    numFingers: u32,
    @"error": f32,
    x: f32,
    y: f32,
};
pub const SDL_DollarGestureEvent = struct_SDL_DollarGestureEvent;
pub const struct_SDL_DropEvent = extern struct {
    type: u32,
    timestamp: u32,
    file: [*c]u8,
    windowID: u32,
};
pub const SDL_DropEvent = struct_SDL_DropEvent;
pub const struct_SDL_SensorEvent = extern struct {
    type: u32,
    timestamp: u32,
    which: i32,
    data: [6]f32,
};
pub const SDL_SensorEvent = struct_SDL_SensorEvent;
pub const struct_SDL_QuitEvent = extern struct {
    type: u32,
    timestamp: u32,
};
pub const SDL_QuitEvent = struct_SDL_QuitEvent;
pub const struct_SDL_OSEvent = extern struct {
    type: u32,
    timestamp: u32,
};
pub const SDL_OSEvent = struct_SDL_OSEvent;
pub const struct_SDL_UserEvent = extern struct {
    type: u32,
    timestamp: u32,
    windowID: u32,
    code: i32,
    data1: ?*anyopaque,
    data2: ?*anyopaque,
};
pub const SDL_UserEvent = struct_SDL_UserEvent;
pub const struct_SDL_SysWMmsg = opaque {};
pub const SDL_SysWMmsg = struct_SDL_SysWMmsg;
pub const struct_SDL_SysWMEvent = extern struct {
    type: u32,
    timestamp: u32,
    msg: ?*SDL_SysWMmsg,
};
pub const SDL_SysWMEvent = struct_SDL_SysWMEvent;
pub const union_SDL_Event = extern union {
    type: u32,
    common: SDL_CommonEvent,
    display: SDL_DisplayEvent,
    window: SDL_WindowEvent,
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    text: SDL_TextInputEvent,
    motion: SDL_MouseMotionEvent,
    button: SDL_MouseButtonEvent,
    wheel: SDL_MouseWheelEvent,
    jaxis: SDL_JoyAxisEvent,
    jball: SDL_JoyBallEvent,
    jhat: SDL_JoyHatEvent,
    jbutton: SDL_JoyButtonEvent,
    jdevice: SDL_JoyDeviceEvent,
    caxis: SDL_ControllerAxisEvent,
    cbutton: SDL_ControllerButtonEvent,
    cdevice: SDL_ControllerDeviceEvent,
    ctouchpad: SDL_ControllerTouchpadEvent,
    csensor: SDL_ControllerSensorEvent,
    adevice: SDL_AudioDeviceEvent,
    sensor: SDL_SensorEvent,
    quit: SDL_QuitEvent,
    user: SDL_UserEvent,
    syswm: SDL_SysWMEvent,
    tfinger: SDL_TouchFingerEvent,
    mgesture: SDL_MultiGestureEvent,
    dgesture: SDL_DollarGestureEvent,
    drop: SDL_DropEvent,
    padding: [56]u8,
};
pub const SDL_Event = union_SDL_Event;
pub const SDL_compile_time_assert_SDL_Event = [1]c_int;
pub extern fn SDL_PumpEvents() void;
pub const SDL_ADDEVENT: c_int = 0;
pub const SDL_PEEKEVENT: c_int = 1;
pub const SDL_GETEVENT: c_int = 2;
pub const SDL_eventaction = c_uint;
pub extern fn SDL_PeepEvents(events: [*c]SDL_Event, numevents: c_int, action: SDL_eventaction, minType: u32, maxType: u32) c_int;
pub extern fn SDL_HasEvent(@"type": u32) SDL_bool;
pub extern fn SDL_HasEvents(minType: u32, maxType: u32) SDL_bool;
pub extern fn SDL_FlushEvent(@"type": u32) void;
pub extern fn SDL_FlushEvents(minType: u32, maxType: u32) void;
pub extern fn SDL_PollEvent(event: [*c]SDL_Event) c_int;
pub extern fn SDL_WaitEvent(event: [*c]SDL_Event) c_int;
pub extern fn SDL_WaitEventTimeout(event: [*c]SDL_Event, timeout: c_int) c_int;
pub extern fn SDL_PushEvent(event: [*c]SDL_Event) c_int;
pub const SDL_EventFilter = ?fn (?*anyopaque, [*c]SDL_Event) callconv(.C) c_int;
pub extern fn SDL_SetEventFilter(filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_GetEventFilter(filter: [*c]SDL_EventFilter, userdata: [*c]?*anyopaque) SDL_bool;
pub extern fn SDL_AddEventWatch(filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_DelEventWatch(filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_FilterEvents(filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_EventState(@"type": u32, state: c_int) u8;
pub extern fn SDL_RegisterEvents(numevents: c_int) u32;
pub extern fn SDL_GetBasePath() [*c]u8;
pub extern fn SDL_GetPrefPath(org: [*c]const u8, app: [*c]const u8) [*c]u8;
pub const struct__SDL_Haptic = opaque {};
pub const SDL_Haptic = struct__SDL_Haptic;
pub const struct_SDL_HapticDirection = extern struct {
    type: u8,
    dir: [3]i32,
};
pub const SDL_HapticDirection = struct_SDL_HapticDirection;
pub const struct_SDL_HapticConstant = extern struct {
    type: u16,
    direction: SDL_HapticDirection,
    length: u32,
    delay: u16,
    button: u16,
    interval: u16,
    level: i16,
    attack_length: u16,
    attack_level: u16,
    fade_length: u16,
    fade_level: u16,
};
pub const SDL_HapticConstant = struct_SDL_HapticConstant;
pub const struct_SDL_HapticPeriodic = extern struct {
    type: u16,
    direction: SDL_HapticDirection,
    length: u32,
    delay: u16,
    button: u16,
    interval: u16,
    period: u16,
    magnitude: i16,
    offset: i16,
    phase: u16,
    attack_length: u16,
    attack_level: u16,
    fade_length: u16,
    fade_level: u16,
};
pub const SDL_HapticPeriodic = struct_SDL_HapticPeriodic;
pub const struct_SDL_HapticCondition = extern struct {
    type: u16,
    direction: SDL_HapticDirection,
    length: u32,
    delay: u16,
    button: u16,
    interval: u16,
    right_sat: [3]u16,
    left_sat: [3]u16,
    right_coeff: [3]i16,
    left_coeff: [3]i16,
    deadband: [3]u16,
    center: [3]i16,
};
pub const SDL_HapticCondition = struct_SDL_HapticCondition;
pub const struct_SDL_HapticRamp = extern struct {
    type: u16,
    direction: SDL_HapticDirection,
    length: u32,
    delay: u16,
    button: u16,
    interval: u16,
    start: i16,
    end: i16,
    attack_length: u16,
    attack_level: u16,
    fade_length: u16,
    fade_level: u16,
};
pub const SDL_HapticRamp = struct_SDL_HapticRamp;
pub const struct_SDL_HapticLeftRight = extern struct {
    type: u16,
    length: u32,
    large_magnitude: u16,
    small_magnitude: u16,
};
pub const SDL_HapticLeftRight = struct_SDL_HapticLeftRight;
pub const struct_SDL_HapticCustom = extern struct {
    type: u16,
    direction: SDL_HapticDirection,
    length: u32,
    delay: u16,
    button: u16,
    interval: u16,
    channels: u8,
    period: u16,
    samples: u16,
    data: [*c]u16,
    attack_length: u16,
    attack_level: u16,
    fade_length: u16,
    fade_level: u16,
};
pub const SDL_HapticCustom = struct_SDL_HapticCustom;
pub const union_SDL_HapticEffect = extern union {
    type: u16,
    constant: SDL_HapticConstant,
    periodic: SDL_HapticPeriodic,
    condition: SDL_HapticCondition,
    ramp: SDL_HapticRamp,
    leftright: SDL_HapticLeftRight,
    custom: SDL_HapticCustom,
};
pub const SDL_HapticEffect = union_SDL_HapticEffect;
pub extern fn SDL_NumHaptics() c_int;
pub extern fn SDL_HapticName(device_index: c_int) [*c]const u8;
pub extern fn SDL_HapticOpen(device_index: c_int) ?*SDL_Haptic;
pub extern fn SDL_HapticOpened(device_index: c_int) c_int;
pub extern fn SDL_HapticIndex(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_MouseIsHaptic() c_int;
pub extern fn SDL_HapticOpenFromMouse() ?*SDL_Haptic;
pub extern fn SDL_JoystickIsHaptic(joystick: ?*SDL_Joystick) c_int;
pub extern fn SDL_HapticOpenFromJoystick(joystick: ?*SDL_Joystick) ?*SDL_Haptic;
pub extern fn SDL_HapticClose(haptic: ?*SDL_Haptic) void;
pub extern fn SDL_HapticNumEffects(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_HapticNumEffectsPlaying(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_HapticQuery(haptic: ?*SDL_Haptic) c_uint;
pub extern fn SDL_HapticNumAxes(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_HapticEffectSupported(haptic: ?*SDL_Haptic, effect: [*c]SDL_HapticEffect) c_int;
pub extern fn SDL_HapticNewEffect(haptic: ?*SDL_Haptic, effect: [*c]SDL_HapticEffect) c_int;
pub extern fn SDL_HapticUpdateEffect(haptic: ?*SDL_Haptic, effect: c_int, data: [*c]SDL_HapticEffect) c_int;
pub extern fn SDL_HapticRunEffect(haptic: ?*SDL_Haptic, effect: c_int, iterations: u32) c_int;
pub extern fn SDL_HapticStopEffect(haptic: ?*SDL_Haptic, effect: c_int) c_int;
pub extern fn SDL_HapticDestroyEffect(haptic: ?*SDL_Haptic, effect: c_int) void;
pub extern fn SDL_HapticGetEffectStatus(haptic: ?*SDL_Haptic, effect: c_int) c_int;
pub extern fn SDL_HapticSetGain(haptic: ?*SDL_Haptic, gain: c_int) c_int;
pub extern fn SDL_HapticSetAutocenter(haptic: ?*SDL_Haptic, autocenter: c_int) c_int;
pub extern fn SDL_HapticPause(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_HapticUnpause(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_HapticStopAll(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_HapticRumbleSupported(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_HapticRumbleInit(haptic: ?*SDL_Haptic) c_int;
pub extern fn SDL_HapticRumblePlay(haptic: ?*SDL_Haptic, strength: f32, length: u32) c_int;
pub extern fn SDL_HapticRumbleStop(haptic: ?*SDL_Haptic) c_int;
pub const struct_SDL_hid_device_ = opaque {};
pub const SDL_hid_device = struct_SDL_hid_device_;
pub const struct_SDL_hid_device_info = extern struct {
    path: [*c]u8,
    vendor_id: c_ushort,
    product_id: c_ushort,
    serial_number: [*c]wchar_t,
    release_number: c_ushort,
    manufacturer_string: [*c]wchar_t,
    product_string: [*c]wchar_t,
    usage_page: c_ushort,
    usage: c_ushort,
    interface_number: c_int,
    interface_class: c_int,
    interface_subclass: c_int,
    interface_protocol: c_int,
    next: [*c]struct_SDL_hid_device_info,
};
pub const SDL_hid_device_info = struct_SDL_hid_device_info;
pub extern fn SDL_hid_init() c_int;
pub extern fn SDL_hid_exit() c_int;
pub extern fn SDL_hid_device_change_count() u32;
pub extern fn SDL_hid_enumerate(vendor_id: c_ushort, product_id: c_ushort) [*c]SDL_hid_device_info;
pub extern fn SDL_hid_free_enumeration(devs: [*c]SDL_hid_device_info) void;
pub extern fn SDL_hid_open(vendor_id: c_ushort, product_id: c_ushort, serial_number: [*c]const wchar_t) ?*SDL_hid_device;
pub extern fn SDL_hid_open_path(path: [*c]const u8, bExclusive: c_int) ?*SDL_hid_device;
pub extern fn SDL_hid_write(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_read_timeout(dev: ?*SDL_hid_device, data: [*c]u8, length: usize, milliseconds: c_int) c_int;
pub extern fn SDL_hid_read(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_hid_set_nonblocking(dev: ?*SDL_hid_device, nonblock: c_int) c_int;
pub extern fn SDL_hid_send_feature_report(dev: ?*SDL_hid_device, data: [*c]const u8, length: usize) c_int;
pub extern fn SDL_hid_get_feature_report(dev: ?*SDL_hid_device, data: [*c]u8, length: usize) c_int;
pub extern fn SDL_hid_close(dev: ?*SDL_hid_device) void;
pub extern fn SDL_hid_get_manufacturer_string(dev: ?*SDL_hid_device, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn SDL_hid_get_product_string(dev: ?*SDL_hid_device, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn SDL_hid_get_serial_number_string(dev: ?*SDL_hid_device, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn SDL_hid_get_indexed_string(dev: ?*SDL_hid_device, string_index: c_int, string: [*c]wchar_t, maxlen: usize) c_int;
pub extern fn SDL_hid_ble_scan(active: SDL_bool) void;
pub const SDL_HINT_DEFAULT: c_int = 0;
pub const SDL_HINT_NORMAL: c_int = 1;
pub const SDL_HINT_OVERRIDE: c_int = 2;
pub const SDL_HintPriority = c_uint;
pub extern fn SDL_SetHintWithPriority(name: [*c]const u8, value: [*c]const u8, priority: SDL_HintPriority) SDL_bool;
pub extern fn SDL_SetHint(name: [*c]const u8, value: [*c]const u8) SDL_bool;
pub extern fn SDL_GetHint(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean(name: [*c]const u8, default_value: SDL_bool) SDL_bool;
pub const SDL_HintCallback = ?fn (?*anyopaque, [*c]const u8, [*c]const u8, [*c]const u8) callconv(.C) void;
pub extern fn SDL_AddHintCallback(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_DelHintCallback(name: [*c]const u8, callback: SDL_HintCallback, userdata: ?*anyopaque) void;
pub extern fn SDL_ClearHints() void;
pub extern fn SDL_LoadObject(sofile: [*c]const u8) ?*anyopaque;
pub extern fn SDL_LoadFunction(handle: ?*anyopaque, name: [*c]const u8) ?*anyopaque;
pub extern fn SDL_UnloadObject(handle: ?*anyopaque) void;
pub const SDL_LOG_CATEGORY_APPLICATION: c_int = 0;
pub const SDL_LOG_CATEGORY_ERROR: c_int = 1;
pub const SDL_LOG_CATEGORY_ASSERT: c_int = 2;
pub const SDL_LOG_CATEGORY_SYSTEM: c_int = 3;
pub const SDL_LOG_CATEGORY_AUDIO: c_int = 4;
pub const SDL_LOG_CATEGORY_VIDEO: c_int = 5;
pub const SDL_LOG_CATEGORY_RENDER: c_int = 6;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub const SDL_LOG_CATEGORY_TEST: c_int = 8;
pub const SDL_LOG_CATEGORY_RESERVED1: c_int = 9;
pub const SDL_LOG_CATEGORY_RESERVED2: c_int = 10;
pub const SDL_LOG_CATEGORY_RESERVED3: c_int = 11;
pub const SDL_LOG_CATEGORY_RESERVED4: c_int = 12;
pub const SDL_LOG_CATEGORY_RESERVED5: c_int = 13;
pub const SDL_LOG_CATEGORY_RESERVED6: c_int = 14;
pub const SDL_LOG_CATEGORY_RESERVED7: c_int = 15;
pub const SDL_LOG_CATEGORY_RESERVED8: c_int = 16;
pub const SDL_LOG_CATEGORY_RESERVED9: c_int = 17;
pub const SDL_LOG_CATEGORY_RESERVED10: c_int = 18;
pub const SDL_LOG_CATEGORY_CUSTOM: c_int = 19;
pub const SDL_LogCategory = c_uint;
pub const SDL_LOG_PRIORITY_VERBOSE: c_int = 1;
pub const SDL_LOG_PRIORITY_DEBUG: c_int = 2;
pub const SDL_LOG_PRIORITY_INFO: c_int = 3;
pub const SDL_LOG_PRIORITY_WARN: c_int = 4;
pub const SDL_LOG_PRIORITY_ERROR: c_int = 5;
pub const SDL_LOG_PRIORITY_CRITICAL: c_int = 6;
pub const SDL_NUM_LOG_PRIORITIES: c_int = 7;
pub const SDL_LogPriority = c_uint;
pub extern fn SDL_LogSetAllPriority(priority: SDL_LogPriority) void;
pub extern fn SDL_LogSetPriority(category: c_int, priority: SDL_LogPriority) void;
pub extern fn SDL_LogGetPriority(category: c_int) SDL_LogPriority;
pub extern fn SDL_LogResetPriorities() void;
pub extern fn SDL_Log(fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogVerbose(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogDebug(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogInfo(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogError(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogCritical(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogMessage(category: c_int, priority: SDL_LogPriority, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogMessageV(category: c_int, priority: SDL_LogPriority, fmt: [*c]const u8, ap: [*c]struct___va_list_tag) void;
pub const SDL_LogOutputFunction = ?fn (?*anyopaque, c_int, SDL_LogPriority, [*c]const u8) callconv(.C) void;
pub extern fn SDL_LogGetOutputFunction(callback: [*c]SDL_LogOutputFunction, userdata: [*c]?*anyopaque) void;
pub extern fn SDL_LogSetOutputFunction(callback: SDL_LogOutputFunction, userdata: ?*anyopaque) void;
pub const SDL_MESSAGEBOX_ERROR: c_int = 16;
pub const SDL_MESSAGEBOX_WARNING: c_int = 32;
pub const SDL_MESSAGEBOX_INFORMATION: c_int = 64;
pub const SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT: c_int = 128;
pub const SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT: c_int = 256;
pub const SDL_MessageBoxFlags = c_uint;
pub const SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT: c_int = 1;
pub const SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT: c_int = 2;
pub const SDL_MessageBoxButtonFlags = c_uint;
pub const SDL_MessageBoxButtonData = extern struct {
    flags: u32,
    buttonid: c_int,
    text: [*c]const u8,
};
pub const SDL_MessageBoxColor = extern struct {
    r: u8,
    g: u8,
    b: u8,
};
pub const SDL_MESSAGEBOX_COLOR_BACKGROUND: c_int = 0;
pub const SDL_MESSAGEBOX_COLOR_TEXT: c_int = 1;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_BORDER: c_int = 2;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND: c_int = 3;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED: c_int = 4;
pub const SDL_MESSAGEBOX_COLOR_MAX: c_int = 5;
pub const SDL_MessageBoxColorType = c_uint;
pub const SDL_MessageBoxColorScheme = extern struct {
    colors: [5]SDL_MessageBoxColor,
};
pub const SDL_MessageBoxData = extern struct {
    flags: u32,
    window: ?*SDL_Window,
    title: [*c]const u8,
    message: [*c]const u8,
    numbuttons: c_int,
    buttons: [*c]const SDL_MessageBoxButtonData,
    colorScheme: [*c]const SDL_MessageBoxColorScheme,
};
pub extern fn SDL_ShowMessageBox(messageboxdata: [*c]const SDL_MessageBoxData, buttonid: [*c]c_int) c_int;
pub extern fn SDL_ShowSimpleMessageBox(flags: u32, title: [*c]const u8, message: [*c]const u8, window: ?*SDL_Window) c_int;
pub const SDL_MetalView = ?*anyopaque;
pub extern fn SDL_Metal_CreateView(window: ?*SDL_Window) SDL_MetalView;
pub extern fn SDL_Metal_DestroyView(view: SDL_MetalView) void;
pub extern fn SDL_Metal_GetLayer(view: SDL_MetalView) ?*anyopaque;
pub extern fn SDL_Metal_GetDrawableSize(window: ?*SDL_Window, w: [*c]c_int, h: [*c]c_int) void;
pub const SDL_POWERSTATE_UNKNOWN: c_int = 0;
pub const SDL_POWERSTATE_ON_BATTERY: c_int = 1;
pub const SDL_POWERSTATE_NO_BATTERY: c_int = 2;
pub const SDL_POWERSTATE_CHARGING: c_int = 3;
pub const SDL_POWERSTATE_CHARGED: c_int = 4;
pub const SDL_PowerState = c_uint;
pub extern fn SDL_GetPowerInfo(secs: [*c]c_int, pct: [*c]c_int) SDL_PowerState;
pub const SDL_RENDERER_SOFTWARE: c_int = 1;
pub const SDL_RENDERER_ACCELERATED: c_int = 2;
pub const SDL_RENDERER_PRESENTVSYNC: c_int = 4;
pub const SDL_RENDERER_TARGETTEXTURE: c_int = 8;
pub const SDL_RendererFlags = c_uint;
pub const struct_SDL_RendererInfo = extern struct {
    name: [*c]const u8,
    flags: u32,
    num_texture_formats: u32,
    texture_formats: [16]u32,
    max_texture_width: c_int,
    max_texture_height: c_int,
};
pub const SDL_RendererInfo = struct_SDL_RendererInfo;
pub const struct_SDL_Vertex = extern struct {
    position: SDL_FPoint,
    color: SDL_Color,
    tex_coord: SDL_FPoint,
};
pub const SDL_Vertex = struct_SDL_Vertex;
pub const SDL_ScaleModeNearest: c_int = 0;
pub const SDL_ScaleModeLinear: c_int = 1;
pub const SDL_ScaleModeBest: c_int = 2;
pub const SDL_ScaleMode = c_uint;
pub const SDL_TEXTUREACCESS_STATIC: c_int = 0;
pub const SDL_TEXTUREACCESS_STREAMING: c_int = 1;
pub const SDL_TEXTUREACCESS_TARGET: c_int = 2;
pub const SDL_TextureAccess = c_uint;
pub const SDL_TEXTUREMODULATE_NONE: c_int = 0;
pub const SDL_TEXTUREMODULATE_COLOR: c_int = 1;
pub const SDL_TEXTUREMODULATE_ALPHA: c_int = 2;
pub const SDL_TextureModulate = c_uint;
pub const SDL_FLIP_NONE: c_int = 0;
pub const SDL_FLIP_HORIZONTAL: c_int = 1;
pub const SDL_FLIP_VERTICAL: c_int = 2;
pub const SDL_RendererFlip = c_uint;
pub const struct_SDL_Renderer = opaque {};
pub const SDL_Renderer = struct_SDL_Renderer;
pub const struct_SDL_Texture = opaque {};
pub const SDL_Texture = struct_SDL_Texture;
pub extern fn SDL_GetNumRenderDrivers() c_int;
pub extern fn SDL_GetRenderDriverInfo(index: c_int, info: [*c]SDL_RendererInfo) c_int;
pub extern fn SDL_CreateWindowAndRenderer(width: c_int, height: c_int, window_flags: u32, window: [*c]?*SDL_Window, renderer: [*c]?*SDL_Renderer) c_int;
pub extern fn SDL_CreateRenderer(window: ?*SDL_Window, index: c_int, flags: u32) ?*SDL_Renderer;
pub extern fn SDL_CreateSoftwareRenderer(surface: [*c]SDL_Surface) ?*SDL_Renderer;
pub extern fn SDL_GetRenderer(window: ?*SDL_Window) ?*SDL_Renderer;
pub extern fn SDL_GetRendererInfo(renderer: ?*SDL_Renderer, info: [*c]SDL_RendererInfo) c_int;
pub extern fn SDL_GetRendererOutputSize(renderer: ?*SDL_Renderer, w: [*c]c_int, h: [*c]c_int) c_int;
pub extern fn SDL_CreateTexture(renderer: ?*SDL_Renderer, format: u32, access: c_int, w: c_int, h: c_int) ?*SDL_Texture;
pub extern fn SDL_CreateTextureFromSurface(renderer: ?*SDL_Renderer, surface: [*c]SDL_Surface) ?*SDL_Texture;
pub extern fn SDL_QueryTexture(texture: ?*SDL_Texture, format: [*c]u32, access: [*c]c_int, w: [*c]c_int, h: [*c]c_int) c_int;
pub extern fn SDL_SetTextureColorMod(texture: ?*SDL_Texture, r: u8, g: u8, b: u8) c_int;
pub extern fn SDL_GetTextureColorMod(texture: ?*SDL_Texture, r: [*c]u8, g: [*c]u8, b: [*c]u8) c_int;
pub extern fn SDL_SetTextureAlphaMod(texture: ?*SDL_Texture, alpha: u8) c_int;
pub extern fn SDL_GetTextureAlphaMod(texture: ?*SDL_Texture, alpha: [*c]u8) c_int;
pub extern fn SDL_SetTextureBlendMode(texture: ?*SDL_Texture, blendMode: SDL_BlendMode) c_int;
pub extern fn SDL_GetTextureBlendMode(texture: ?*SDL_Texture, blendMode: [*c]SDL_BlendMode) c_int;
pub extern fn SDL_SetTextureScaleMode(texture: ?*SDL_Texture, scaleMode: SDL_ScaleMode) c_int;
pub extern fn SDL_GetTextureScaleMode(texture: ?*SDL_Texture, scaleMode: [*c]SDL_ScaleMode) c_int;
pub extern fn SDL_SetTextureUserData(texture: ?*SDL_Texture, userdata: ?*anyopaque) c_int;
pub extern fn SDL_GetTextureUserData(texture: ?*SDL_Texture) ?*anyopaque;
pub extern fn SDL_UpdateTexture(texture: ?*SDL_Texture, rect: [*c]const SDL_Rect, pixels: ?*const anyopaque, pitch: c_int) c_int;
pub extern fn SDL_UpdateYUVTexture(texture: ?*SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const u8, Ypitch: c_int, Uplane: [*c]const u8, Upitch: c_int, Vplane: [*c]const u8, Vpitch: c_int) c_int;
pub extern fn SDL_UpdateNVTexture(texture: ?*SDL_Texture, rect: [*c]const SDL_Rect, Yplane: [*c]const u8, Ypitch: c_int, UVplane: [*c]const u8, UVpitch: c_int) c_int;
pub extern fn SDL_LockTexture(texture: ?*SDL_Texture, rect: [*c]const SDL_Rect, pixels: [*c]?*anyopaque, pitch: [*c]c_int) c_int;
pub extern fn SDL_LockTextureToSurface(texture: ?*SDL_Texture, rect: [*c]const SDL_Rect, surface: [*c][*c]SDL_Surface) c_int;
pub extern fn SDL_UnlockTexture(texture: ?*SDL_Texture) void;
pub extern fn SDL_RenderTargetSupported(renderer: ?*SDL_Renderer) SDL_bool;
pub extern fn SDL_SetRenderTarget(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture) c_int;
pub extern fn SDL_GetRenderTarget(renderer: ?*SDL_Renderer) ?*SDL_Texture;
pub extern fn SDL_RenderSetLogicalSize(renderer: ?*SDL_Renderer, w: c_int, h: c_int) c_int;
pub extern fn SDL_RenderGetLogicalSize(renderer: ?*SDL_Renderer, w: [*c]c_int, h: [*c]c_int) void;
pub extern fn SDL_RenderSetIntegerScale(renderer: ?*SDL_Renderer, enable: SDL_bool) c_int;
pub extern fn SDL_RenderGetIntegerScale(renderer: ?*SDL_Renderer) SDL_bool;
pub extern fn SDL_RenderSetViewport(renderer: ?*SDL_Renderer, rect: [*c]const SDL_Rect) c_int;
pub extern fn SDL_RenderGetViewport(renderer: ?*SDL_Renderer, rect: [*c]SDL_Rect) void;
pub extern fn SDL_RenderSetClipRect(renderer: ?*SDL_Renderer, rect: [*c]const SDL_Rect) c_int;
pub extern fn SDL_RenderGetClipRect(renderer: ?*SDL_Renderer, rect: [*c]SDL_Rect) void;
pub extern fn SDL_RenderIsClipEnabled(renderer: ?*SDL_Renderer) SDL_bool;
pub extern fn SDL_RenderSetScale(renderer: ?*SDL_Renderer, scaleX: f32, scaleY: f32) c_int;
pub extern fn SDL_RenderGetScale(renderer: ?*SDL_Renderer, scaleX: [*c]f32, scaleY: [*c]f32) void;
pub extern fn SDL_RenderWindowToLogical(renderer: ?*SDL_Renderer, windowX: c_int, windowY: c_int, logicalX: [*c]f32, logicalY: [*c]f32) void;
pub extern fn SDL_RenderLogicalToWindow(renderer: ?*SDL_Renderer, logicalX: f32, logicalY: f32, windowX: [*c]c_int, windowY: [*c]c_int) void;
pub extern fn SDL_SetRenderDrawColor(renderer: ?*SDL_Renderer, r: u8, g: u8, b: u8, a: u8) c_int;
pub extern fn SDL_GetRenderDrawColor(renderer: ?*SDL_Renderer, r: [*c]u8, g: [*c]u8, b: [*c]u8, a: [*c]u8) c_int;
pub extern fn SDL_SetRenderDrawBlendMode(renderer: ?*SDL_Renderer, blendMode: SDL_BlendMode) c_int;
pub extern fn SDL_GetRenderDrawBlendMode(renderer: ?*SDL_Renderer, blendMode: [*c]SDL_BlendMode) c_int;
pub extern fn SDL_RenderClear(renderer: ?*SDL_Renderer) c_int;
pub extern fn SDL_RenderDrawPoint(renderer: ?*SDL_Renderer, x: c_int, y: c_int) c_int;
pub extern fn SDL_RenderDrawPoints(renderer: ?*SDL_Renderer, points: [*c]const SDL_Point, count: c_int) c_int;
pub extern fn SDL_RenderDrawLine(renderer: ?*SDL_Renderer, x1: c_int, y1: c_int, x2: c_int, y2: c_int) c_int;
pub extern fn SDL_RenderDrawLines(renderer: ?*SDL_Renderer, points: [*c]const SDL_Point, count: c_int) c_int;
pub extern fn SDL_RenderDrawRect(renderer: ?*SDL_Renderer, rect: [*c]const SDL_Rect) c_int;
pub extern fn SDL_RenderDrawRects(renderer: ?*SDL_Renderer, rects: [*c]const SDL_Rect, count: c_int) c_int;
pub extern fn SDL_RenderFillRect(renderer: ?*SDL_Renderer, rect: [*c]const SDL_Rect) c_int;
pub extern fn SDL_RenderFillRects(renderer: ?*SDL_Renderer, rects: [*c]const SDL_Rect, count: c_int) c_int;
pub extern fn SDL_RenderCopy(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: [*c]const SDL_Rect, dstrect: [*c]const SDL_Rect) c_int;
pub extern fn SDL_RenderCopyEx(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: [*c]const SDL_Rect, dstrect: [*c]const SDL_Rect, angle: f64, center: [*c]const SDL_Point, flip: SDL_RendererFlip) c_int;
pub extern fn SDL_RenderDrawPointF(renderer: ?*SDL_Renderer, x: f32, y: f32) c_int;
pub extern fn SDL_RenderDrawPointsF(renderer: ?*SDL_Renderer, points: [*c]const SDL_FPoint, count: c_int) c_int;
pub extern fn SDL_RenderDrawLineF(renderer: ?*SDL_Renderer, x1: f32, y1: f32, x2: f32, y2: f32) c_int;
pub extern fn SDL_RenderDrawLinesF(renderer: ?*SDL_Renderer, points: [*c]const SDL_FPoint, count: c_int) c_int;
pub extern fn SDL_RenderDrawRectF(renderer: ?*SDL_Renderer, rect: [*c]const SDL_FRect) c_int;
pub extern fn SDL_RenderDrawRectsF(renderer: ?*SDL_Renderer, rects: [*c]const SDL_FRect, count: c_int) c_int;
pub extern fn SDL_RenderFillRectF(renderer: ?*SDL_Renderer, rect: [*c]const SDL_FRect) c_int;
pub extern fn SDL_RenderFillRectsF(renderer: ?*SDL_Renderer, rects: [*c]const SDL_FRect, count: c_int) c_int;
pub extern fn SDL_RenderCopyF(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: [*c]const SDL_Rect, dstrect: [*c]const SDL_FRect) c_int;
pub extern fn SDL_RenderCopyExF(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, srcrect: [*c]const SDL_Rect, dstrect: [*c]const SDL_FRect, angle: f64, center: [*c]const SDL_FPoint, flip: SDL_RendererFlip) c_int;
pub extern fn SDL_RenderGeometry(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, vertices: [*c]const SDL_Vertex, num_vertices: c_int, indices: [*c]const c_int, num_indices: c_int) c_int;
pub extern fn SDL_RenderGeometryRaw(renderer: ?*SDL_Renderer, texture: ?*SDL_Texture, xy: [*c]const f32, xy_stride: c_int, color: [*c]const SDL_Color, color_stride: c_int, uv: [*c]const f32, uv_stride: c_int, num_vertices: c_int, indices: ?*const anyopaque, num_indices: c_int, size_indices: c_int) c_int;
pub extern fn SDL_RenderReadPixels(renderer: ?*SDL_Renderer, rect: [*c]const SDL_Rect, format: u32, pixels: ?*anyopaque, pitch: c_int) c_int;
pub extern fn SDL_RenderPresent(renderer: ?*SDL_Renderer) void;
pub extern fn SDL_DestroyTexture(texture: ?*SDL_Texture) void;
pub extern fn SDL_DestroyRenderer(renderer: ?*SDL_Renderer) void;
pub extern fn SDL_RenderFlush(renderer: ?*SDL_Renderer) c_int;
pub extern fn SDL_GL_BindTexture(texture: ?*SDL_Texture, texw: [*c]f32, texh: [*c]f32) c_int;
pub extern fn SDL_GL_UnbindTexture(texture: ?*SDL_Texture) c_int;
pub extern fn SDL_RenderGetMetalLayer(renderer: ?*SDL_Renderer) ?*anyopaque;
pub extern fn SDL_RenderGetMetalCommandEncoder(renderer: ?*SDL_Renderer) ?*anyopaque;
pub extern fn SDL_RenderSetVSync(renderer: ?*SDL_Renderer, vsync: c_int) c_int;
pub extern fn SDL_CreateShapedWindow(title: [*c]const u8, x: c_uint, y: c_uint, w: c_uint, h: c_uint, flags: u32) ?*SDL_Window;
pub extern fn SDL_IsShapedWindow(window: ?*const SDL_Window) SDL_bool;
pub const ShapeModeDefault: c_int = 0;
pub const ShapeModeBinarizeAlpha: c_int = 1;
pub const ShapeModeReverseBinarizeAlpha: c_int = 2;
pub const ShapeModeColorKey: c_int = 3;
pub const WindowShapeMode = c_uint;
pub const SDL_WindowShapeParams = extern union {
    binarizationCutoff: u8,
    colorKey: SDL_Color,
};
pub const struct_SDL_WindowShapeMode = extern struct {
    mode: WindowShapeMode,
    parameters: SDL_WindowShapeParams,
};
pub const SDL_WindowShapeMode = struct_SDL_WindowShapeMode;
pub extern fn SDL_SetWindowShape(window: ?*SDL_Window, shape: [*c]SDL_Surface, shape_mode: [*c]SDL_WindowShapeMode) c_int;
pub extern fn SDL_GetShapedWindowMode(window: ?*SDL_Window, shape_mode: [*c]SDL_WindowShapeMode) c_int;
pub extern fn SDL_LinuxSetThreadPriority(threadID: i64, priority: c_int) c_int;
pub extern fn SDL_LinuxSetThreadPriorityAndPolicy(threadID: i64, sdlPriority: c_int, schedPolicy: c_int) c_int;
pub extern fn SDL_IsTablet() SDL_bool;
pub extern fn SDL_OnApplicationWillTerminate() void;
pub extern fn SDL_OnApplicationDidReceiveMemoryWarning() void;
pub extern fn SDL_OnApplicationWillResignActive() void;
pub extern fn SDL_OnApplicationDidEnterBackground() void;
pub extern fn SDL_OnApplicationWillEnterForeground() void;
pub extern fn SDL_OnApplicationDidBecomeActive() void;
pub extern fn SDL_GetTicks() u32;
pub extern fn SDL_GetTicks64() u64;
pub extern fn SDL_GetPerformanceCounter() u64;
pub extern fn SDL_GetPerformanceFrequency() u64;
pub extern fn SDL_Delay(ms: u32) void;
pub const SDL_TimerCallback = ?fn (u32, ?*anyopaque) callconv(.C) u32;
pub const SDL_TimerID = c_int;
pub extern fn SDL_AddTimer(interval: u32, callback: SDL_TimerCallback, param: ?*anyopaque) SDL_TimerID;
pub extern fn SDL_RemoveTimer(id: SDL_TimerID) SDL_bool;
pub const struct_SDL_version = extern struct {
    major: u8,
    minor: u8,
    patch: u8,
};
pub const SDL_version = struct_SDL_version;
pub extern fn SDL_GetVersion(ver: [*c]SDL_version) void;
pub extern fn SDL_GetRevision() [*c]const u8;
pub extern fn SDL_GetRevisionNumber() c_int;
pub const struct_SDL_Locale = extern struct {
    language: [*c]const u8,
    country: [*c]const u8,
};
pub const SDL_Locale = struct_SDL_Locale;
pub extern fn SDL_GetPreferredLocales() [*c]SDL_Locale;
pub extern fn SDL_OpenURL(url: [*c]const u8) c_int;
pub extern fn SDL_Init(flags: u32) c_int;
pub extern fn SDL_InitSubSystem(flags: u32) c_int;
pub extern fn SDL_QuitSubSystem(flags: u32) void;
pub extern fn SDL_WasInit(flags: u32) u32;
pub extern fn SDL_Quit() void;
pub const _SDL_iconv_t = struct__SDL_iconv_t;
pub const SDL_semaphore = struct_SDL_semaphore;
pub const _SDL_AudioStream = struct__SDL_AudioStream;
pub const SDL_BlitMap = struct_SDL_BlitMap;
pub const _SDL_Joystick = struct__SDL_Joystick;
pub const _SDL_Sensor = struct__SDL_Sensor;
pub const _SDL_GameController = struct__SDL_GameController;
pub const _SDL_Haptic = struct__SDL_Haptic;
pub const SDL_hid_device_ = struct_SDL_hid_device_;
