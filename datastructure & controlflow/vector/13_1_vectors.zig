//! Vectors

const print = @import("std").debug.print;

pub fn main() void {
    const vector1: @Vector(3, u8) = @Vector(3, u8){ 1, 5, 7 };
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
    //Correction: as of Zig version 0.14.0, the "vector" field name is lowercase, instead of uppercase
    print("length of Vector5: {}\n", .{vector5TypeInfo.vector.len});
}
