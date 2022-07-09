//
//  TCAReducerGraphPlugin.swift
//
//
//  Created by Mathew Gacy on 7/9/22.
//

import XCGrapherPluginSupport

// MARK: - Dylib makeXCGrapherPlugin exporting

@_cdecl("makeXCGrapherPlugin")
public func makeXCGrapherPlugin() -> UnsafeMutableRawPointer {
    Unmanaged.passRetained(TCAReducerGraphPlugin()).toOpaque()
}

// MARK: - Plugin

public class TCAReducerGraphPlugin: XCGrapherPlugin {
    // ...
}
