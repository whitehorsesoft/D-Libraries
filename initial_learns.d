import std.stdio;
import mod1;

void main() {
  ClassTest();
}

// auto function
auto add(int x, int y) {
  return x + y;
}

struct Point {
  uint x;
  uint y;
}

// structs are copied by value
void StructTest() {
  auto p = Point(1, 2);
  PrintStruct1(p);
  PrintStruct2(p);
}

void PrintStruct1(Point p) {
  writefln("%d", p.x);
  p.x = 3;
  writefln("%d", p.x);
}

void PrintStruct2(Point p) {
  writefln("%d", p.x);
}

void ArrayTest() {
  char[10] arr;
  // slice
  auto dynamicArray = new char[8];
  dynamicArray[] = 'a';
  writefln("%s", dynamicArray[0]);
  dynamicArray[0] += 1;
  writefln("%s", dynamicArray[0]);
  auto dynamicArray2 = dynamicArray[0 .. 4];
  writefln("%s", dynamicArray2[0]);
  dynamicArray2[0] = 'x';
  writefln("%s", dynamicArray2[0]);
  writefln("%s", dynamicArray[0]);
}

void StringTest() {
  auto myString = "
  This could
  be the

  start
  of something amazing.
  ";
  writefln(myString);

  auto wysiwyg = `This is "a type of string that doesn't care if \n " quotes are in it.`;
  writefln(wysiwyg);
}

class Foo {
  uint x;
  uint y;
}

void ClassTest() {
  auto foo = new Foo;
  foo.x = 0;
  writefln("%s", foo.x);
  AlterClass(foo);
  writefln("%s", foo.x);
}

void AlterClass(Foo f) {
  f.x += 1;
}
