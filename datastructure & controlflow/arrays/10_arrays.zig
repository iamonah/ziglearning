//! Arrays

const print = @import("std").debug.print;

pub fn main() void {
    const array1: [3]u8 = [3]u8{ 90, 73, 71 };
    const array2 = [_]f16{ 3.14, 1.618 };
    var array3: [3]bool = undefined;
    array3 = [_]bool{ true, true, false };

    print("array1 (any): {any}\n", .{array1});
    print("array1 (s): {s}\n", .{array1});
    print("array2 (any): {any}\n", .{array2});
    //print("array2 (s): {s}\n", .{array2});
    print("array3 (any): {any}\n", .{array3});

    print("\n", .{});
    print("length of array1: {}\n", .{array1.len});
    print("first element of array2: {}\n", .{array2[0]});
    array3[2] = true;
    print("array 3: {any}\n", .{array3});
    //array1[0] = 0;
    array3 = [3]bool{ false, false, false };
    print("array 3: {any}\n", .{array3});

    const merged_array = array1 ++ [_]u8{ 100, 95 };
    print("merged_array: {any}\n", .{merged_array});

    const repeated_array = array1 ** 3;
    print("repeated_array: {any}\n", .{repeated_array});

    const new_default_array = [_]bool{false} ** 10;
    print("new_default_array: {any}\n", .{new_default_array});

    print("\n", .{});
    const matrix_2x3: [2][3]u8 = [_][3]u8{ [_]u8{ 1, 2, 3 }, [3]u8{ 4, 5, 6 } };
    print("matrix_2x3: {any} \n", .{matrix_2x3});
    print("matrix_2x3 row 0 cell 1: {}\n", .{matrix_2x3[0][1]});

    const array4 = [_]u8{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    const array5 = array4[2..7];
    print("array5: {any}\n", .{@TypeOf(array5)});
}

// var num: i32 = undefined; // memory reserved but not initialized

// var maybe_num: ?i32 = null;
// Memory is initialized — it holds a valid tag saying “this is null”.

// You can’t directly use it — you must unwrap it safely.

// concartenate an array using [array] ++ [array]
//repeat array using [array] ** [number]