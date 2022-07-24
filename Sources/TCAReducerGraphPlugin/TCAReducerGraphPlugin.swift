//
//  TCAReducerGraphPlugin.swift
//
//
//  Created by Mathew Gacy on 7/9/22.
//

import Foundation
import XCGrapherPluginSupport

// MARK: - Dylib makeXCGrapherPlugin exporting

@_cdecl("makeXCGrapherPlugin")
public func makeXCGrapherPlugin() -> UnsafeMutableRawPointer {
    Unmanaged.passRetained(TCAReducerGraphPlugin()).toOpaque()
}

// MARK: - Plugin

public class TCAReducerGraphPlugin: XCGrapherPlugin {
    var parser: Parser

    public required init() {
        self.parser = Parser(patterns: .mobelux)
    }

    public override func process(file: XCGrapherFile) throws -> [Any] {
        guard let domainName = try! parser.domainName(file.filename) else {
            return []
        }

        let children = try! parser.childDomains(file.fileContents)
            .map {
                Reducer(domain: $0, children: [])
            }

        return [Reducer(domain: domainName, children: children)]
    }

    public override func makeArrows(from processResults: [Any]) throws -> [XCGrapherArrow] {
        processResults
            .map { $0 as! Reducer }
            .reduce([]) { arrows, reducer in
                arrows + reducer.children.map { XCGrapherArrow(origin: reducer.domain, destination: $0.domain) }
            }
    }
}
