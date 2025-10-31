const print = @import("std").debug.print;

pub fn doSomething(input: u8) void {
    print("function's input: {}\n", .{input});
}

pub fn addNumbers(num1: u8, num2: u8) u8 {
    const output: u8 = num1 +| num2;
    //num1 = num1 + num2;
    return output;
}

pub fn incrementNumeric(input: anytype) @TypeOf(input) {
    //Ensure "input" is numeric
    return input + 1;
}

pub fn modifyU8(input: u8, modifier: fn (u8) u8) u8 {
    return modifier(input);
}

pub fn incrementU8(input: u8) u8 {
    return input +| 1;
}
