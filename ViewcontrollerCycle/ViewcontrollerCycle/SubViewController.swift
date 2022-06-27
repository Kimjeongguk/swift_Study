//
//  SubViewController.swift
//  ViewcontrollerCycle
//
//  Created by Jeongguk Kim on 2022/03/09.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class SubViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    var titleText:String?
    var data:String?
    weak var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
        dataLabel.text = data
        titleLabel.sizeToFit()
        dataLabel.sizeToFit()
        
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.delegate?.sendData(name: "가져가~~")
        if let pusu = self.navigationController?.popViewController(animated: true) {
            
        }
        
        if let modal = self.presentingViewController?.dismiss(animated: true, completion: nil){
            
        }
//        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
