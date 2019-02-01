//
//  CalculatorLogic.swift
//  CountOnMe
//
//  Created by Roland Lariotte on 23/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

struct CalculatorLogic {

  // MARK: - Properties
  var stringNumbers = [String()]
  var operators = ["+"]
  var index = 0

  // Check for no calculation error. Used when asking for the result
  var isExpressionCorrect: Bool {
    if let stringNumber = stringNumbers.last {
      if stringNumber.isEmpty {
        if stringNumbers.count == 1 {
          return false
        }
        return false
      }
    }
    return true
  }

  // Check if there is not already an operator
  var canAddOperator: Bool {
    if let stringNumber = stringNumbers.last {
      if stringNumber.isEmpty {
        return false
      }
    }
    return true
  }

  // Check if there is not already a dot
  var canAddDecimal: Bool {
    if let strings = stringNumbers.last {
      if strings.contains(".") || strings.isEmpty {
        return false
      }
    }
    return true
  }

  //MARK: - CalculatorLogic Methods
  mutating func addDecimal(){
    if let stringNumber = stringNumbers.last {
      var stringDecimal = stringNumber
      stringDecimal += "."
      stringNumbers[stringNumbers.count - 1] = stringDecimal
    }
  }

  mutating func addNewNumber(_ newNumber: Int) {
    if let stringNumber = stringNumbers.last {
      var stringNumberMutable = stringNumber
      stringNumberMutable += "\(newNumber)"
      stringNumbers[stringNumbers.count - 1] = stringNumberMutable
    }
  }

  // Algorithmic Method for Mathematical Model
  func calculateTotal() -> Double {
    var total: Double = 0
    var pendingOperand = 0.0
    var pendingOperation = ""

    func performPendingOperation(operand: Double, operation: String, total: Double) -> Double {
      switch operation {
      case "+":
        return operand + total
      case "-":
        return operand - total
      default:
        return total
      }
    }
    for (i, stringNumber) in stringNumbers.enumerated() {
      if let number = Double(stringNumber) {
        switch operators[i] {
        case "+":
          total = performPendingOperation(operand: pendingOperand, operation: pendingOperation, total: total)
          pendingOperand = total
          pendingOperation = "+"
          total = number
        case "-":
          total = performPendingOperation(operand: pendingOperand, operation: pendingOperation, total: total)
          pendingOperand = total
          pendingOperation = "-"
          total = number
        case "÷":
          total /= number
        case "×":
          total *= number
        default:
          break
        }
      }
    }
    // Perform final pending operation if needed
    total = performPendingOperation(operand: pendingOperand, operation: pendingOperation, total: total)
    return total
  }

  // Clear up calculation in memory
  mutating func clear() {
    stringNumbers = [String()]
    operators = ["+"]
    index = 0
  }
}
