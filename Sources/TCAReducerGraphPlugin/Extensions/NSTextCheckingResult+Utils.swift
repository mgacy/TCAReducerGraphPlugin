//
//  NSTextCheckingResult+Utils.swift
//  
//
//  Created by Mathew Gacy on 7/24/22.
//

import Foundation

public extension NSTextCheckingResult {
    func substring(in string: String, withName name: String) -> Substring? {
        guard let substringRange = Range(range(withName: name), in: string) else {
            return nil
        }
        return string[substringRange]
    }

    func string(in string: String, withName name: String) -> String? {
        substring(in: string, withName: name).map { String($0) }
    }
}
