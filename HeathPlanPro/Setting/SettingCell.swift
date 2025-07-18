//
//  SettingCell.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 06/07/2025.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var iconSettingImage: UIImageView!
    @IBOutlet weak var nameSettingLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(icon: UIImage, name: String) {
        iconSettingImage.image = icon
        nameSettingLabel.text = name
    }
}
