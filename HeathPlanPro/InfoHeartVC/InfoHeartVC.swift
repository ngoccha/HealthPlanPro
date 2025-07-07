//
//  InfoHeartVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 05/07/2025.
//

import UIKit

class InfoHeartVC: UIViewController {
    
    
    @IBOutlet weak var pulseTextFieldView: UIView!
    @IBOutlet weak var hrvTextFieldView: UIView!
    @IBOutlet weak var pulseTextField: UITextField!
    @IBOutlet weak var hrvTextField: UITextField!
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBAction func addButton() {
        let newLog = Log(pulse: pulseTextField.text!, hrv: hrvTextField.text!)
        
        updateLog?(newLog)
        navigationController?.popViewController(animated: true)
    }
    
    var updateLog: ((Log) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Information"
        
        pulseTextFieldView.layer.cornerRadius = 16
        pulseTextField.layer.cornerRadius = 16
        pulseTextFieldView.layer.borderWidth = 0.5
        pulseTextFieldView.layer.borderColor = UIColor(named: "neutral4")?.cgColor
        
        hrvTextFieldView.layer.cornerRadius = 16
        hrvTextField.layer.cornerRadius = 16
        hrvTextFieldView.layer.borderWidth = 0.5
        hrvTextFieldView.layer.borderColor = UIColor(named: "neutral4")?.cgColor
        
        addButtonOutlet.layer.cornerRadius = 16
        addButtonOutlet.backgroundColor = UIColor(named: "neutral3")
        addButtonOutlet.tintColor = .white

        pulseTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        hrvTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

    }
    
    @objc func textFieldDidChange() {
        let pulseEmpty = pulseTextField.text?.isEmpty ?? true
        let hrvEmpty = hrvTextField.text?.isEmpty ?? true
        
        if !pulseEmpty && !hrvEmpty {
            addButtonOutlet.isEnabled = true
            addButtonOutlet.backgroundColor = UIColor(named: "primary")
        } else {
            addButtonOutlet.isEnabled = false
            addButtonOutlet.backgroundColor = UIColor(named: "neutral3")
            addButtonOutlet.tintColor = .white

        }
    }
}

