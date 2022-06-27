//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by Jeongguk Kim on 2022/03/13.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject{
    func chagedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var textColor: UIColor = .yellow
    var backgreoundColor: UIColor = .black
    var ledText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        
    }
    private func configureView(){
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColorButton(color: self.backgreoundColor)
    }
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == self.yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        }else if sender == self.purpleButton {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        }else if sender == self.greenButton {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColorButton(color: .black)
            self.backgreoundColor = .black
        }else if sender == self.blueButton {
            self.changeBackgroundColorButton(color: .blue)
            self.backgreoundColor = .blue
        }else if sender == self.orangeButton {
            self.changeBackgroundColorButton(color: .orange)
            self.backgreoundColor = .orange
        }
    }
    
    @IBAction func tapSaveButton(_ sender: Any) {
        self.delegate?.chagedSetting(text: self.textField.text, textColor: self.textColor, backgroundColor: self.backgreoundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor){
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
        
    }
    private func changeBackgroundColorButton(color: UIColor){
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
