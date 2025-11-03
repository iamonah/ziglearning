//! Errors

const print = @import("std").debug.print;

// That’s because error sets are compatible if they share common members.
const IOError = error{ FileNotFound, PermissionDenied, ValueIsNull };
const PrintError = error{ValueIsNull};

//remember that main can return void, u8 and !void
pub fn main() !void {
    print("IOError.FileNotFound: {}\n", .{IOError.FileNotFound});
    print("int of IOError.FileNotFOund: {}\n", .{@intFromError(IOError.FileNotFound)});
    print("int of IOError.ValueIsNull: {}\n", .{@intFromError(IOError.ValueIsNull)});
    print("int of PrintError.ValueIsNull: {}\n", .{@intFromError(PrintError.ValueIsNull)});
    print("IOError.ValueIsNull == PrintError.ValueIsNull: {}\n", .{IOError.ValueIsNull == PrintError.ValueIsNull});

    const custom_error = error.ValueIsNull; //shortcut without creating errorset
    print("IOError.ValueIsNull == custom_error: {}\n", .{IOError.ValueIsNull == custom_error});

    print("\n", .{});
    var int_or_error: IOError!u8 = writeToFile();
    int_or_error = IOError.FileNotFound;
    int_or_error = PrintError.ValueIsNull;
    int_or_error = error.FileNotFound;
    // int_or_error = error.AnotherError;
    print("int_or_error: {!}\n", .{int_or_error});
    int_or_error = 10;
    print("int_or_error: {!}\n", .{int_or_error});

    //1: extract error from a error union
    if (int_or_error) |val| {
        //variable does not hold an error
        _ = val;
    } else |err_val| {
        //variable holds an error
        _ = err_val;
    }

    //2: another way to get an error is to use the catch keyword
    int_or_error = IOError.FileNotFound;
    print("int_or_error default unwrap value: {}\n", .{int_or_error catch 5});

    int_or_error = 0;
    var unwrapped_val = try int_or_error;
    _ = &unwrapped_val;
    //equivalent to:
    //unwrapped_val = if (int_or_error) |val| blk: {
    //    break :blk val;
    //} else |err| {
    //    return err;
    //};

    print("\n", .{});
    logError(IOError.FileNotFound);
    logError(PrintError.ValueIsNull);
    logError(error.SomeError);
}

fn writeToFile() !u8 {
    return 5;
}

fn logError(err: anyerror) void {
    print("Error: {}\n", .{err});
}

//an error is assigned to a variable as a value
// error set is a type defined by use that represent a collection of errors comparable to an enum each error gets assigned and underlying integer value

// 2 error set
// const IOError = error{ FileNotFound, PermissionDenied, ValueIsNull };
// const PrintError = error{ValueIsNull};

// if you have 2 errors assigned to the same error set the numeric value assigned to each error is identical



// | Form    | Use Case                          |      |                               |   |                               |
// | ------- | --------------------------------- | ---- | ----------------------------- | - | ----------------------------- |
// | `if (x) | v                                 | else | err                           | ` | Manual destructure and handle |
// | `catch` | Replace error with fallback       |      |                               |   |                               |
// | `catch  | err                               | `    | Handle and recover from error |   |                               |
// | `try`   | Propagate error up the call stack |      |                               |   |                               |



// we have default error unwrap use of catch with default return
// and error unwrap use of try keyword which propagates the error