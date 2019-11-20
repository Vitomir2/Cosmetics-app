//
//  FemaleInfoViewController.swift
//  Exam
//
//  Created by Vitomir on 2/11/17.
//  Copyright © 2017 Vitomir. All rights reserved.
//

import UIKit

class FemaleInfoViewController: UIViewController {

    @IBOutlet weak var firstAnswer: UISlider!
    @IBOutlet weak var secondAnswer: UITextField!
    @IBOutlet weak var thirdAnswer: UISegmentedControl!
    @IBOutlet weak var fourthAnswer: UITextField!
    @IBOutlet weak var fifthAnswer: UITextField!
    
    
    var dataDictionary: [String: Any?] = [String: Any?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.dataDictionary[Data.firstAnswer.rawValue] = firstAnswer.value
        self.dataDictionary[Data.secondAnswer.rawValue] = self.secondAnswer.text
        self.dataDictionary[Data.thirdAnswer.rawValue] = self.thirdAnswer.selectedSegmentIndex
        self.dataDictionary[Data.fourthAnswer.rawValue] = self.fourthAnswer.text
        self.dataDictionary[Data.fifthAnswer.rawValue] = self.fifthAnswer.text
        
        DBCommunication.instance.sendInfoToDB(info: self.dataDictionary)
        
        _ = self.navigationController?.popToRootViewController(animated: true)
    }

}
