//
//  DetailInfoTableViewController.swift
//  Exam
//
//  Created by Vitomir on 2/11/17.
//  Copyright © 2017 Vitomir. All rights reserved.
//

import UIKit

class DetailInfoTableViewController: UITableViewController {

    var firstName: String!
    var data: [String: Any?]! = [String: Any?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DBCommunication.instance.getInfoForItem(firstName: firstName) { (receivedData) in
            guard receivedData != nil else {return}
            self.data = receivedData
            self.tableView.reloadData()
        }
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
        return self.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "2ndCellIdentifier", for: indexPath)
        
        if let gender = (self.data[Data.choice.rawValue]!) as? String {
            if gender == "Male"{
                switch indexPath.row{
                case 0:
                    cell.textLabel?.text = Data.firstName.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.firstName.rawValue] as! String)
                case 1:
                    cell.textLabel?.text = Data.lastName.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.lastName.rawValue] as! String)
                case 2:
                    cell.textLabel?.text = Data.choice.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.choice.rawValue] as! String)
                case 3:
                    cell.textLabel?.text = Data.years.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.years.rawValue]! as! String)
                case 4:
                    cell.textLabel?.text = Data.city.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.city.rawValue]! as! String)
                case 5:
                    cell.textLabel?.text = Data.firstAnswer.rawValue
                    cell.detailTextLabel?.text = String(self.data[Data.firstAnswer.rawValue]! as! Double)
                case 6:
                    cell.textLabel?.text = Data.secondAnswer.rawValue
                    cell.detailTextLabel?.text = String(self.data[Data.secondAnswer.rawValue]! as! Bool)
                case 7:
                    cell.textLabel?.text = Data.thirdAnswer.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.thirdAnswer.rawValue]! as! String)
                case 8:
                    cell.textLabel?.text = Data.fourthAnswer.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.fourthAnswer.rawValue]! as! String)
                case 9:
                    cell.textLabel?.text = Data.fifthAnswer.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.fifthAnswer.rawValue]! as! String)
                default:
                    break
                }
            }
            if gender == "Female"{
                switch indexPath.row{
                case 0:
                    cell.textLabel?.text = Data.firstName.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.firstName.rawValue] as! String)
                case 1:
                    cell.textLabel?.text = Data.lastName.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.lastName.rawValue] as! String)
                case 2:
                    cell.textLabel?.text = Data.choice.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.choice.rawValue] as! String)
                case 3:
                    cell.textLabel?.text = Data.years.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.years.rawValue]! as! String)
                case 4:
                    cell.textLabel?.text = Data.city.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.city.rawValue]! as! String)
                case 5:
                    cell.textLabel?.text = Data.firstAnswer.rawValue
                    cell.detailTextLabel?.text = String(self.data[Data.firstAnswer.rawValue]! as! Double)
                case 6:
                    cell.textLabel?.text = Data.secondAnswer.rawValue
                    cell.detailTextLabel?.text = String(self.data[Data.secondAnswer.rawValue]! as! Bool)
                case 7:
                    cell.textLabel?.text = Data.thirdAnswer.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.thirdAnswer.rawValue]! as! String)
                case 8:
                    cell.textLabel?.text = Data.fourthAnswer.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.fourthAnswer.rawValue]! as! String)
                case 9:
                    cell.textLabel?.text = Data.fifthAnswer.rawValue
                    cell.detailTextLabel?.text = (self.data[Data.fifthAnswer.rawValue]! as! String)
                default:
                    break
                }
            }
        }
        return cell
    }

}
