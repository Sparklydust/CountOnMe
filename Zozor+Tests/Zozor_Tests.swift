//
//  Zozor_Tests.swift
//  CountOnMeTests
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class Zozor_Tests: XCTestCase {

  var calculatorLogic: CalculatorLogic!

  // Reset CalculatorLogic after each test
  override func setUp() {
    super.setUp()
    calculatorLogic = CalculatorLogic()
  }

  //MARK: Test computed properties
  // Expression is correct when having a number in stringNumber
  func testIfExpressionIsCorrect() {
    calculatorLogic.addNewNumber(2)
    XCTAssertTrue(calculatorLogic.isExpressionCorrect)
  }

  // Expression is note correct if stringNumbers is empty
  func testIfExpressionIsNotCorrect01() {
    calculatorLogic.stringNumbers[0] = ""
    XCTAssertFalse(calculatorLogic.isExpressionCorrect)
  }

  // Can add operator if stringNumbers has a number in
  func testIfCanAddOperator() {
    calculatorLogic.stringNumbers[0] = "3"
    XCTAssertTrue(calculatorLogic.canAddOperator)
  }

  // Can not add operator if stringNumber is empty
  func testIfCanNotAddOperator() {
    calculatorLogic.stringNumbers[0] = ""
    XCTAssertFalse(calculatorLogic.canAddOperator)
  }

  // Can add a dot if stringNumber has a number in
  func testIfCanAddDecimal() {
    calculatorLogic.stringNumbers[0] = "3"
    XCTAssertTrue(calculatorLogic.canAddDecimal)
  }

  // Can not have a dot if one is already added
  func testIfCanNotAddDecimal() {
    calculatorLogic.stringNumbers[0] = "3."
    XCTAssertFalse(calculatorLogic.canAddDecimal)
  }

  //MARK: - Test Adding Numbers
  // Add one number
  func testGivenEmptyStringNumber_WhenAdd1_Then1IsAddedToStringNumbers() {
    calculatorLogic.addNewNumber(1)
    XCTAssert(calculatorLogic.stringNumbers[0] == "1")
  }

  // Add multiple number
  func testGivenEmptyStringNumber_WhenAddMultipleDigits518_ThenStringNumbersIs518() {
    calculatorLogic.addNewNumber(5)
    calculatorLogic.addNewNumber(1)
    calculatorLogic.addNewNumber(8)
    XCTAssert(calculatorLogic.stringNumbers[0] == "518")
  }

  // Add decimal number
  func testGiven6ToStringNumber_WhenAddDecimalAnd5_Then6Point5IsAddedToStringNumber() {
    calculatorLogic.addNewNumber(6)
    calculatorLogic.addDecimal()
    calculatorLogic.addNewNumber(5)
    XCTAssert(calculatorLogic.stringNumbers[0] == "6.5")
  }

  //MARK: - Test Mathematical Operation
  // Calculate 4 + 4 × 4 - 4 ÷ 4 = 19.0
  func testGiven4ToCalculate_whenTime4Minus4DividedBy4_ThenResultIs19() {
    calculatorLogic.stringNumbers = ["4", "4", "4", "4", "4"]
    calculatorLogic.operators = ["+", "+", "×", "-", "÷"]
    XCTAssertEqual(calculatorLogic.calculateTotal(), 19.00)
  }

  // Test division by zero that should return infinity as a result
  func testGiven5ToCalculate_whenDividedBy0_ThenResultIsInfinity() {
    calculatorLogic.stringNumbers = ["5", "0"]
    calculatorLogic.operators = ["+", "÷"]
    XCTAssertEqual(calculatorLogic.calculateTotal(), .infinity)
  }

  //MARK: - Test clear() method
  func testClearScreenView() {
    calculatorLogic.clear()
    XCTAssert(calculatorLogic.stringNumbers == [""])
    XCTAssert(calculatorLogic.operators == ["+"])
    XCTAssert(calculatorLogic.index == 0)
  }
}
