//! If/else expressions

const print = @import("std").debug.print;

pub fn main() void {
    print("Condition: Boolean expression \n", .{});
    const num1 = 5;
    if (num1 == 5) {
        print("Variable num1 equals 5 \n", .{});
    } else if (num1 > 0) {
        print("Variable num1 is positive \n", .{});
    } else {
        print("Else \n", .{});
    }

    print("\n", .{});
    print("Condition: Optional variable \n", .{});
    var optional_var1: ?u8 = null;
    var optional_var2: ?u8 = 0;
    _ = &optional_var1;
    _ = &optional_var2;
    if (optional_var1) |_| {
        print("optional_var1 is not null", .{});
    } else if (optional_var2) |*unwrapped_val| {
        unwrapped_val.* += 1;
        print("The value of optional_var1 is {}\n", .{unwrapped_val.*});
    } else {
        print("Both optional variables are null \n", .{});
    }
    print("optional_var2 outside of if expression: {?}\n", .{optional_var2});

    print("\n", .{});
    print("Condition: Error union variable \n", .{});

    var error_union: anyerror!u8 = error.SomeError;
    print("Error occurred: {s}\n", .{@errorName(error.SomeError)});

    _ = &error_union;
    if (error_union) |unwrapped_val| {
        print("The value of error_union: {}\n", .{unwrapped_val});
    } else |error_val| {
        print("Error union holds an error: {}\n", .{error_val});
    }

    print("\n", .{});
    print("Condition: Mixed \n", .{});
    if (num1 == 3) {
        print("num1 equals 3 \n", .{});
    } else if (optional_var1) |_| {
        print("optional_var1 is not null \n", .{});
    } else if (error_union) |_| {
        print("error_union does not hold an error", .{});
    } else |_| {
        print("error_union holds an error \n", .{});
    }

    print("\n", .{});
    print("If Expression \n", .{});
    const if_value: u8 = if (optional_var1) |_| if_branch: {
        break :if_branch 5;
    } else if (optional_var2) |_| 7 else 10;
    print("if_value: {}\n", .{if_value});
}


//Why this design?

// Because Zig wants the dot (.) operator to always mean "access a member of something" — regardless of what kind of thing it is.

// So:

// s.field → access struct field

// p.* → access the pointed-to value

// x.? → access the unwrapped value of an optional

// In other words:

// The .* and .? behave like “synthetic fields” — they act like .field, but their meaning depends on type.




//P.*     pointer dereference


// available conditions

// boolean
// optional
// error union