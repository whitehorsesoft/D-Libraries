module a.statsplayground;

import std.stdio;

void aσ() {
  writeln("completed σ");
}

// 03C3 for σ
float σ(float[] dataset) {
  import std.algorithm.iteration;
  import std.math;

  auto s = sum(dataset);
  auto avg = s / dataset.length;
  auto diffs = map!(x => pow(x - avg, 2))(dataset);
  auto s2 = sum(diffs);
  auto div = s2 / (dataset.length - 1);
  auto result = sqrt(div);
  return result;
}

auto sampleDataSet(ushort length) {
  import std.math;
  import std.random;
  import std.parallelism;

  float[] dataSet;
  dataSet.length = pow(10, length);
  foreach (ref data; parallel(dataSet)) {
    data = uniform(-10f, 10f);
  }

  return dataSet;
}
