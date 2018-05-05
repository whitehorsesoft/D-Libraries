module a.checkingplayground;

import std.stdio;
import std.exception;

bool tryCatch() {
  try {
    return true;
  } catch (Exception ex) {
    writeln(ex);
    return false;
  }
}

int assertTest(int i) {
  // assert only ran at run time
  // assert disabled with compiler -release flag
  assert(i > 0);

  // static assert ran at compile time
  static assert(true == true);

  return i + 1;
}

int enforceTest(int i) {
  // enforce wrapper for throwing error
  // useful for non-programmer errors, when
  // a task can't be accomplished

  enforce(i < 0, "Must be at least zero.");
  return i + 1;
}

// activated by compiler -unittest flag
// only if all pass does program continue at main
// if library, must have -run activated
unittest {
  assert(enforceTest(2) == 3);
  assert(enforceTest(2) == 2);
}

void scopeTest(ref int i) {
  i = 10 / i;
  scope(failure) i = 0;
}

void assertTest(ref int i) {
  // never could get this to work properly
  assert(i != 0, "parameter cannot be zero");
  throw new Exception("msg");
  scope(failure) i = 1;
  i = 10 / i;
}

int unitTestableFunc(int x, int y) {
  if (x < 0 || y < 0) return 0;
  if (x > y) return x + 1;
  if (y > x) return x + 2;
  return x;
}

unittest {
  assert(unitTestableFunc(-1, -2) == 0);
  assert(unitTestableFunc(-1, -1) == 0);
  assert(unitTestableFunc(-1, 1) == 0);
  assert(unitTestableFunc(2, 1) == 3);
  assert(unitTestableFunc(1, 2) == 3);
  assert(unitTestableFunc(1, 1) == 1);
}

int contractProgrammingFunc(int i)
in {
  assert(i > 0 && i <= 10);
} out(result) {
  assert(result == i * 2);
}
body {
  return i * 2;
}

struct MyStruct {
  int x, y;
}

class ContractClass {
  MyStruct[2] structs;
  int structCount;

  invariant() {
    assert(structs.length == structCount);
  }

  void TestFunc() {
    
  }
}
