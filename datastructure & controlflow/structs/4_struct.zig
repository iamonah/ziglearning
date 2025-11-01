//! Struct

const print = @import("std").debug.print;

const Point = struct {
    x: u8,
    y: u8,
    z: u8 = 0,

    // ➜ This is a compile-time constant inside the type itself.
    const num_of_dimensions = 3;
    var num_of_points_created: u8 = 0;

    fn init(x: u8, y: u8, z: u8) Point {
        num_of_points_created += 1;
        return Point{ .x = x, .y = y, .z = z };
    }

    fn printPoint(this: Point) void {
        const placeholders = .{ this.x, this.y, this.z };
        print("Point: ({}, {}, {})\n", placeholders);
    }

    fn increment(this: *Point) void {
        this.x += 1;
        this.y += 1;
        this.z += 1;
    }
};
// So Zig makes you consciously decide when to mutate

pub fn main() void {
    print("type of Point: {}\n", .{@TypeOf(Point)});

    const origin: Point = Point{ .x = 0, .y = 0 };
    origin.printPoint();
    const point1 = Point{ .x = 3, .y = 2, .z = 7 };
    point1.printPoint();
    const point2: Point = .{ .x = 2, .y = 2 };
    point2.printPoint();

    print("num_of_dimensions of Point: {}\n", .{Point.num_of_dimensions});
    var point3: Point = Point.init(3, 3, 3);
    Point.printPoint(point3);

    print("\n", .{});
    print("num of points created so far: {}\n", .{Point.num_of_points_created});

    print("Point 3:\n", .{});
    point3.printPoint();
    point3.increment();
    point3.printPoint();

    print("\n", .{});
    var num5: u8 = 5;
    _ = &num5;
    var x = "ABC";
    _ = &x;

    var tuple1 = .{ 2, num5, true, x };
    print("tuple1: {}\n", .{tuple1});
    print("value at index 0: {}\n", .{tuple1[0]});
    print("value at index 0: {}\n", .{tuple1.@"0"});

    print("number of elements in tuple1: {}\n", .{tuple1.len});

    tuple1[3] = "lop";
    print("changed tuple1: {}\n", .{tuple1});
    print("changed x: {s}\n", .{x});

    print("\n", .{});
    print("type of tuple1: {}\n", .{@TypeOf(tuple1)});
    print("tuple1 after reassignment: {}\n", .{tuple1});

    const tuple2 = .{ 1, false };
    const tuple3 = tuple1 ++ tuple2;
    print("tuple3: {} with length: {}\n", .{ tuple3, tuple3.len });

    const tuple4 = tuple2 ** 3;
    print("tuple4: {} with length: {}\n", .{ tuple4, tuple4.len });

    var p = Point{ .x = 1, .y = 2 };
    p.x = 5; // ❌ error (because p is const)

    var k: i32 = 10;
    const z = &k; // const pointer
    z.* = 20;
    print("value {d}\n", .{k});

    var w: i32 = 10;
    _ = &w;
    const j = w;
    // j = 20;
    print("typej {}", .{@TypeOf(j)});
}

//struct a collection of fields of any type under a single name

// ➜ This is a type-level mutable variable, shared by all instances.
// Like a static variable in C or a package-level variable in Go.
// Every time you call init(), you increment this — so it keeps track of all Points created.

//struct is a collection of various data under a single name
// hold (fields,variables, functions)

//fields belong to the instance of a struct mutable if the struct instace is mutable
//variables belong to the struct, shared between struct instances mutable if the vairable itself is mutable

//functions can be called on the instance of the struct itself

// So even though 2, true, and "ABC" are compile-time constants, the whole tuple is treated as a runtime value, because num5 is not comptime-known.

// Exactly—comptime types (more precisely, comptime-known values or fields) are not changeable at runtime.

// const protects the binding itself.

// If it’s a pointer, you can mutate the data it points to (if that data is mutable).

// If it’s a value, there’s nothing behind it to mutate.