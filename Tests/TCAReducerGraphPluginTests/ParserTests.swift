//
//  ParserTests.swift
//  
//
//  Created by Mathew Gacy on 7/24/22.
//

@testable import TCAReducerGraphPlugin
import XCTest

final class ParserTests: XCTestCase {
    let sut = Parser(patterns: .mobelux)

    func testDomainName() throws {
        let filename = "FooDomain.swift"
        let domainName = try sut.domainName(filename)

        XCTAssertEqual(domainName, "Foo")
    }

    func testChildReducers() throws {
        let childReducers = try sut.childDomains(Mock.combined)
        XCTAssertEqual(childReducers, ["Foo"])
    }
}
