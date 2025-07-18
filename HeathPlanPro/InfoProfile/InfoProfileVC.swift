//
//  InfoProfileVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 06/07/2025.
//

import UIKit

class InfoProfileVC: UIViewController, UIGestureRecognizerDelegate {
    
    
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
    
    var newProfile: Profile?
    var firstNameResult: String = ""
    var lastNameResult: String = ""
    var bmiResult: String = ""
    var weightResult: Int = 0
    var heightResult: Int = 0
    var genderResult: String = ""
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let heightCmtoM = Double(heightTextField.text!) ?? 0.0 / 100
        let BMIValue = Double(weightTextField.text!) ?? 0.0 / pow(heightCmtoM, 2)
        
        firstNameResult = firstNameTextField.text ?? ""
        lastNameResult = lastNameTextField.text ?? ""
        
        var bmiResult: String {
            if BMIValue == 0 {
                return "0.00" }
            else {
                return String(format: "%.2f", BMIValue)
            }
        }
        
        weightResult = Int(weightTextField.text ?? "") ?? 0
        heightResult = Int(heightTextField.text ?? "") ?? 0
        genderResult = genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex)!
        
        newProfile = Profile(firstName: firstNameResult, lastName: lastNameResult, bmi: bmiResult, weight: weightResult, height: heightResult, gender: genderResult)
        
        ProfileManager.shared.saveProfile(newProfile!)

        cancel()
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
        
        let disabledTitle = NSAttributedString(string: "Update", attributes: [
                .foregroundColor: UIColor.white
            ])
        addButtonOutlet.setAttributedTitle(disabledTitle, for: .disabled)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Left"), style: .plain, target: self, action: #selector(cancel))
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.navigationBar.tintColor = UIColor(named: "neutral2")
        
        self.navigationController?.isNavigationBarHidden = false

        firstNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        weightTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        heightTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

   func loadCurrentProfile() {
            if let currentProfile = ProfileManager.shared.loadProfile() {
                firstNameTextField.text = currentProfile.firstName
                lastNameTextField.text = currentProfile.lastName
                weightTextField.text = String(currentProfile.weight)
                heightTextField.text = String(currentProfile.height)
    
                let gender = currentProfile.gender.lowercased()
                if gender == "male" {
                    genderSegment.selectedSegmentIndex = 0
                } else if gender == "female" {
                    genderSegment.selectedSegmentIndex = 1
                }
                textFieldDidChange()
            }
        }
    
    @objc func cancel() {
        let profileVC = ProfileVC()

        navigationController?.pushViewController(profileVC, animated: true)
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
