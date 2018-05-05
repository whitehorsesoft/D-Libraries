import std.stdio: writeln;

void main(string[] args) {
  auto f = new Foo();
  writeln(func1!(int, int, bool, string)(f));
}

struct MyStruct(T, U) {
  T a;
  U b;
}

interface TemplateInterface(T, U, V, W) {
  T x();
  U y();
  MyStruct!(V, W) astruct(T inputThing);
}

class Foo : TemplateInterface!(int, int, bool, string) {
  int x() { return 1; }
  int y() { return 1; }
  MyStruct!(bool, string) astruct(int inputThing) {
    return MyStruct!(bool, string)(true, "a");
  }
}

T func1(T, U, V, W) (TemplateInterface!(T, U, V, W) intf) {
  return func2!(T, U, V, W)(intf);
}

T func2(T, U, V, W) (TemplateInterface!(T, U, V, W) intf) {
  return intf.x;
}

