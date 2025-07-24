//
//  IntroChildCell.swift
//  HeathPlanPro
//
//  Created by iKame Elite Fresher 2025 on 7/24/25.
//

import UIKit

class IntroChildCell: UICollectionViewCell {

    @IBOutlet weak var checkBoxImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                checkBoxImageView.image = UIImage(named: "checkboxticked")
                self.layer.borderColor = UIColor.primary.cgColor
                self.layer.borderWidth = 1.5
            } else {
                checkBoxImageView.image =  UIImage(named: "checkbox")
                self.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
    func configure(title: String, image: String) {
        titleLabel.text = title
        mainImageView.image = UIImage(named: image)
    }

}
