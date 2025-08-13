//
//  ProfileVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 06/07/2025.
//

import UIKit

class ProfileVC: UIViewController, UIGestureRecognizerDelegate {

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
        
        let leftButton = UIBarButtonItem(image: UIImage(named: "Left"), style: .plain, target: self, action: #selector(backtoSetting))
        leftButton.tintColor = UIColor(named: "neutral2")
        navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editProfile))
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 17),
            .foregroundColor: UIColor(named: "primary")!
        ]
        rightButton.setTitleTextAttributes(attributes, for: .normal)
        rightButton.setTitleTextAttributes(attributes, for: .highlighted)

        navigationItem.rightBarButtonItem = rightButton

        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        bmiView.layer.cornerRadius = 16
        
        self.navigationController?.isNavigationBarHidden = false

        loadProfile()
    }
    
    func loadProfile() {
        let realmProfiles = ProfileRealmManager.shared.getAll(Profile.self)
//        profile = Profile(value: realmProfiles)
        if let firstProfile = realmProfiles.first {
            profile = firstProfile
            fullNameLabel.text = firstProfile.fullName
            bmiLabel.text = firstProfile.bmi
            weightLabel.text = "\(firstProfile.weight) kg"
            heightLabel.text = "\(firstProfile.height) cm"
            genderLabel.text = firstProfile.gender
        }
    }
    @objc func backtoSetting() {
        navigationController?.popToRootViewController(animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func editProfile() {
        let infoProfileVC = InfoProfileVC()
        
//        infoProfileVC.onChangeResult = { [weak self] updatedProfile in

//            self?.fullNameLabel.text = newProfile.fullName
//            self?.bmiLabel.text = newProfile.bmi
//            self?.heightLabel.text = "\(newProfile.height) cm"
//            self?.weightLabel.text = "\(newProfile.weight) kg"
//            self?.genderLabel.text = newProfile.gender
        
        navigationController?.pushViewController(infoProfileVC, animated: true)

    }

}
