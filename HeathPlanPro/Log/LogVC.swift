//
//  LogVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 04/07/2025.
//

import UIKit
import RealmSwift

class LogVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var logs: [Log] = []
    var newLog = Log()
    var realmLogs: Results<Log>!
    
    @IBAction func logHeartButton(_ sender: UIButton) {
        let infoHeartVC = InfoHeartVC()
        
        //        let realm = try! Realm()
        //        realmLogs = realm.objects(Log.self)
        
        //        infoHeartVC.updateLog = { [weak self] newLog in
        //            guard let self = self else { return }
        
        //        if self.logs.count == 1 && self.logs.first?.pulse == "--" && self.logs.first?.hrv == "--" {
        //            self.logs.removeAll()
        //        }
        //
        //        if (Int(newLog.hrv) == nil || Int(newLog.pulse) == nil) {
        //            return
        //        }
        //        else {
        //            logs = Array(realmLogs)
        //        }
        //        logs = Array(realmLogs)
        //
        //        self.logTableView.reloadData()
        //
        //        if !logs.isEmpty {
        //            trackDailyView.isHidden = true
        //        }
        //        self.hiddenTrackDailyView()
        //        }
        
        let navVC = UINavigationController(rootViewController: infoHeartVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
    
    
    @IBOutlet weak var logTableView: UITableView!
    
    @IBOutlet weak var trackDailyView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        defaultLog()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trackDailyView.layer.cornerRadius = 16
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        logTableView.register(UINib(nibName: "LogCell", bundle: nil), forCellReuseIdentifier: "LogCell")
        
        logTableView.delegate = self
        logTableView.dataSource = self
        
        //        let realm = try! Realm()
        //        realmLogs = realm.objects(Log.self)
        
        realmLogs = LogRealmManager.shared.getAll(Log.self)
        defaultLog()
        self.logTableView.reloadData()
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
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
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Create the delete action
        if !(self.logs.first?.pulse == "--") {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completionHandler in
                //            let item = self?.logs[indexPath.row]
                let deletedItem = self?.logs.remove(at: indexPath.row)
                LogRealmManager.shared.delete(deletedItem!)
                if ((self?.logs.isEmpty) != nil) {
                    self?.defaultLog()
                } else {
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
                completionHandler(true)
            }
            
            // Customize appearance
            deleteAction.backgroundColor = .background
            deleteAction.image = UIImage(systemName: "trash.fill")?.withTintColor(.primary, renderingMode: .alwaysOriginal)
            
            // Return the configuration
            let config = UISwipeActionsConfiguration(actions: [deleteAction])
            config.performsFirstActionWithFullSwipe = true
            return config
        } else { return nil }
    }
    
    
    func defaultLog () {
        logs = Array(realmLogs)
        
        if logs.isEmpty {
            let defaultLog = Log()
            defaultLog.pulse = "--"
            defaultLog.hrv = "--"
            logs = [defaultLog]
            trackDailyView.isHidden = false
        } else {
            trackDailyView.isHidden = true
        }
        
        logTableView.reloadData()
    }
}
