//
//  ViewController.swift
//  Football Bible
//
//  Created by Christopher Ras on 07/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var teamTable: UITableView!
    
    let footballTeams = ["Ajax Amsterdam", "Man Utd", "Barcelona" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return footballTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamTable.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
            as! teamCell
        
        cell.teamName.text = footballTeams[indexPath.row]
        return cell
        
    }


}

