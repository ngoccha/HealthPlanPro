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

        cellView.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(icon: UIImage, name: String) {
        iconSettingImage.image = icon
        nameSettingLabel.text = name
    }
}
