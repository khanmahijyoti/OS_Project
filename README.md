# OS_Project

# Project 7: Advanced Synchronization - File Sharing with `flock`

## Overview

This project demonstrates the implementation and usage of a custom `flock` system call to handle advanced file synchronization scenarios in a multithreaded environment. The `flock` system call provides advisory file locking capabilities similar to those found in the Linux system (`man 2 flock`), enabling multiple threads to coordinate shared and exclusive access to a file.

## Key Features

- **Exclusive Locking (LOCK_EX)**: Ensures that only one thread can access the file at a time. All other threads are blocked until the lock is released.
- **Shared Locking (LOCK_SH)**: Allows multiple threads to read from the file concurrently. Blocks exclusive lock requests until all shared locks are released.
- **Non-blocking Mode (LOCK_NB)**: Threads can attempt to acquire a lock without blocking. If the lock is not immediately available, the call fails.
- **Unlocking (LOCK_UN)**: Releases the lock held by the calling thread. Locks are also automatically released on `close()` or thread exit.

## Directory Structure

<!-- markup for a directoryy -->

```
flocktest/
├── flock.c # Implementation of the custom flock system call logic
├── flocktest.c # Entry point to run test cases for flock functionality
├── flockdemo.c # Demonstrates shared and exclusive locks using multiple threads
├── flockreader.c # Simulates a thread acquiring a shared (reader) lock
├── flockwriter.c # Simulates a thread acquiring an exclusive (writer) lock
├── flockstall.c # Tests blocking behavior when lock is unavailable
├── test_flock.c # Unit tests for validating the correctness of flock behavior
└── test/
   └── test_flock.c # Duplicate or sandboxed test file under test directory
```
## Compilation Instructions

Ensure you are working on a Linux system with kernel development tools installed.

```bash
make
```
This will build the user-level test application and link it with the necessary system call wrapper (if applicable).

## How to Run
Execute the flocktest binary to simulate multiple threads accessing the same file with synchronization:

```bash
./flocktest
```




