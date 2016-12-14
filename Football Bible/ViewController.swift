//
//  ViewController.swift
//  Football Bible
//
//  Created by Christopher Ras on 07/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var teamTable: UITableView!
    
    var userID: String?
    var footballTeams = [String]()
    var teamDicts = [String: Int]()
    var chosenTeam = [String: Int]()
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chosenTeam = [:]
        ref = FIRDatabase.database().reference(withPath: "users")
        ref.child(userID!).observe(.value, with: { snapshot in
            var newItems: [String: Int] = [:]
            let items = snapshot.value as? [String: AnyObject]
            if items!["Teams"] != nil {
                self.teamDicts = items!["Teams"]! as! [String : Int]
                for team in self.teamDicts.keys {
                    self.footballTeams.append(team)
                    self.teamTable.reloadData()
                }
            }
        })
        self.navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        try! FIRAuth.auth()!.signOut()
        dismiss(animated: true, completion: nil)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.chosenTeam = [:]
        self.chosenTeam[footballTeams[indexPath.row]] = self.teamDicts[footballTeams[indexPath.row]]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "teamInfo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueVC = segue.destination as? AddTeamViewController {
            segueVC.teamDicts = self.teamDicts
            segueVC.userID = self.userID
        }
        
        else if let segueVC = segue.destination as? TeamInfoViewController {
            segueVC.teamDict = self.chosenTeam
            
        }
    }


}

