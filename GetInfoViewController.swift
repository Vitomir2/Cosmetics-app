//
//  GetInfoViewController.swift
//  Exam
//
//  Created by Vitomir on 2/11/17.
//  Copyright © 2017 Vitomir. All rights reserved.
//

import UIKit

class GetInfoViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var choiceSegmentControl: UISegmentedControl!
    @IBOutlet weak var yearsTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    var dataDictionary: [String: Any?] = [String: Any?]()
    var segueForSecondPage = "GetInfoMaleSegue"
    var gender = "Male"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func choiceGender(_ sender: UISegmentedControl) {
        if choiceSegmentControl.selectedSegmentIndex == 0
        {
            segueForSecondPage = "GetInfoMaleSegue"
            gender = "Male"
        }
        if choiceSegmentControl.selectedSegmentIndex == 1
        {
            segueForSecondPage = "GetInfoFemaleSegue"
            gender = "Female"
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: segueForSecondPage, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        dataDictionary[Data.firstName.rawValue] = self.firstNameTextField.text
        dataDictionary[Data.lastName.rawValue] = self.lastNameTextField.text
        
        dataDictionary[Data.choice.rawValue] = gender
        if segue.identifier == "GetInfoMaleSegue" {
            (segue.destination as! MaleInfoViewController).dataDictionary = self.dataDictionary
        }
        if segue.identifier == "GetInfoFemaleSegue" {
            (segue.destination as! FemaleInfoViewController).dataDictionary = self.dataDictionary
        }
        
        dataDictionary[Data.years.rawValue] = self.yearsTextField.text
        dataDictionary[Data.city.rawValue] = self.cityTextField.text
        
    }

}
