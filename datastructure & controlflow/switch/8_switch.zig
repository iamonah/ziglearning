//! Switch

const print = @import("std").debug.print;

pub fn main() void {
    const value = 10;
    _ = &value;
    const twelve = 12;
    const thirteen: u8 = 13;
    _ = &thirteen;

    switch (thirteen) {
        0 => print("value is 0 \n", .{}),
        1 => {
            _ = dummyFunction();
        },
        2 => print("value is 2 \n", .{}),
        3, 4 => print("value is either 3 or 4 \n", .{}),
        5...10 => print("value is between 5 and 10 (inclusive) \n", .{}),
        10 + 1 => print("value is 11 \n", .{}),
        twelve => print("value is 12 \n", .{}),
        // thirteen...255 => print("value is 13 \n", .{}),
        else => print("value is something else \n", .{}),
    }

    const output = switch (value) {
        0 => 123,
        1 => 25,
        2...10 => |val| val * 2,
        11 => |val| blk: {
            break :blk val + 25;
        },
        else => 100,
    };
    print("output from switch expression: {}\n", .{output});

    var a_boolean = true;
    print("type of a_boolean: {}\n", .{@TypeOf(a_boolean)});

    _ = &a_boolean;
    switch (a_boolean) {
        true => print("a_boolean is true\n", .{}),
        false => print("a_boolean is false\n", .{}),
    }

    const data_type_enum: DataTypes = DataTypes.integer;
    switch (data_type_enum) {
        DataTypes.integer => print("enum is an integer \n", .{}),
        DataTypes.float => print("enum is a float \n", .{}),
        else => print("enum is something else", .{}),
    }

    var tagged_union: TaggedUnion = TaggedUnion{ .float = 3.14 };
    switch (tagged_union) {
        TaggedUnion.integer => print("Integer field is active \n", .{}),
        TaggedUnion.float => |*val| {
            val.* = 0;
            print("Float field is active: {} \n", .{val.*});
        },
        TaggedUnion.boolean => print("Boolean field is active \n", .{}),
    }
    print("tagged union after switch: {}\n", .{tagged_union});
}

const DataTypes = enum { integer, float, boolean };
const TaggedUnion = union(DataTypes) { integer: u8, float: f16, boolean: bool };

fn dummyFunction() bool {
    return true;
}

// we can't use run time variables as cases for our swtich statment
// It’s more like a compile-time pattern matcher — it must know all possible values at compile time to ensure the code is safe and complete.

// Zig’s switch is designed for compile-time exhaustiveness checking.

// for runtime branching use if/ else

// var x: u8 = 2;
// if (x == 1) {
//     print("one\n", .{});
// } else if (x == 2) {
//     print("two\n", .{});
// } else {
//     print("other\n", .{});
// }

// Use switch on runtime values only if all branches are handled and types match —
// Zig allows it when it can verify all possibilities without needing comptime knowledge.

// Example:

// var x: u8 = 2;
// switch (x) {
//     1 => print("one\n", .{}),
//     2 => print("two\n", .{}),
//     else => print("other\n", .{}
// }

// | Case                        | Works? | Why                                  |
// | --------------------------- | ------ | ------------------------------------ |
// | `const` value               | ✅      | Known at compile time                |
// | `var` value without `else`  | ❌      | Not exhaustive or compile-time-known |
// | `var` value with `else`     | ✅      | Exhaustive; safe at runtime          |
// | Enum `switch` missing a tag | ❌      | Zig enforces full coverage           |

// we can use swtich with any value that can be enumerated


// “If it’s known at runtime, use if/else.
// If it’s known at compile time, use switch.”

// That’s a rule of thumb, not a hard restriction.

// What it really means is:

// switch shines when you’re dealing with discrete, enumerable cases (like small sets of constants, enums, or tags in a union).

// if/else is better for general runtime conditions that may involve ranges, calculations, or more complex expressions.