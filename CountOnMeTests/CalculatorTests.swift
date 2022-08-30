//
//  CalculatorTests.swift
//  CountOnMeTests
//
//  Created by Nhung on 23/08/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

final class CalculatorTests: XCTestCase {

    private var calculator: Calculator!
    private var delegate: MockDelegate!

    override func setUp() {
        super.setUp()
        calculator = Calculator()
        delegate = MockDelegate()
    }

    func testGivenACalculator_WhenAddition_ThenCorrectExpressionIsReturned() {
        // GIVEN
        calculator.delegate = delegate
        
        // WHEN
        calculator.didPress(number: "1")
        calculator.didPress(operator: "+")
        calculator.didPress(number: "1")
        calculator.didPress(operator: "=")

        // THEN
        XCTAssertEqual(delegate.text, "1+1=2")
    }
    
    func testGivenACalculator_WhenDistration_ThenCorrectExpressionIsReturned() {
        // GIVEN
        calculator.delegate = delegate
        
        // WHEN
        calculator.didPress(number: "1")
        calculator.didPress(operator: "-")
        calculator.didPress(number: "1")
        calculator.didPress(operator: "=")

        // THEN
        XCTAssertEqual(delegate.text, "1-1=0")
    }
    
    func testGivenACalculator_WhenMultition_ThenCorrectExpressionIsReturned() {
        // GIVEN
        calculator.delegate = delegate
        
        // WHEN
        calculator.didPress(number: "2")
        calculator.didPress(operator: "*")
        calculator.didPress(number: "2")
        calculator.didPress(operator: "=")

        // THEN
        XCTAssertEqual(delegate.text, "2+2=4")
    }
    
    func testGivenACalculator_WhenDivision_ThenCorrectExpressionIsReturned() {
        // GIVEN
        calculator.delegate = delegate
        
        // WHEN
        calculator.didPress(number: "4")
        calculator.didPress(operator: "/")
        calculator.didPress(number: "2")
        calculator.didPress(operator: "=")

        // THEN
        XCTAssertEqual(delegate.text, "4/2=2")
    }
    
}

private final class MockDelegate: CalculatorDelegate {

    var text = ""

    func didUpdate(text: String) {
        self.text = text
    }
}
