//
//  Calculator.swift
//  CountOnMe
//
//  Created by Nhung on 23/08/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation

protocol CalculatorDelegate: AnyObject {
    func didUpdate(text: String)
}

final class Calculator {
    private var expression: String = "" {
        didSet {
            delegate?.didUpdate(text: expression)
        }
    }

    weak var delegate: CalculatorDelegate?

    // MARK: - Inputs

    func didPress(number: String) {
        if number == "0", expression.last == Character("/") {
            delegate?.didUpdate(text: "Error, divide by zero forbiden!")
        }
        expression += number
    }

    func didPress(operator: String) {
        expression += `operator`
    }

    func didPressClear() {
        expression = ""
    }
}
