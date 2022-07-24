//
//  Reducer.swift
//  
//
//  Created by Mathew Gacy on 7/24/22.
//

import Foundation

public struct Reducer: Codable, Equatable {
    public var domain: String
    public var children: [Reducer]

    public init(domain: String, children: [Reducer]) {
        self.domain = domain
        self.children = children
    }
}
