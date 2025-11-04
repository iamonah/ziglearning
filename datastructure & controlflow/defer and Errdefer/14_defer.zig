//! defer and errdefer

const print = @import("std").debug.print;

pub fn main() !void {
    defer print("Goodbye \n", .{});
    errdefer print("Program crashed \n", .{});
    defer print("Preparing to shut down...\n", .{});
    print("Start \n", .{});

    print("Main function body 1 \n", .{});

    defer {
        print("deferred block. \n", .{});
    }

    // const err_union: anyerror!u8 = error.SomeError;
    // try err_union;

    print("\n", .{});
    {
        defer print("deferred expression inside of block \n", .{});
        print("block body, line 1 \n", .{});
        print("block body, line 2 \n", .{});
    }
    print("\n", .{});

    var counter: u8 = 0;
    while (counter < 3) : (counter += 1) {
        defer print("while loop iteration completed \n", .{});
        print("while loop iteration: {}\n", .{counter});
    }
    print("\n", .{});

    print("Main function body 2 \n", .{});

    print("Goodbye \n", .{});
}


// when we use defer its gurantted to be called on scope exit