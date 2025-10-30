//! Booleans

const print = @import("std").debug.print;

pub fn main() void {
    const bool_val: bool = false;
    const bool_val2: bool = true;
    _ = bool_val2;

    const num1: u8 = 3;
    const num2: i16 = -10;
    const float1: f16 = 3.14;
    const float2: f32 = 3;

    print("num1 equals num2: {}\n", .{num1 == num2});
    print("num2 does not equal float1: {}\n", .{num2 != float1});
    print("float2 equals num1: {}\n", .{float2 == num1});

    //const char_a = 'a';
    //const string_a = "a";
    //print("char_a equals string_a: {}\n", .{char_a == string_a});

    print("num1 is less than num2: {}\n", .{num1 < num2});
    print("float1 is greater than num1: {}\n", .{float1 > num1});
    print("num1 is less than or equal to num2: {}\n", .{num1 <= num2});
    print("float1 is greater than or equal to num1: {}\n", .{float1 >= num1});

    const bool_false = !true;
    const bool_val_negated = !bool_val;
    print("\n", .{});
    print("bool_false: {}\n", .{bool_false});
    print("bool_val: {}\n", .{bool_val});
    print("bool_val_negated: {}\n", .{bool_val_negated});

    print("\n", .{});
    const bool_true = true;
    const and1 = bool_false and bool_true;
    const and2 = !bool_false and bool_true;
    print("and1: {}\n", .{and1});
    print("and2: {}\n", .{and2});

    print("\n", .{});
    const or1 = bool_false or bool_true;
    const or2 = bool_false or !bool_true;
    print("or1: {}\n", .{or1});
    print("or2: {}\n", .{or2});

    print("\n", .{});
    const combined_bool_logic = bool_true or bool_false and bool_true;
    const combined_bool_logic2 = (bool_true or bool_false) and bool_true;
    print("combined_bool_logic: {}\n", .{combined_bool_logic});
    print("combined_bool_logic2: {}\n", .{combined_bool_logic2});
}
