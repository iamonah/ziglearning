//! Intro to Allocators

const print = @import("std").debug.print;
const Allocator = @import("std").mem.Allocator;
const GeneralPurposeAllocator = @import("std").heap.GeneralPurposeAllocator;

const LinkedListNode = struct {
    value: u8,
    next: ?*LinkedListNode = null,

    fn push(this: *LinkedListNode, new_val: u8, allocator: Allocator) !void {
        // var next_node = LinkedListNode{ .value = new_val };
        // this.next = &next_node;
        const next_node: *LinkedListNode = try allocator.create(LinkedListNode);
        errdefer allocator.destroy(next_node);

        next_node.* = LinkedListNode{ .value = new_val };
        this.next = next_node;
    }
};

fn createSlice(num1: u8, num2: u8, num3: u8, allocator: Allocator) ![]u8 {
    var output: []u8 = try allocator.alloc(u8, 3);
    output[0] = num1;
    output[1] = num2;
    output[2] = num3;
    return output;
}

pub fn main() !void {
    var gpa = GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator: Allocator = gpa.allocator();

    var head_node: LinkedListNode = LinkedListNode{ .value = 10 };
    try head_node.push(13, allocator);
    defer allocator.destroy(head_node.next.?);
    print("head node value: {}\n", .{head_node.value});
    print("next node value: {}\n", .{head_node.next.?.value});

    print("\n", .{});
    var slice1 = try createSlice(3, 1, 4, allocator);
    defer allocator.free(slice1);
    print("slice1: {any}\n", .{slice1});
    slice1[0] = 10;
    print("slice1: {any}\n", .{slice1});
}
