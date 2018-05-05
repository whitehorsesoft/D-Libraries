module a.concurrencyplayground;
  import core.thread;
  import std.stdio;
  import std.concurrency;
  import std.format;

void startThreads() {
  writeln("starting startThreads");
  auto worker = spawn(&workerRec);
  Thread.sleep(1.seconds);
  worker.send(-1);
  // spawn(&messageWorkerWithName, "w1", 3);
  // spawn(&messageWorkerWithName, "w2", 1);
  // writefln("%s", receiveOnly!string());
  // writefln("%s", receiveOnly!string());
  // writefln("%s", receiveOnly!string());
  // writefln("%s", receiveOnly!string());
  writeln("end of startThreads");
}

void sleepWorker() {
  Thread.sleep(1000.msecs);
  writefln("%s worker done", thisTid);
}

void messageWorker() {
  Thread.sleep(500.msecs);
  ownerTid.send("message worker done");
}

void messageWorkerWithName(string name, int waitTime) {
  ownerTid.send(format!"%s started"(name));
  Thread.sleep(waitTime.seconds);
  ownerTid.send(format!"%s completed"(name));
}

void workerRec() {
  int value = 0;

  while (value >= 0) {
    writeln("worker waiting...");
    value = receiveOnly!int();
  }
  writeln("worker stopped");
}
