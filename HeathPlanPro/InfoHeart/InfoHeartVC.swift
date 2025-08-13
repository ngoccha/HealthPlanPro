//
//  InfoHeartVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 05/07/2025.
//

import UIKit
import RealmSwift

class InfoHeartVC: UIViewController {
    
    var isEnabled: Bool {
        !(pulseCustomView.getText() == "" || hrvCustomView.getText() == "") && !(Double(pulseCustomView.getText()) == nil || Double(hrvCustomView.getText()) == nil)
    }
    
    @IBOutlet weak var pulseCustomView: CustomTextFieldView!
    @IBOutlet weak var hrvCustomView: CustomTextFieldView!
    
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBAction func addButton() {
        let newLog = Log()
        newLog.pulse = pulseCustomView.getText()
        newLog.hrv = hrvCustomView.getText()
        LogRealmManager.shared.add(newLog)

//        updateLog?(newLog)
        dismissToLog()
    }
    
//    var updateLog: ((Log) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Information"
        
        pulseCustomView.configure(label: "Pulse", placeholder: "")
        hrvCustomView.configure(label: "HRV", placeholder: "")
        
        addButtonOutlet.layer.cornerRadius = 16
        addButtonOutlet.backgroundColor = UIColor(named: "neutral3")
        
        let disabledTitle = NSAttributedString(string: "Add", attributes: [
                .foregroundColor: UIColor.white
            ])
        addButtonOutlet.setAttributedTitle(disabledTitle, for: .disabled)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(dismissToLog))
        self.navigationController?.navigationBar.tintColor = UIColor(named: "neutral2")

        pulseCustomView.customTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        hrvCustomView.customTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func dismissToLog() {
        dismiss(animated: true)
    }
    
    @objc func textFieldDidChange() {
        addButtonOutlet.isEnabled = isEnabled
        
        if isEnabled {
            addButtonOutlet.backgroundColor = UIColor(named: "primary")
        } else {
            addButtonOutlet.backgroundColor = UIColor(named: "neutral3")
            addButtonOutlet.tintColor = .white
        }
    }
}

