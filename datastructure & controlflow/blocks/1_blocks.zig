//! Blocks

const print = @import("std").debug.print;

const pi = 3.14;
pub fn main() void {
    const block_output = outer_block: {
        //this is a block
        var x: u8 = 5;
        x += 1;
        x = inner_block: {
            if (x == 6) {
                break :outer_block 0;
            }
            print("x: {}\n", .{x});
            break :inner_block 9;
        };
        break :outer_block x;
    };
    print("output of the outer block: {}\n", .{block_output});

    const empty_block = {};
    print("type of empty_block: {}\n", .{@TypeOf(empty_block)});
}

//blocks are expression and they are labeled this is a label  outer_block:

//In Zig, { ... } by itself defines a block expression — a sequence of statements that produces a value (the value of its last expression).


// | Syntax      | Meaning                                         |
// | ----------- | ----------------------------------------------- |
// | `struct {}` | Defines a **struct type** with no fields        |
// | `.{}`       | Constructs a **tuple literal** (possibly empty) |
// | `{}`        | A **block expression**, not a data type         |


// block is used to limit a scope of variables

// variables inside a block cannot have same names as variables outside a block

// defined by curly brackets


// to return a value in block the blocks must be labelled and the break key word is used inside the block