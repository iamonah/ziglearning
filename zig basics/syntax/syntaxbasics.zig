pub fn addNumbers(num1: u8, num2: u8) u16 {
    return @as(u16, num1) + @as(u16, num2); // Add in u16—no overflow.
}

/// build-exe Create executable from source or object files

pub fn main() void {
    const number1: u8 = 5;
    const number2: u8 = 10;

    //the format string can have a place holder defined by curl brackets and second argument is a 
    // comma seperated tupple
    //tuble is defined by curly bracktes proceded by the dot .
    @import("std").debug.print("Number 1: {}, Number 2: {}\n", .{ number1, number2 });

    const Usigned16BitInteger = u16;
    const sum_of_integers: Usigned16BitInteger = addNumbers(number1, number2);
    _ = sum_of_integers;
}

//pub for public
//fn function identifier
// variablename: type,

