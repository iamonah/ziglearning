//! Functions

const print = @import("std").debug.print;
const xternal = @import("3_external_functions.zig");
pub fn main() void {
    xternal.doSomething(8);
    var num1: u8 = 7;
    var num2: u8 = 10;
    _ = &num1;
    _ = &num2;
    const sum_of_nums: u8 = xternal.addNumbers(num1, num2);
    print("sum_of_nums: {}\n", .{sum_of_nums});

    print("type of addNumbers function: {}\n", .{@TypeOf(xternal.addNumbers)});

    const output_modify_u8 = xternal.modifyU8(num2, xternal.incrementU8);
    print("output_modify_u8: {}\n", .{output_modify_u8});
}
