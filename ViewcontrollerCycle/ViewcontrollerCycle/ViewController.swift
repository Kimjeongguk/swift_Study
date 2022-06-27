//
//  ViewController.swift
//  ViewcontrollerCycle
//
//  Created by Jeongguk Kim on 2022/03/09.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate {

    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func pushButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "subViewcontroller") as? SubViewController else {
            
            return
        }
        viewController.titleText = "push"
        viewController.data = "push로 클릭"
        viewController.delegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func presentButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "subViewcontroller") as? SubViewController else {
            return
        }
        vc.titleText = "present"
        vc.data = "present로 클릭"
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SubViewController {
            vc.titleText = "segue push or modal"
            vc.delegate = self
        }
    }
    
    func sendData(name: String) {
        self.mainLabel.text = name
        self.mainLabel.sizeToFit()
    }
}

