//
//  ViewController.swift
//  Calculator
//
//  Created by Jeongguk Kim on 2022/03/20.
//

import UIKit
enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}
class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: Any) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    @IBAction func tapDotButton(_ sender: Any) {
        if self.displayNumber.count < 8, !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDevideButton(_ sender: Any) {
        self.operation(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: Any) {
        self.operation(.Multiply)
    }
    
    @IBAction func tapSubtracButton(_ sender: Any) {
        self.operation(.Subtract)
    }
    
    @IBAction func tapAddButton(_ sender: Any) {
        self.operation(.Add)
    }
    @IBAction func tapEqualButton(_ sender: Any) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation){
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let seocndOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + seocndOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - seocndOperand)"
                case .Divide:
                    self.result = "\(firstOperand / seocndOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * seocndOperand)"
                default :
                    break
                }
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0{
                    self.result = "\(Int(result))"
                }
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            
            self.currentOperation =  operation
        }else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
            
        }
    }
}

