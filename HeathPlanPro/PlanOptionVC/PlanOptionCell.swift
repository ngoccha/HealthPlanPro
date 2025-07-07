//
//  PlanOptionCell.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 04/07/2025.
//

import UIKit

class PlanOptionCell: UICollectionViewCell {

    
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var planImage: UIImageView!
    @IBOutlet weak var planLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
    }

}
