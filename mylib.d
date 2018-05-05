module a.mylib;

struct MyStruct {
  int a;
  int b;
  private:
  int c;
}

int[2] mySlice() {
  int[4] a = [1, 2, 3, 4];
  return a[0..2]; // returns 1, 2
}

struct Point {
  ushort x, y;
}

T ambiguousFunction(T)(string inputMessage) {
  import std.stdio : readf;
  import std.stdio : writef;

  writef("%s (%s): ", inputMessage, T.stringof);

  T response;
  readf(" %s", &response);

  return response;
}

// specialization of ambiguousFunction
T ambiguousFunction(T : Point)(string inputMessage) {
  import std.stdio : readf;
  import std.stdio : writef;

  writef("%s (%s): ", inputMessage, T.stringof);

  auto x = ambiguousFunction!ushort(" x");
  auto y = ambiguousFunction!ushort(" y");

  return Point(x, y);
}

// parallelism
struct Thing(T) {
  T id;

  void aSlowFunction() {
    import std.stdio : writefln;
    import core.thread;

    writefln("Work on %s has begun.", id);
    Thread.sleep(1.seconds);
    writefln("Work on %s has ended.", id);
  }
  
}
