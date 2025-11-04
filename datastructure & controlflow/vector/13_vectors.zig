//! Vectors

const print = @import("std").debug.print;

pub fn main() void {

    const vector6 = @Vector(3, u8);
    const vector1: vector6 = .{ 1, 5, 7 };
    const vector2 = @Vector(3, u8){ 0, 2, 1 };
    print("Vector1: {}\n", .{vector1});
    print("Vector2: {}\n", .{vector2});

    const vector3 = vector1 + vector2;
    print("Vector3: {}\n", .{vector3});

    const scalar_2_vector: @Vector(3, u8) = @splat(2);
    const vector4 = vector3 + scalar_2_vector;
    print("Vector4: {}\n", .{vector4});

    const ReduceOp = @import("std").builtin.ReduceOp;
    const reduce_result = @reduce(ReduceOp.Add, vector4);
    print("reduce result: {}\n", .{reduce_result});

    print("\n", .{});
    print("Vector4, element at index 0: {}\n", .{vector4[0]});
    const array1: [3]u8 = vector4;
    print("arra1: {any}\n", .{array1});
    const vector5: @Vector(3, u8) = array1;
    print("Vector5: {}\n", .{vector5});

    print("\n", .{});
    const Vector5Type = @TypeOf(vector5);
    const vector5TypeInfo = @typeInfo(Vector5Type);
    print("type info of Vector5: {}\n", .{vector5TypeInfo});
    print("length of Vector5: {}\n", .{vector5TypeInfo.vector.len});
}

// you can only add 2 vectors you can't add scaler and vector

// so you can convert a scaler to a vector using a built in spalt function


// we have a built in function that will convert a scaler to a vector function is called reduce

