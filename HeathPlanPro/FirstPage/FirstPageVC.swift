//
//  FirstPageVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 03/07/2025.
//

import UIKit

class FirstPageVC: UIViewController {

    @IBOutlet weak var continueButtonOutlet: UIButton!
    
    @IBAction func continueButton() {
        
        let issueOptionVC = IssueOptionVC()
        
        navigationController?.pushViewController(issueOptionVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        continueButtonOutlet.layer.cornerRadius = 16
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
