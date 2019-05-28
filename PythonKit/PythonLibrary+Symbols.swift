//===-- PythonLibrary+Symbols.swift ---------------------------*- swift -*-===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2018 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
//
// This file defines the Python symbols required for the interoperability layer.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Required Python typealias and constants.
//===----------------------------------------------------------------------===//

import PythonLib

typealias PyObjectPointer = UnsafeMutablePointer<PyObject>

typealias PyCCharPointer = UnsafePointer<Int8>

func PyRun_SimpleString(_ str: PyCCharPointer) -> Int32 {
    return gilEnsure {
        return PyRun_SimpleStringFlags(str, nil)
    }
}

let PyTrue =
    withUnsafeMutablePointer(to: &_Py_TrueStruct) { pointer in
        return UnsafeMutablePointer<PyObject>(UnsafeMutableRawPointer(pointer).bindMemory(to: PyObject.self, capacity: 1))
    }

let PyFalse =
    withUnsafeMutablePointer(to: &_Py_FalseStruct) { pointer in
        return UnsafeMutablePointer<PyObject>(UnsafeMutableRawPointer(pointer).bindMemory(to: PyObject.self, capacity: 1))
    }
