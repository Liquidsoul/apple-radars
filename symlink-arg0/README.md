# Sample code showing a ProcessInfo.processInfo.arguments[0] issue with symlink

## Context

- a binary using `ProcessInfo.processInfo.arguments[0]`
- a symlink pointing to the binary

## Problem

The information returned by the `ProcessInfo` call is dependent of the current directory you call the symlink from.

If you call the symlink from a folder in the path of the symlink, the given information will be the path of the symlink.

However, if you call the symlink from a folder outside of the path of the symlink, the target path is given.

The following schema shows the calls locations and the given information:
```
.
├── local
│   ├── bin
│   │   ├── symlink
│   │   ├── <gives symlink path>
│   │   └── folder
│   │       └── <gives target path>
│   └── <gives symlink path>
├── <gives symlink path>
└── folder-branch
    └── <gives target path>
```
