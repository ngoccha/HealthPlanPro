//
//  CustomTextField.swift
//  HeathPlanPro
//
//  Created by iKame Elite Fresher 2025 on 7/17/25.
//

import UIKit

class CustomTextFieldView: UIView {

    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var customTextField: UITextField!
    @IBOutlet weak var BoundView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    override func layoutSubviews() {
        
    }
    
    private func loadFromNib() {
        let nib = UINib(nibName: "CustomTextFieldView", bundle: nil)
        let nibView = nib.instantiate(withOwner: self).first as! UIView
        
        addSubview(nibView)
        
        nibView.translatesAutoresizingMaskIntoConstraints = false
        nibView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nibView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nibView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nibView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    func configure(label: String, placeholder: String) {
        self.customLabel.text = label
        self.customTextField.placeholder = placeholder
        self.BoundView.layer.cornerRadius = 16
        self.BoundView.layer.borderWidth = 1
        self.BoundView.layer.borderColor = UIColor.neutral4.cgColor
    }
    
    func getText() -> String {
        return self.customTextField.text ?? ""
    }
    
    func setText(_ text: String) {
        self.customTextField.text = text
    }
}
