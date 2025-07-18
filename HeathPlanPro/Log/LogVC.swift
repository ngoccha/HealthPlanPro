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
            
            if (Int(newLog.hrv) == nil || Int(newLog.pulse) == nil) {
                return
            } else {
                self.logs.append(newLog)
            }
            self.logTableView.reloadData()
            self.hiddenTrackDailyView()
        }
        
        let navVC = UINavigationController(rootViewController: infoHeartVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
    
    
    @IBOutlet weak var logTableView: UITableView!
    
    @IBOutlet weak var trackDailyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trackDailyView.layer.cornerRadius = 16
        
        self.navigationController?.isNavigationBarHidden = true
        
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
        if (Int(item.pulse) == nil || Int(item.hrv) == nil) {
            cell.configure(pulse: "--", hrv: "--")
        } else {
            cell.configure(pulse: item.pulse, hrv: item.hrv)
        }
        
        return cell
    }
    
    func hiddenTrackDailyView() {
        if self.logs.count == 1 && self.logs.first?.pulse == "--" && self.logs.first?.hrv == "--" {
            self.logs.removeAll()
            trackDailyView.isHidden = false
        }
        
    }
}
