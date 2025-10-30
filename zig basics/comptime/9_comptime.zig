//! Comptime

const print = @import("std").debug.print;

pub fn main() void {
    const comptime_known_int = 10;
    const comptime_known_int2: u8 = 7;

    print("type of comptime_known_int: {}\n", .{@TypeOf(comptime_known_int)});
    print("type of comptime_known_int2: {}\n", .{@TypeOf(comptime_known_int2)});

    if (comptime_known_int != 10) {
        @compileError("comtpime_known_int does not equal 10");
    }
    if (comptime_known_int2 != 7) {
        @compileError("comptime_known_int2 does not equal 7");
    }

    var runtime_known_int: u4 = 5;
    _ = &runtime_known_int;
    if (runtime_known_int != 5) {
        // @compileError("runtime_known_int does not equal 5");
    }
    runtime_known_int = comptime_known_int2;

    comptime var comptime_mutable_var: u4 = 0;
    comptime_mutable_var = 3;
    print("comptime_mutable_var {}", .{comptime_mutable_var});
    comptime_mutable_var = comptime_known_int2;

    doSomething(comptime_known_int, runtime_known_int);
    comptime doSomething(comptime_known_int, comptime_known_int2);
}

fn doSomething(comptime input1: u8, input2: u8) void {
    _ = input1;
    _ = input2;
}
