//
//  GoalOptionCell.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 04/07/2025.
//

import UIKit

class GoalOptionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var goalImage: UIImageView!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
    }

}
