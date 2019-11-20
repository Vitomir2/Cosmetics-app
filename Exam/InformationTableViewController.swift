//
//  InformationTableViewController.swift
//  Exam
//
//  Created by Vitomir on 2/11/17.
//  Copyright © 2017 Vitomir. All rights reserved.
//

import UIKit

class InformationTableViewController: UITableViewController {

    var questions: [String]! = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)

        cell.textLabel?.text = self.questions[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailInfoTableViewController") as! DetailInfoTableViewController
        
        detailViewController.firstName = self.questions[indexPath.row]
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
        //varianta sus segue
        //self.performSegue(withIdentifier: "ToDetailsSegue", sender: self.items[indexPath.row])
    }
    
    private func loadData() {
        self.questions = DBCommunication.instance.allDataItems.sorted()
    }

    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(nil, forKey: UserDefaultKeys.autoLoginEnabled.rawValue)
        
        self.modalTransitionStyle = .crossDissolve
        
        self.present(UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
    }
    
}
