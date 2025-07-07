//
//  LogCell.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 05/07/2025.
//

import UIKit

class LogCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var bpmPulseLabel: UILabel!
    @IBOutlet weak var pulseLogLabel: UILabel!
    
    @IBOutlet weak var bpmHrvLabel: UILabel!
    @IBOutlet weak var hrvLogLabel: UILabel!
    
    @IBOutlet weak var statusLogLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        cellView.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(pulse: String, hrv: String) {
        pulseLogLabel.text = pulse
        hrvLogLabel.text = hrv
        
        switch Int(pulse) ?? 0 {
        case ..<60:
            pulseLogLabel.textColor = UIColor(named: "low")
            bpmPulseLabel.textColor = UIColor(named: "low")
            hrvLogLabel.textColor = UIColor(named: "low")
            bpmHrvLabel.textColor = UIColor(named: "low")
            statusLogLabel.text = "Low"
            statusLogLabel.textColor = UIColor(named: "low")
        case 60...100:
            pulseLogLabel.textColor = UIColor(named: "good")
            bpmPulseLabel.textColor = UIColor(named: "good")
            hrvLogLabel.textColor = UIColor(named: "good")
            bpmHrvLabel.textColor = UIColor(named: "good")
            statusLogLabel.text = "Good"
            statusLogLabel.textColor = UIColor(named: "good")
        default:
            pulseLogLabel.textColor = UIColor(named: "warning")
            bpmPulseLabel.textColor = UIColor(named: "warning")
            hrvLogLabel.textColor = UIColor(named: "warning")
            bpmHrvLabel.textColor = UIColor(named: "warning")
            statusLogLabel.text = "Warning"
            statusLogLabel.textColor = UIColor(named: "warning")
        }
    }
    
}
