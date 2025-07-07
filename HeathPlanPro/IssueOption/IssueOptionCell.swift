//
//  IssueOptionCell.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 04/07/2025.
//

import UIKit

class IssueOptionCell: UICollectionViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var issueImage: UIImageView!
    @IBOutlet weak var issueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = 20
    }
}
