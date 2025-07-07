//
//  ProfileVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 06/07/2025.
//

import UIKit

class ProfileVC: UIViewController {

    var profile: Profile?
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var bmiView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(backtoSetting))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editProfile))
        
        bmiView.layer.cornerRadius = 16
        
        loadProfile()
    }
    
    func loadProfile() {
        if let loadedProfile = ProfileManager.shared.loadProfile() {
                    profile = loadedProfile
                    fullNameLabel.text = loadedProfile.fullName
                    bmiLabel.text = loadedProfile.bmi
                    weightLabel.text = "\(loadedProfile.weight) kg"
                    heightLabel.text = "\(loadedProfile.height) cm"
                    genderLabel.text = loadedProfile.gender
        }
    }
    @objc func backtoSetting() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func editProfile() {
        let infoProfileVC = InfoProfileVC()
        
//        infoProfileVC.onChangeResult = { [weak self] updatedProfile in
//                    self?.profile = updatedProfile
//                    ProfileManager.shared.saveProfile(updatedProfile)
//                    self?.updateUI()
//                    self?.navigationController?.popViewController(animated: true)

//            self?.fullNameLabel.text = newProfile.fullName
//            self?.bmiLabel.text = newProfile.bmi
//            self?.heightLabel.text = "\(newProfile.height) cm"
//            self?.weightLabel.text = "\(newProfile.weight) kg"
//            self?.genderLabel.text = newProfile.gender
        
        navigationController?.pushViewController(infoProfileVC, animated: true)
    }

}
