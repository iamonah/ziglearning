//!Variables
const top_level_number: Unsigned8BitInteger = 10;
const Unsigned8BitInteger = u8;

const print = @import("std").debug.print;

pub fn main() void {
    var mutable_num: u8 = 13;
    const const_num = 5;
    var mutable_bool = true;

    mutable_bool = true;

    // mutable_num = 0;
    // const_num = 0;
    _ = &mutable_num;

    const _variable_name = 5;
    _ = _variable_name;
    const @"some_n$mb@r" = 10;  //all valid variable nameing convention
    _ = @"some_n$mb@r";

    print("Const num: {}\n", .{const_num});

    // const top_level_number = 0;

    const a_boolean: bool = true;
    const optional: ?u8 = null;
    _ = a_boolean;
    _ = optional;

    var numeric_var: u8 = undefined;
    var another_bool: bool = undefined;

    _ = &numeric_var;
    _ = &another_bool;

    print("numeric_var is undefined: {}\n", .{numeric_var == undefined});
    print("another_bool is undefined: {}\n", .{another_bool == undefined});
}
