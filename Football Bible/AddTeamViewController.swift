//
//  AddTeamViewController.swift
//  Football Bible
//
//  Created by Christopher Ras on 09/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit

class AddTeamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var leagueTableView: UITableView!
    
    let leagues = ["Serie-A", "Eredivisie"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leagueTableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath)
            as! leagueNameCell
        
        cell.leagueName.text = leagues[indexPath.row]
        return cell
    }

    
}
