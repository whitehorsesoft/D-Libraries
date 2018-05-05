module a.pointerplayground;

void test1() {
  import std.stdio;

  int v = 0x01_02_03_04;
  int *address = &v;
  ubyte *bytePointer = cast(ubyte*)address;
  for (int i = 0; i < 4; i++) {
    writeln(bytePointer[i]);
  }
  writef("%02x ", *bytePointer);
}

// function pointer
alias IntFunc = int function(int);

int functionPointerAsParamter(int i, IntFunc intFunc) {
  auto result = intFunc(i);
  return result;
}

int functionPointerAsLambda(int i) {
  auto intFunc = (int j) => j + 1;
  auto result = intFunc(i);
  return result;
}

int tempIntFunc(int i) {
  return i + 1;
}

void useFunctionPointer() {
  import std.stdio;

  auto i = 1;
  auto j = functionPointerAsParamter(i, &tempIntFunc);
  writeln(j);
  auto k = functionPointerAsLambda(i);
  writeln(k);
}

// void function pointer
alias SaveFunc = void function(string fileName);

class Foo {
private:
  SaveFunc _saveFunc;

public:
  this(SaveFunc saveFunc) {
    _saveFunc = saveFunc;
  }

  string doSave() {
    return _saveFunc;
  }
}
