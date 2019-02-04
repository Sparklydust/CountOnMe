//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var calculatorLogic = CalculatorLogic()

  // MARK: - Outlets
  @IBOutlet weak var textView: UITextView!
  @IBOutlet var numberButtons: [UIButton]!

  // MARK: - IBAction
  @IBAction func tappedNumberButton(_ sender: UIButton) {
    for (i, numberButton) in numberButtons.enumerated() {
      if sender == numberButton {
        calculatorLogic.addNewNumber(i)
      }
    }
    updateDisplay()
  }

  @IBAction func dotNumber(_ sender: UIButton) {
    if calculatorLogic.canAddDecimal {
      calculatorLogic.addDecimal()
      updateDisplay()
    } else {
      showAlert("They can only be one dot!")
    }
  }

  @IBAction func divided(_ sender: Any) {
    if calculatorLogic.canAddOperator {
      calculatorLogic.operators.append("÷")
      addSpace()
    }
    else {
      showAlert("One operator at a time!")
    }
  }

  @IBAction func multiplied(_ sender: Any) {
    if calculatorLogic.canAddOperator {
      calculatorLogic.operators.append("×")
      addSpace()
    }
    else {
      showAlert("One operator at a time!")
    }
  }

  @IBAction func plus() {
    if calculatorLogic.canAddOperator {
      calculatorLogic.operators.append("+")
      addSpace()
    }
    else {
      showAlert("One operator at a time!")
    }
  }

  @IBAction func minus() {
    if calculatorLogic.canAddOperator {
      calculatorLogic.operators.append("-")
      addSpace()
    }
    else {
      showAlert("One operator at a time!")
    }
  }

  @IBAction func equal() {
    if !calculatorLogic.isExpressionCorrect {
      showAlert("No operation to get a result from!")
    }
    else {
      let total = calculatorLogic.calculateTotal()
      textView.text! = "\(Double(total))"
    }
    calculatorLogic.clear()
  }

  // What happens when AC button is pressed
  @IBAction func resetDisplay(_ sender: Any) {
    if calculatorLogic.stringNumbers.count == 1 {
      backToZero()
    }
    else {
      let alertVC = UIAlertController(title: "🧮", message: "Start a new operation?", preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
      alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action:UIAlertAction!) in
        self.backToZero()
      }))
      self.present(alertVC, animated: true, completion: nil)
    }
  }

  //MARK: - Controller Methods
  private func showAlert(_ message: String) {
    let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    self.present(alertVC, animated: true, completion: nil)
  }

  // Show the button pressed on the user's screen
  private func updateDisplay() {
    var text = ""
    for (i, stringNumber) in calculatorLogic.stringNumbers.enumerated() {
      // Add operator
      if i > 0 {
        text += calculatorLogic.operators[i]
      }
      // Add number
      text += stringNumber
    }
    textView.text = text
  }

  // To have a empty String after an operator is added
  private func addSpace() {
    calculatorLogic.stringNumbers.append("")
    updateDisplay()
  }

  // Reset user's screen
  private func backToZero() {
    textView.text = "0"
    calculatorLogic.clear()
  }
}
