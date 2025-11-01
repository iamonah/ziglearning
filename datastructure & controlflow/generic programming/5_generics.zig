//! Generic Programming

const print = @import("std").debug.print;

// const Point = struct { x: u8, y: u8, z: u8 };

fn Point(comptime T: type) type {
    return struct { x: T, y: T, z: T };
}

fn LinkedList(comptime T: type) type {
    return struct { data: T, next: ?*@This() = null };
}

pub fn main() void {
    const U8Point = Point(u8);
    const origin: U8Point = U8Point{ .x = 0, .y = 0, .z = 0 };
    print("origin: {any}\n", .{@TypeOf(origin)});

    const U8LinkedList = LinkedList(u8);
    var head_node: U8LinkedList = U8LinkedList{ .data = 10 };
    var next_node: U8LinkedList = U8LinkedList{ .data = 15 };
    head_node.next = &next_node;
    print("\n", .{});
    print("head_node: {}\n", .{head_node});
}

//generic programming is the ability to speicfy a data structure dynamically
// zig generic programming is accomplished by a function that accpets a "type" and return a struct


//when type has no global name and is not known
    // return struct { data: T, next: ?*@This() = null };

// another possibility if type is known
// const Node = struct {
//     value: i32,
//     next: ?*Node,
// };
