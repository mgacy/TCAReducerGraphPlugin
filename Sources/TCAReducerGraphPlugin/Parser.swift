//
//  Parser.swift
//  
//
//  Created by Mathew Gacy on 7/24/22.
//

import Foundation

// MARK: - Configuration

public struct Patterns {
    public var domain: String
    public var reducer: String
}

public extension Patterns {
    static let mobelux = Patterns(
        domain: #"(?<domainName>[a-zA-Z]+)Domain\.swift"#,
        reducer: #"(?<childReducer>[a-zA-Z]+)Domain\.reducer"#)
}

// MARK: - Parser

public struct Parser {
    var patterns: Patterns

    public init(patterns: Patterns) {
        self.patterns = patterns
    }

    public func domainName(_ text: String) throws -> String? {
        let regEx = try NSRegularExpression(pattern: patterns.domain)
        return regEx.firstMatch(in: text)
            .flatMap { $0.string(in: text, withName: "domainName") }
    }

    public func childDomains(_ text: String) throws -> [String] {
        let regex = try NSRegularExpression(pattern: patterns.reducer)
        return regex.matches(in: text)
            .compactMap { $0.string(in: text, withName: "childReducer") }
    }
}
