//! Pointers

const print = @import("std").debug.print;

pub fn main() void {
    var number1: u8 = 153;
    const number1_ptr: *u8 = &number1;
    const number1_ptr_address: usize = @intFromPtr(number1_ptr);

    print("number1: {}\n", .{number1});
    print("number1_ptr unwrapped: {}\n", .{number1_ptr.*});
    print("address of number1_ptr: {}\n", .{number1_ptr_address});

    print("\n", .{});
    incrementNumber(number1_ptr);
    print("number1: {}\n", .{number1});

    const number2: u8 = 100;
    const number2_ptr = &number2;
    //incrementNumber(number2_ptr);
    print("Type of number1_ptr: {}\n", .{@TypeOf(number1_ptr)});
    print("Type of number2_ptr: {}\n", .{@TypeOf(number2_ptr)});
    printPtrAddress(number1_ptr);
    printPtrAddress(number2_ptr);

    print("\n", .{});
    const origin: Point = Point{ .x = 0, .y = 0 };
    const origin_ptr = &origin;
    print("origin: ({}, {}) \n", .{ origin_ptr.*.x, origin_ptr.y });

    print("\n", .{});
    var arr1 = [6]u8{ 3, 1, 4, 1, 5, 9 };
    const arr2 = [_]u8{ 1, 2, 3 };
    const many_item_ptr: [*]u8 = &arr1; //many itme pointer it contains many pointers and has an unkonwn lenght
    const many_item_ptr2: [*]const u8 = &arr2;
    print("first element of many_item_ptr: {}\n", .{many_item_ptr[0]});
    print("first element of many_item_ptr2: {}\n", .{many_item_ptr2[0]});
    print("tenth element of many_item_ptr: {}\n", .{many_item_ptr[10]});

    many_item_ptr[0] = 10;
    many_item_ptr[10] = 0;
    print("\n", .{});
    print("first element of many_item_ptr: {}\n", .{many_item_ptr[0]});
    print("tenth element of many_item_ptr: {}\n", .{many_item_ptr[10]});

    var head_node = LinkedListNode{ .value = 0 };
    head_node.push(5);
    print("value of head node: {}\n", .{head_node.value});
    print("value of next node: {}\n", .{head_node.next.?.value});
}

const LinkedListNode = struct {
    value: u8,
    next: ?*LinkedListNode = null,

    fn push(this: *LinkedListNode, new_val: u8) void {
        var next_node = LinkedListNode{ .value = new_val };
        this.next = &next_node;
    }
};

const Point = struct { x: u8, y: u8 };

fn incrementNumber(input: *u8) void {
    print("Type of Input: {}\n", .{@TypeOf(input)});

    input.* += 1;
}

fn printPtrAddress(ptr: *const u8) void {
    print("The address is: {}\n", .{@intFromPtr(ptr)});
}

//values passed to functions are constant to modify it we use a pointer
// a constant pointer cannot be changed

//single item pointer

//if its a pointe to a struct or an array we don't need to derefernce to accss it zig does implice dreferncing

//many item pointer

// with many item pointer we need to be careful to access values cause we can access values outside of the bounds of our intilziation so be careful

// Function parameters are const unless passed as a mutable pointer (*T).

// Variables declared inside a function live on the stack, and once the function returns, that stack frame is destroyed.