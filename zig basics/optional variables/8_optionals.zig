//! Optionals
const print = @import("std").debug.print;

pub fn main() void {
    var optional_int: ?u8 = null;
    print("optional_int: {?}\n", .{optional_int});
    _ = &optional_int;
    print("optional_int: {?}\n", .{optional_int});

    var optional_bool: ?bool = null;
    _ = &optional_bool;

    const unwrapped_int: u16 = optional_int orelse 0;
    const unwrapped_bool: bool = optional_bool orelse false;
    print("\n", .{});
    print("unwrapped_int: {}\n", .{unwrapped_int});
    print("unwrapped_bool: {}\n", .{unwrapped_bool});

    const unwrapped_int2 = optional_int.?;
    //const unwrapped_bool2 = optional_bool.?;
    print("\n", .{});
    print("unwrapped_int2: {}\n", .{unwrapped_int2});
    //print("unwrapped_bool2: {}\n", .{unwrapped_bool2});

    print("type of unwrapped_int2: {}\n", .{@TypeOf(unwrapped_int2)});
    doSomething(optional_int);
    doSomething(unwrapped_int2);

    // doSomethingElse(optional_int);
}

fn doSomething(input: ?u8) void {
    _ = input;
}

fn doSomethingElse(input: u8) void {
    _ = input;
}
