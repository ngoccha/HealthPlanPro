//
//  InfoProfileVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 06/07/2025.
//

import UIKit
import RealmSwift

class InfoProfileVC: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var firstNameCustomView: CustomTextFieldView!
    @IBOutlet weak var lastNameCustomView: CustomTextFieldView!
    @IBOutlet weak var weightCustomView: CustomTextFieldView!
    @IBOutlet weak var heightCustomView: CustomTextFieldView!
    
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    var profile: Profile?
    let realmProfile = ProfileRealmManager.shared.getAll(Profile.self)
    var firstNameResult: String = ""
    var lastNameResult: String = ""
    var bmiResult: String = ""
    var weightResult: Int = 0
    var heightResult: Int = 0
    var genderResult: String = ""
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let heightCmtoM = Double(heightCustomView.getText()) ?? 0.0 / 100
        let BMIValue = Double(weightCustomView.getText()) ?? 0.0 / pow(heightCmtoM, 2)
        
        firstNameResult = firstNameCustomView.getText()
        lastNameResult = lastNameCustomView.getText()
        
        var bmiResult: String {
            if BMIValue == 0 {
                return "0.00" }
            else {
                return String(format: "%.2f", BMIValue)
            }
        }
        
        weightResult = Int(weightCustomView.getText()) ?? 0
        heightResult = Int(heightCustomView.getText()) ?? 0
        genderResult = genderSegment.titleForSegment(at: genderSegment.selectedSegmentIndex)!
        
        let updatedProfile = Profile()
        updatedProfile.firstName = firstNameResult
        updatedProfile.lastName = lastNameResult
        updatedProfile.bmi = bmiResult
        updatedProfile.weight = weightResult
        updatedProfile.height = heightResult
        updatedProfile.gender = genderResult
        
        if realmProfile.first != nil {
            ProfileRealmManager.shared.update(updatedProfile)
        } else {
            ProfileRealmManager.shared.add(updatedProfile)
        }
        goToProfile()
    }
    
    
    //    var onChangeResult: ((Profile) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let existingProfile = realmProfile.first {
            profile = existingProfile
        } else {
            profile = Profile()
        }
        loadCurrentProfile()
        
        title = "Information"
        
        firstNameCustomView.configure(label: "First Name", placeholder: "Enter first name...")
        lastNameCustomView.configure(label: "Last Name", placeholder: "Enter last name...")
        weightCustomView.configure(label: "Weight", placeholder: "Enter weight...")
        heightCustomView.configure(label: "Height", placeholder: "Enter height...")
        
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
        
        firstNameCustomView.customTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        lastNameCustomView.customTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        weightCustomView.customTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        heightCustomView.customTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func loadCurrentProfile() {
        if let currentProfile = profile {
            firstNameCustomView.setText(currentProfile.firstName)
            lastNameCustomView.setText(currentProfile.lastName)
            weightCustomView.setText(String(currentProfile.weight))
            heightCustomView.setText(String(currentProfile.height))
            
            let gender = currentProfile.gender.lowercased()
            if gender == "male" {
                genderSegment.selectedSegmentIndex = 0
            } else if gender == "female" {
                genderSegment.selectedSegmentIndex = 1
            }
            textFieldDidChange()
        }
    }
    
    func goToProfile() {
        let profileVC = ProfileVC()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textFieldDidChange() {
        let firstNameEmpty = firstNameCustomView.getText().isEmpty
        let lastNameEmpty = lastNameCustomView.getText().isEmpty
        let weightNameEmpty = weightCustomView.getText().isEmpty
        let heightNameEmpty = heightCustomView.getText().isEmpty
        
        if !firstNameEmpty && !lastNameEmpty && !weightNameEmpty && !heightNameEmpty {
            addButtonOutlet.isEnabled = true
            addButtonOutlet.backgroundColor = UIColor(named: "primary")
        } else {
            addButtonOutlet.isEnabled = false
            addButtonOutlet.backgroundColor = UIColor(named: "neutral3")
            
        }
    }
}
