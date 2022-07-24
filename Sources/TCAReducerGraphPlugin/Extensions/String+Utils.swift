//
//  String+Utils.swift
//  
//
//  Created by Mathew Gacy on 7/24/22.
//

import Foundation

public extension String {
    var range: NSRange { NSRange(location: 0, length: count) }

    func substring(with nsRange: NSRange) -> Substring? {
        guard let range = Range(nsRange, in: self) else { return nil }
        return self[range]
    }

    func matches(
        pattern: String,
        expressionOptions: NSRegularExpression.Options = [],
        matchOptions: NSRegularExpression.MatchingOptions = []
    ) throws -> [NSTextCheckingResult] {
        let regEx = try NSRegularExpression(pattern: pattern, options: expressionOptions)
        return regEx.matches(in: self, options:matchOptions)
    }
}
