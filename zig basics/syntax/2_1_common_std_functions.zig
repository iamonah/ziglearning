//! Common Standard Library Functions

pub fn main() void {
    const number: u8 = 65;

    @import("std").debug.print("Number: {}\n", .{number});
    @import("std").debug.print("Number (d): {d}\n", .{number});
    @import("std").debug.print("Number (x): {x}\n", .{number});
    @import("std").debug.print("Number (o): {o}\n", .{number});
    @import("std").debug.print("Number (b): {b}\n", .{number});
    @import("std").debug.print("Number (c): {c}\n", .{number});
    // @import("std").debug.print("Number (s): {s}\n", .{number});
    @import("std").debug.print("String: {s}\n", .{"This is a string"});
    
    // Correction: as of Zig version 0.15.1, the following line will cause a compilation error
    // @import("std").debug.print("Number (?): {?}\n", .{number});
    // "?" specifier can no longer be used with non-optional variables
    // Optional types will be covered in a future lesson
    @import("std").debug.print("Number (any): {any}\n", .{number});

    @import("std").log.debug("Debug message", .{});
    @import("std").log.warn("Warning message", .{});
    @import("std").log.info("Info message", .{});
    @import("std").log.err("Error message", .{});

    const array1: [3]u8 = [3]u8{ 2, 5, 7 };
    const array2: [3]u8 = [3]u8{ 2, 5, 8 };
    const arrays_are_equal: bool = @import("std").mem.eql(u8, &array1, &array2);
    @import("std").debug.print("Arrays are equal: {}\n", .{arrays_are_equal});
}
