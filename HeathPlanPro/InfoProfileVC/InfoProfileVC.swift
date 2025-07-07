//
//  InfoProfileVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 06/07/2025.
//

import UIKit

class InfoProfileVC: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var firstNameTextFieldView: UIView!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextFieldView: UIView!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var weightTextFieldView: UIView!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var heightTextFieldView: UIView!
    
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    @IBAction func addButton(_ sender: UIButton) {
        let profileVC = ProfileVC()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Information"
        
        firstNameTextFieldView.layer.cornerRadius = 16
        firstNameTextFieldView.layer.borderWidth = 0.5
        firstNameTextFieldView.layer.borderColor = UIColor(named: "neutral4")?.cgColor
        
        lastNameTextFieldView.layer.cornerRadius = 16
        lastNameTextFieldView.layer.borderWidth = 0.5
        lastNameTextFieldView.layer.borderColor = UIColor(named: "neutral4")?.cgColor
        
        weightTextFieldView.layer.cornerRadius = 16
        weightTextFieldView.layer.borderWidth = 0.5
        weightTextFieldView.layer.borderColor = UIColor(named: "neutral4")?.cgColor
        
        heightTextFieldView.layer.cornerRadius = 16
        heightTextFieldView.layer.borderWidth = 0.5
        heightTextFieldView.layer.borderColor = UIColor(named: "neutral4")?.cgColor
        
        addButtonOutlet.layer.cornerRadius = 16
        addButtonOutlet.backgroundColor = UIColor(named: "neutral3")
        
        firstNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        weightTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        heightTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc func textFieldDidChange() {
        let firstNameEmpty = firstNameTextField.text?.isEmpty ?? true
        let lastNameEmpty = lastNameTextField.text?.isEmpty ?? true
        let weightNameEmpty = weightTextField.text?.isEmpty ?? true
        let heightNameEmpty = heightTextField.text?.isEmpty ?? true
        
        if !firstNameEmpty && !lastNameEmpty && !weightNameEmpty && !heightNameEmpty {
            addButtonOutlet.isEnabled = true
            addButtonOutlet.backgroundColor = UIColor(named: "primary")
        } else {
            addButtonOutlet.isEnabled = false
            addButtonOutlet.backgroundColor = UIColor(named: "neutral3")

        }
    }
}
