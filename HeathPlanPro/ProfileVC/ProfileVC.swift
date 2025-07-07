//
//  ProfileVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 06/07/2025.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var bmiView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        
        bmiView.layer.cornerRadius = 16
    }

}
