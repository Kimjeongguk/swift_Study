//
//  AlertListViewController.swift
//  Drink
//
//  Created by Jeongguk Kim on 2022/07/14.
//

import UIKit
import UserNotifications


class AlertListViewController: UITableViewController{
    var alertList: [Alert] = []
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "AlertListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "AlertListCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        alertList = getAlertList()
    }
    
    @IBAction func addAlertButtonAction(_ sender: UIBarButtonItem) {
        guard let addAlertVC = storyboard?.instantiateViewController(withIdentifier: "AddAlertViewController") as? AddAlertViewController else { return }
        
        addAlertVC.pickedDate = { [weak self] date in
            guard let self = self else { return }
            
            var alertList = self.getAlertList()
            let newAlert = Alert(date: date, isOn: true)
            
            alertList.append(newAlert)
            alertList.sort { $0.date < $1.date }
            
            self.alertList = alertList
            
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alertList), forKey: "alertList")
            self.userNotificationCenter.addNotificationRequest(by: newAlert)
            
            self.tableView.reloadData()
        }
        
        self.present(addAlertVC, animated: true, completion: nil)
    }
    
    func getAlertList() -> [Alert] {
        guard let data = UserDefaults.standard.value(forKey: "alertList") as? Data,
              let alertList = try? PropertyListDecoder().decode([Alert].self, from: data) else { return []}
        
        return alertList
    }
}

extension AlertListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "물마실 시간"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as? AlertListCell else { return UITableViewCell() }
        
        cell.alertSwitch.isOn = alertList[indexPath.row].isOn
        cell.timeLabel.text = alertList[indexPath.row].time
        cell.meridiemLabel.text = alertList[indexPath.row].meridiem
        
        cell.alertSwitch.tag = indexPath.row
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            
            userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alertList[indexPath.row].id])
            self.alertList.remove(at: indexPath.row)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alertList), forKey: "alertList")
            
            self.tableView.reloadData()
            return
        default:
            break
            
        }
    }
}
