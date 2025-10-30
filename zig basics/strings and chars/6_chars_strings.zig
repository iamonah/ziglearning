//! Chars and Strings
const print = @import("std").debug.print;

pub fn main() void {
    const a_char: u7 = 'a';
    print("a character ASCII value: {d}\n", .{a_char});
    const b_char = 'b';
    print("type of b_char: {}\n", .{@TypeOf(b_char)});

    const a_string = "This is a string";
    const another_string = "Another string";
    const greeting: []const u8 = "Hello, Zig!";
    _ = greeting;

    const concat_string = a_string ++ " " ++ another_string;
    print("concat_string: {s}\n", .{concat_string});

    const multiline_string =
        \\Multiline string
        \\Line 2
    ;
    print("{s}\n", .{multiline_string});

    print("type of a string: {}\n", .{@TypeOf(a_string)});

    //a_string[2] = 'T';
}
