//! Types and related functions
const print = @import("std").debug.print;

pub fn main() void {
    const unsigned_int: u8 = 15;
    const signed_int: i16 = 9;
    _ = unsigned_int;
    _ = signed_int;
    //const unsigned_neg_number: u8 = -5;
    //_ = unsigned_neg_number;

    const unsigned_int_7: u7 = 123;
    _ = unsigned_int_7;

    const float_16: f16 = 1.234;
    const float_32: f32 = 1.234;
    const float_64: f64 = 1.234; //better for application
    const float_80: f80 = 1.234;
    const float_128: f128 = 1.234;
    _ = float_16;
    _ = float_32;
    _ = float_64;
    _ = float_80;
    _ = float_128;

    const a_bool: bool = true;
    //_ = a_bool;

    const a_void: void = void{};
    _ = a_void;

    const unsigned_8_bit_integer: type = u8;
    _ = unsigned_8_bit_integer;
    const type_of_a_bool: type = @TypeOf(a_bool);
    print("type of a bool: {}\n", .{type_of_a_bool});

    print("typeOf u8: {}\n", .{@typeInfo(u8)});

    const memory_addr: usize = @intFromPtr(&a_bool);
    print("memory address of a_bool: {}\n", .{memory_addr});

    const const_int = 5;
    const const_float = 1.123;

    print("type of const_int: {}\n", .{@TypeOf(const_int)});
    print("type of const_float: {}\n", .{@TypeOf(const_float)});

    comptime var mutable_int: comptime_int = 4;
    _ = &mutable_int;
    print("type of mutable_int: {}\n", .{@TypeOf(mutable_int)});
}

fn infiniteLoop() noreturn {
    while (true) {}
}

fn logValue(value: anytype) void {
    //log value
    _ = value;
}

fn logError(err: anyerror) void {
    //log error
    _ = err;
}


//anytype can hold any type
//anyerror can hold any error
//type can hold type
