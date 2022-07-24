//
//  NSRegularExpression+Utils.swift
//  
//
//  Created by Mathew Gacy on 7/24/22.
//

import Foundation

public extension NSRegularExpression {
    func matches(in string: String, options: NSRegularExpression.MatchingOptions = []) -> [NSTextCheckingResult] {
        matches(in: string, options: options, range: string.range)
    }

    func firstMatch(in string: String, options: NSRegularExpression.MatchingOptions = []) -> NSTextCheckingResult? {
        firstMatch(in: string, options: options, range: string.range)
    }
}
