//
//  CustomTextField.swift
//  HeathPlanPro
//
//  Created by iKame Elite Fresher 2025 on 7/17/25.
//

import UIKit

class CustomTextField: UIView {

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
        let nib = UINib(nibName: "CustomTextField", bundle: nil)
        let nibView = nib.instantiate(withOwner: self).first as! UIView
        
        addSubview(nibView)
        
        nibView.translatesAutoresizingMaskIntoConstraints = false
        nibView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nibView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nibView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nibView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

}
