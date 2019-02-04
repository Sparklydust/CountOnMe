//
//  Zozor_UITests.swift
//  CountOnMeUITests
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import XCTest

class Zozor_UITests: XCTestCase {
  let app = XCUIApplication()

  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    XCUIApplication().launch()
  }

  // Test all numbers button
  func testNumbersBotton() {
    app.buttons["1"].tap()
    app.buttons["2"].tap()
    app.buttons["3"].tap()
    app.buttons["4"].tap()
    app.buttons["5"].tap()
    app.buttons["6"].tap()
    app.buttons["7"].tap()
    app.buttons["8"].tap()
    app.buttons["9"].tap()
    app.buttons["0"].tap()
  }

  // Test decimal number
  func testDecimalNumber() {
    app.buttons["2"].tap()
    app.buttons["."].tap()
    app.buttons["5"].tap()
  }

  // Test decimal number if !canAddDecimal
  func testTwoDotForAnErrorMessage() {
    app.buttons["2"].tap()
    app.buttons["."].tap()
    app.buttons["."].tap()
    app.alerts["Error"].buttons["OK"].tap()
   }

  // Test divided operation
  func testDivide5by2() {
    app.buttons["5"].tap()
    app.buttons["÷"].tap()
    app.buttons["2"].tap()
  }

  // Test two divide operators -> throw an error
  func testDivide5byTwoOperators() {
    app.buttons["5"].tap()
    app.buttons["÷"].tap()
    app.buttons["÷"].tap()
    app.alerts["Error"].buttons["OK"].tap()
  }

  // Test multiplication operation
  func testMultiply6by3() {
    app.buttons["6"].tap()
    app.buttons["×"].tap()
    app.buttons["3"].tap()
  }

  // Test two multiplication operators -> throw an error
  func testMultiply6byTwoOperators() {
    app.buttons["6"].tap()
    app.buttons["×"].tap()
    app.buttons["×"].tap()
    app.alerts["Error"].buttons["OK"].tap()
  }

  // Test multiplication operation
  func testAdd8Plus4() {
    app.buttons["8"].tap()
    app.buttons["+"].tap()
    app.buttons["4"].tap()
  }

  // Test two plus operators -> throw an error
  func testAdd8WithTwoPlusOperators() {
    app.buttons["8"].tap()
    app.buttons["+"].tap()
    app.buttons["+"].tap()
    app.alerts["Error"].buttons["OK"].tap()
  }

  // Test subtraction operation
  func testAdd4Minus1() {
    app.buttons["4"].tap()
    app.buttons["-"].tap()
    app.buttons["1"].tap()
  }

  // Test two minus operator -> throw an error
  func testAdd4WithTwoMinusOperators() {
    app.buttons["4"].tap()
    app.buttons["-"].tap()
    app.buttons["-"].tap()
    app.alerts["Error"].buttons["OK"].tap()
  }

  // Test AC button to not reset calcul to zero
  func testACButtonWithCancelToEnd() {
    app.buttons["2"].tap()
    app.buttons["+"].tap()
    app.buttons["AC"].tap()
    app.alerts["🧮"].buttons["Cancel"].tap()
  }

  // Test AC button to rest calcul to zero
  func testACButtonWithOKToEnd() {
    app.buttons["2"].tap()
    app.buttons["+"].tap()
    app.buttons["AC"].tap()
    app.alerts["🧮"].buttons["OK"].tap()
  }

  // Test AC after adding one number
  func testACActionAtTheBegining() {
    app.buttons["2"].tap()
    app.buttons["AC"].tap()
  }

  // Test equal button to show the result
  func testEqualSignToShowResult() {
    app.buttons["6"].tap()
    app.buttons["+"].tap()
    app.buttons["4"].tap()
    app.buttons["="].tap()
  }

  // Test equal button to show the result
  func testEqualAfterResultIsShown() {
    app.buttons["6"].tap()
    app.buttons["+"].tap()
    app.buttons["4"].tap()
    app.buttons["="].tap()
    app.buttons["="].tap()
    app.alerts["Error"].buttons["OK"].tap()
  }

  // Test equal sign with no calcul -> throw an error
  func testPressOnEqualSignWithNoCalculOn() {
    app.buttons["="].tap()
    app.alerts["Error"].buttons["OK"].tap()
  }

  // Test Algorithmic Math Model
  func testAlgortihmicMethodToFullfillMathModel() {
    app.buttons["4"].tap()
    app.buttons["+"].tap()
    app.buttons["4"].tap()
    app.buttons["×"].tap()
    app.buttons["4"].tap()
    app.buttons["-"].tap()
    app.buttons["4"].tap()
    app.buttons["÷"].tap()
    app.buttons["4"].tap()
    app.buttons["="].tap()
  }
}
