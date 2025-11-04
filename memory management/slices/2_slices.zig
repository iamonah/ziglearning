//! Slices

const print = @import("std").debug.print;

pub fn main() void {
    var arr1 = [6]u8{ 3, 1, 4, 1, 5, 9 };
    const subarray = arr1[0..2];
    print("type of arr1: {}\n", .{@TypeOf(arr1)});
    print("type of subarray: {}\n", .{@TypeOf(subarray)});

    var runtime_zero: u8 = 0;
    _ = &runtime_zero;
    const slice: []u8 = arr1[runtime_zero..2];
    print("type of slice: {}\n", .{@TypeOf(slice)});
    print("slice: {any}\n", .{slice});
    print("length slice: {any}\n", .{slice.len});

    print("\n", .{});
    print("first element of slice: {}\n", .{slice[0]});
    // print("fifth element of slice: {}\n", .{slice[5]});
    slice[0] = 10;
    print("first element of slice: {}\n", .{slice[0]});

    for (slice) |slice_element| {
        print("Slice element: {}\n", .{slice_element});
    }
}


// in order to get a slice instead of a pointer to an array one of the values has to be runtime known