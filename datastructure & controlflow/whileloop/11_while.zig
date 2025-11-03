//! While loop

const print = @import("std").debug.print;

pub fn main() void {
    var i: u8 = 0;
    while (i < 10) : (i += 1) {
       print("Iteration number: {}\n", .{i});
    }

    var j: u8 = 0;
    while (true) {
        print("Iteration number: {}\n", .{j});
        j += 1;          //        if (j == 10) {

        if (j == 10) {
            break;
        }
    }

//nested loops
    print("\n", .{});
    var outer_counter: u8 = 0;
    outer: while (outer_counter < 5) : (outer_counter += 1) {
        if (outer_counter == 2) continue :outer;

        print("Nested loops, Outer: {}\n", .{outer_counter});
        var inner_counter: u8 = 0;
        while (inner_counter < 3) : (inner_counter += 1) {
            print("Nested loops, Inner: {}\n", .{inner_counter});
            if (outer_counter == 3 and inner_counter == 1) {
                break :outer;
            }
        }
    }

    print("\n", .{});
    var counter: u8 = 0;
    const while_val: u8 = while (counter < 5) : (counter += 1) {
        print("Iteration number: {}\n", .{counter});
        // if (counter == 3) break :loop_label 10;
    } else 5;
    //else else_block: {
    // print("Done\n", .{});
    //    break :else_block 5;
    //};
    //print("Done\n", .{});
    print("value returned by a loop: {}\n", .{while_val});

    print("\n", .{});
    var optional: ?u8 = 0;
    while (optional) |*unwrapped_val| : (unwrapped_val.* += 1) {
        print("unwrapped value: {}\n", .{unwrapped_val.*});
        if (unwrapped_val.* == 3) {
            optional = null;
        }
    } else {
        print("Optional loop has terminated \n", .{});
    }

    print("\n", .{});
    var err_union: anyerror!u8 = 0;
    while (err_union) |*unwrapped_val| : (unwrapped_val.* += 1) {
        print("unwrapped value: {}\n", .{unwrapped_val.*});
        if (unwrapped_val.* == 3) {
            err_union = error.SomeError;
        }
    } else |err_val| {
        print("The loop has reached an error: {}\n", .{err_val});
    }
}


// condition might be a boolean expression, optional variabe or error union