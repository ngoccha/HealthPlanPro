//
//  InfoProfileVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 06/07/2025.
//

import UIKit

class InfoProfileVC: UIViewController {
    
    var newProfile: Profile?
//    var heightCmtoM: Double = 0.0
//    var BMIValue: Double = 0.0
    var firstNameResult: String = ""
    var lastNameResult: String = ""
    var bmiResult: String = ""
    var weightResult: String = ""
    var heightResult: String = ""
    var genderResult: String = ""
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var firstNameTextFieldView: UIView!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextFieldView: UIView!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var weightTextFieldView: UIView!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var heightTextFieldView: UIView!
    
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let heightCmtoM = Double(heightTextField.text!)! / 100
        let BMIValue = Double(weightTextField.text!)! / pow(heightCmtoM, 2)
        
        firstNameResult = firstNameTextField.text ?? ""
        lastNameResult = lastNameTextField.text ?? ""
        let bmiResult: String = String(format: "%.2f", BMIValue)
        weightResult = weightTextField.text ?? ""
        heightResult = heightTextField.text ?? ""
        genderResult = genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex)!
        
        newProfile = Profile(firstName: firstNameResult, lastName: lastNameResult, bmi: bmiResult, weight: weightResult, height: heightResult, gender: genderResult)
        
        
        ProfileManager.shared.saveProfile(newProfile!)

//        onChangeResult?(newProfile!)
        
        let profileVC = ProfileVC()
//        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    
    var onChangeResult: ((Profile) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCurrentProfile()
        
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

   func loadCurrentProfile() {
            if let currentProfile = ProfileManager.shared.loadProfile() {
                firstNameTextField.text = currentProfile.firstName
                lastNameTextField.text = currentProfile.lastName
                weightTextField.text = currentProfile.weight
                heightTextField.text = currentProfile.height
    
                let gender = currentProfile.gender.lowercased()
                if gender == "male" {
                    genderSegment.selectedSegmentIndex = 0
                } else if gender == "female" {
                    genderSegment.selectedSegmentIndex = 1
                }
                textFieldDidChange() // Kích hoạt kiểm tra enable button
            }
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
