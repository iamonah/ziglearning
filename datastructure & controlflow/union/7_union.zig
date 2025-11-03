//! Unions

const print = @import("std").debug.print;

const SimpleUnion = union { integer: u8, boolean: bool };

const DataTypes = enum { integer, float, boolean };
const TaggedUnion = union(DataTypes) {
    integer: u8,
    float: f16,
    boolean: bool,

    const num_of_fields: u8 = 3;
    fn display(this: TaggedUnion) void {
        print("{}\n", .{this});
    }
};
const InferredTaggedUnion = union(enum) { field1: u8, field2: f16 };
// An enum is just a named integer type.
pub fn main() void {
    var simple_union: SimpleUnion = SimpleUnion{ .integer = 5 };
    simple_union = SimpleUnion{ .boolean = true };
    print("simple_union: {}\n", .{simple_union.boolean});

    var tagged_union: TaggedUnion = TaggedUnion{ .float = 3.14 };
    tagged_union = TaggedUnion{ .integer = 0 };
    print("tagged_union: {}\n", .{tagged_union});
    print("simple_union: {}\n", .{simple_union});

    print("typeInfo of u8: {}\n", .{@typeInfo(u8)});

    print("number of fields in TaggedUnion: {}\n", .{TaggedUnion.num_of_fields});
    tagged_union.display();
}
//That’s why raw unions are unsafe unless you manually track which field is in use.

// Why use tagged unions

// Tagged unions are super powerful for representing values that can take multiple forms.
// Examples:

// A Response that is either .ok with data or .error with a message

// A Shape that can be .circle, .square, or .triangle

// A Token in a compiler that can be .identifier, .number, .operator, etc.


// | Concept                          | Description                    | Memory                | Safe?                               |
// | -------------------------------- | ------------------------------ | --------------------- | ----------------------------------- |
// | **struct**                       | All fields exist together      | Sum of all fields     | ✅ Safe                              |
// | **union**                        | Only one field at a time       | Size of largest field | ⚠️ Unsafe unless you track manually |
// | **tagged union (`union(enum)`)** | Union + automatic tag tracking | Field + tag           | ✅ Safe                              |


// defines a set of possible types a variable can break

// has fields like a struct but only one field can be active a t a time

// to chage the active field union needs to be reassigned
// access non active fieds is undefined behaviour
// cannot determine active field 


// a tagged union as na underlying enum
// allows us determine active field programatically 
// must have same field as underlying enum 
// taggeg union can be infered use enum keyword instead of a specific enum DataTypes