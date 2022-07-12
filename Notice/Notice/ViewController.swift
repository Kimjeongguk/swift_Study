//
//  ViewController.swift
//  Notice
//
//  Created by Jeongguk Kim on 2022/07/12.
//

import UIKit
import FirebaseRemoteConfig
import FirebaseAnalytics

class ViewController: UIViewController {

    var remoteConfig: RemoteConfig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remoteConfig = RemoteConfig.remoteConfig()
        
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        
        remoteConfig?.configSettings = setting
        remoteConfig?.setDefaults(fromPlist: "RemoteConfigDefaults")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getNotice()
    }
}

//RemoteConfig
extension ViewController {
    func getNotice() {
        guard let remoteConnfig = remoteConfig else { return }
        
        self.remoteConfig?.fetch { [weak self] status, _ in
            if status == .success {
                remoteConnfig.activate(completion: nil)
            }else {
                print("ERROR: config not fetched")
            }
            guard let self = self else { return }
            
            if self.isNoticeHidden(remoteConnfig){
                let noticeVC = NoticeViewController(nibName: "NoticeViewController", bundle: nil)
                
                noticeVC.modalPresentationStyle = .custom
                noticeVC.modalTransitionStyle = .crossDissolve
                
                let title = (remoteConnfig["title"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                let detail = (remoteConnfig["detail"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                let date = (remoteConnfig["date"].stringValue ?? "").replacingOccurrences(of: "\\n", with: "\n")
                
                noticeVC.noticeContents = (title: title, detail: detail, date: date)
                self.present(noticeVC, animated: true, completion: nil)
            }else {
                self.showEventAlert()
            }
        }
    }
    
    func isNoticeHidden(_ remoteConfig: RemoteConfig) -> Bool {
        print(remoteConfig["isHidden"].boolValue)
        return !remoteConfig["isHidden"].boolValue
    }
}

//A/B Test
extension ViewController {
    func showEventAlert() {
        guard let remoteConfig = remoteConfig else { return }
        
        remoteConfig.fetch { [weak self] status, _ in
            if status == .success {
                remoteConfig.activate(completion: nil)
            } else {
                print("ERROR: not fetched")
            }
            let message = remoteConfig["message"].stringValue ?? ""
            let confirmAction = UIAlertAction(title: "확인하기", style: .default) {_ in
                Analytics.logEvent("promotion_alert", parameters: nil)
            }
            let cancleAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            let alertContrller = UIAlertController(title: "???", message: message, preferredStyle: .alert)
            
            alertContrller.addAction(confirmAction)
            alertContrller.addAction(cancleAction)
            
            self?.present(alertContrller, animated: true, completion: nil)
        }

    }
}

