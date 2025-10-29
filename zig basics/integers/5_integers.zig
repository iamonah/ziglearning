//! Integers
const print = @import("std").debug.print;
const Signedness = @import("std").builtin.Signedness;

pub fn main() void {
    const some_variable = 256;
    var unsigned_8_bit_int: u8 = undefined;
    if (some_variable <= 255 and some_variable >= 0) {
        unsigned_8_bit_int = some_variable;
    } else {
        // handle this case
    }

    const num1: u8 = 255;
    const num2: u8 = 255;
    const result_wrapping: u8 = num1 +% num2; //
    const result_saturation: u8 = num1 +| num2;
    print("result_wrapping: {}\n", .{result_wrapping});
    print("result_saturation: {}\n", .{result_saturation});
    //const zero: u16 = 0;
    const result: u16 = @as(u16, num1) + num2;
    print("result: {}\n", .{result});

    const binary: u8 = 0b0100_1100;
    const octal: u8 = 0o123;
    const hex: u8 = 0xaf;
    print("binary: {}\n", .{binary});
    print("octal: {}\n", .{octal});
    print("hex: {}\n", .{hex});
    const million: u16 = 65535;  //we assinged 10000000 iniitlally but got an overflow
    _ = million;
}
