//! Enums

const print = @import("std").debug.print;

const Direction = enum(u2) { up, down, left = 2, right };

fn movePlayerOld(direction: u2) void {
    if (direction == 0) {
    } else if (direction == 1) {
        print("move left\n", .{});
    } else if (direction == 2) {
        print("move down\n", .{});
    } else if (direction == 3) {
        print("move right\n", .{});
    }
}

fn movePlayer(direction: Direction) void {
    if (direction ==  .up) {
        print("move up\n", .{});
    } else if (direction == Direction.left) {
        print("move left\n", .{});
    } else if (direction == Direction.down) {
        print("move down\n", .{});
    } else if (direction == Direction.right) {
        print("move right\n", .{});
    }
}

const OrderStatus = enum(u4) {
    new,
    confirmed,
    rejected = 6,
    picked_up,
    delivered,

    fn confirmOrder(this: *OrderStatus) void {
        this.* = .confirmed;
        print("Order Confirmed \n", .{});
    }
};

fn changeOrderStatusOld(status: u3) void {
    if (status == 0) {
        print("Order status: New\n", .{});
    } else if (status == 1) {
        print("Order status: Confirmed\n", .{});
    } else if (status == 2) {
        print("Order status: Rejected\n", .{});
    } else if (status == 3) {
        print("Order status: Picked up\n", .{});
    } else if (status == 4) {
        print("Order status: Delivered\n", .{});
    } else {
        print("Invalid value provided \n", .{});
    }
}

fn changeOrderStatus(status: OrderStatus) void {
    if (status == OrderStatus.new) {
        print("Order status: New\n", .{});
    } else if (status == .confirmed) {
        print("Order status: Confirmed\n", .{});
    } else if (status == OrderStatus.rejected) {
        print("Order status: Rejected\n", .{});
    } else if (status == OrderStatus.picked_up) {
        print("Order status: Picked up\n", .{});
    } else if (status == OrderStatus.delivered) {
        print("Order status: Delivered\n", .{});
    }
}

pub fn main() void {
    movePlayerOld(2);
    movePlayer(Direction.down);
    changeOrderStatus(.picked_up);

    print("value of Direction.up: {}\n", .{@intFromEnum(Direction.up)});
    print("value of OrderStatus.rejected: {}\n", .{@intFromEnum(OrderStatus.rejected)});
    print("value of OrderStatus.picked_up: {}\n", .{@intFromEnum(OrderStatus.picked_up)});
    print("value of OrderStatus.delivered: {}\n", .{@intFromEnum(OrderStatus.delivered)});
    print("value of OrderStatus.new: {}\n", .{@intFromEnum(OrderStatus.new)});

    movePlayer(@enumFromInt(0));
    //movePlayer(OrderStatus.new);
    //movePlayerOld(Direction.up);

    var order_status: OrderStatus = .new;
    order_status.confirmOrder();
}

//when you specify a type to an enum it becomes a tagged enum and when you assign a typ eyou can now assing it a value withing the type constraint you assigned


// const OrderStatus = enum { new, confirmed, canceled };
// var s = OrderStatus.new; // only *one* tag active
// A struct stores many values at once (x and y).
// An enum stores one tag at a time (new or confirmed or canceled).

// is not an initialization — it’s a type declaration that defines possible named values (called tags).
// It’s defining a new type with named tags

// So it’s not saying “I’m creating a variable with fields”,
// it’s saying “Here are the possible states this type can have.”

// ou can then create variables of that type, like var s: OrderStatus = .new


//enumgs can have functions(methods) and variables same rules apply as for struct variable belong to the type

// functions can recive the enum been called o if the first parameter has the same type as the enum