//
//  LogVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 04/07/2025.
//

import UIKit

class LogVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var logs: [Log] = [Log(pulse: "--", hrv: "--")]

    @IBAction func logHeartButton(_ sender: UIButton) {
        let infoHeartVC = InfoHeartVC()
        
        infoHeartVC.updateLog = { [weak self] newLog in
            guard let self = self else { return }
            if self.logs.count == 1 && self.logs.first?.pulse == "--" && self.logs.first?.hrv == "--" {
                self.logs.removeAll()
            }
            self.logs.append(newLog)
            self.logTableView.reloadData()
            self.hiddenTrackDailyView()
        }
        
        navigationController?.pushViewController(infoHeartVC, animated: true)
    }
    
    @IBOutlet weak var logTableView: UITableView!
    
    @IBOutlet weak var trackDailyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trackDailyView.layer.cornerRadius = 16
        
        logTableView.register(UINib(nibName: "LogCell", bundle: nil), forCellReuseIdentifier: "LogCell")

        logTableView.delegate = self
        logTableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = logTableView.dequeueReusableCell(withIdentifier: "LogCell", for: indexPath) as! LogCell
        
        let item = logs[indexPath.row]
        cell.configure(pulse: item.pulse, hrv: item.hrv)

        return cell
    }

    func hiddenTrackDailyView() {
        trackDailyView.isHidden = !logs.isEmpty
    }

}
