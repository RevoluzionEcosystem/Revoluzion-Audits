# ForcedToEarn (F2E)

### Audited by:
Revoluzion — https://revoluzion.io

### Smart contract developed by:
Revoluzion — https://revoluzion.io

### Decentralised application developed by:
Revoluzion — https://revoluzion.io

#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import time
import json
import logging
import datetime
import traceback
import threading
import multiprocessing

from multiprocessing import Process, Queue, Pool


def run_proc(name):
    print 'Run child process %s (%s)...' % (name, os.getpid())


def long_time_task(name):
    print 'Run task %s (%s)...' % (name, os.getpid())
    start = time.time()
    time.sleep(random.random() * 3)
    end = time.time()
    print 'Task %s runs %0.2f seconds.' % (name, (end - start))


def write(q):
    print 'Process to write: %s' % os.getpid()
    for value in ['A', 'B', 'C']:
        print 'Put %s to queue...' % value
        q.put(value)
        time.sleep(random.random())


def read(q):
    print 'Process to read: %s' % os.getpid()
    while True:
        value = q.get(True)
        print 'Get %s from queue.' % value


def main():
    print 'Parent process %s.' % os.getpid()
    p = Process(target=run_proc, args=('test',))
    print 'Process will start.'
    p.start()
    p.join()
    print 'Process end.'

    print 'Parent process %s.' % os.getpid()
    p = Pool()
    for i in range(5):
        p.apply_async(long_time_task, args=(i,))
    print 'Waiting for all subprocesses done...'
    p.close()
    p.join()
    print 'All subprocesses done.'

    q = Queue()
    pw = Process(target=write, args=(q,))
    pr = Process(target=read, args=(q,))
    pw.start()
    pr.start()
    pw.join()
    pr.terminate()


if __name__ == '__main__':
    main()

