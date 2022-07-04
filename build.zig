const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();

    const types_tests = b.addTest("sdl2-types.zig");
    types_tests.setBuildMode(mode);

    const test_step = b.step("run", "Run library tests");
    test_step.dependOn(&types_tests.step);
}
