//
//  CovidDetailTableViewController.swift
//  COVID19
//
//  Created by Jeongguk Kim on 2022/06/30.
//

import UIKit

class CovidDetailTableViewController: UITableViewController {
    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasInfolwCell: UITableViewCell!
    @IBOutlet weak var reagionalOutbreakCell: UITableViewCell!
    
    var covidOverview: CovidOverview?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    func configureView() {
        guard let covidOverview = covidOverview else { return }
        self.title = covidOverview.countryName
        self.newCaseCell.detailTextLabel?.text = "\(covidOverview.newCase)명"
        self.totalCaseCell.detailTextLabel?.text = "\(covidOverview.totalCase)명"
        self.recoveredCell.detailTextLabel?.text = "\(covidOverview.recovered)명"
        self.deathCell.detailTextLabel?.text = "\(covidOverview.death)명"
        self.percentageCell.detailTextLabel?.text = "\(covidOverview.percentage)명"
        self.overseasInfolwCell.detailTextLabel?.text = "\(covidOverview.newFcase)명"
        self.reagionalOutbreakCell.detailTextLabel?.text = "\(covidOverview.newCcase)명"

    }
}
