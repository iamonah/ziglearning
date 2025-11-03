//! For loop

const print = @import("std").debug.print;

pub fn main() void {
    const array1: [5]u8 = [_]u8{ 1, 2, 3, 4, 5 };
    for (array1) |array_item| {
        print("element of array1: {}\n", .{array_item});
    }

    print("\n", .{});
    for (0..5) |i| {
        print("element of the range: {}\n", .{i});
    }

    print("\n", .{});
    const array2: [5]u8 = [_]u8{ 10, 9, 8, 7, 6 };
    for (array1, array2) |array1_item, array2_item| {
        print("array1: {}, array2: {}\n", .{ array1_item, array2_item });
    }

    print("\n", .{});
    for (array1, 0..) |array_item, idx| {
         //if you want to keep track of both value and index of element
        print("element at index {}: {}\n", .{ idx, array_item });
    }

    print("\n", .{});
    var array3: [3]u8 = [_]u8{ 2, 3, 4 };
    for (&array3) |*array_item| {
        array_item.* *= 2;
    }
    print("array3 after for loop: {any}\n", .{array3});

    print("\n", .{});
    const for_val: u8 = for (array1) |array_item| {
        if (array_item == 4) break 12;
        if (array_item == 5) continue;
        print("array1: {}\n", .{array_item});
    } else blk: {
        print("Done iterating over array1\n", .{});
        break :blk 20;
    };
    print("value of for loop: {}\n", .{for_val});
}

//both for loop and while loop can have an else branch

//using the continue key word we don't skip the else branch but using the break we skip the else branch

// for loops and while loops are expression that can both return a value

// ranges include lower bound and not upper bound