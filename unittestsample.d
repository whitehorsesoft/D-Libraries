    int foo(int i) { return i + 1; }

    unittest {
      assert(foo(1) == 2); // should fail
    }
