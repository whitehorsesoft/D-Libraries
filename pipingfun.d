void main(string[] args)
{
  // run via './pipingfun | ./pipingfun' at shell
  import std.stdio;
  string inStr;
  readf(" %s", &inStr);
  writeln("altered " ~ inStr);
}

