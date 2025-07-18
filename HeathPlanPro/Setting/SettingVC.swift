//
//  SettingVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 05/07/2025.
//

import UIKit

class SettingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var section1: [Setting] = [Setting(icon: UIImage(named: "profile")!, nameSetting: "Profile", isSelected: false)]
    var section2: [Setting] = [
        Setting(icon: UIImage(named: "bell")!, nameSetting: "Daily Reminder", isSelected: false),
        Setting(icon: UIImage(named: "category")!, nameSetting: "Change App Icon", isSelected: false),
        Setting(icon: UIImage(named: "globe")!, nameSetting: "Language", isSelected: false)
    ]
    var section3: [Setting] = [
        Setting(icon: UIImage(named: "like")!, nameSetting: "Rate Us", isSelected: false),
        Setting(icon: UIImage(named: "mail")!, nameSetting: "Feedback", isSelected: false),
        Setting(icon: UIImage(named: "shield")!, nameSetting: "Privacy Policy", isSelected: false),
        Setting(icon: UIImage(named: "document")!, nameSetting: "Term of User", isSelected: false)
    ]

    
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
//        self.tabBarController?.tabBar.isHidden = false
        
        settingTableView.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")

        settingTableView.delegate = self
        settingTableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return section1.count
            case 1:
                return section2.count
            case 2:
                return section3.count
            default:
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
                
        switch indexPath.section {
            case 0:
                let item = section1[indexPath.row]
                cell.configure(icon: item.icon, name: item.nameSetting)
            case 1:
                let item = section2[indexPath.row]
                cell.configure(icon: item.icon, name: item.nameSetting)
            case 2:
                let item = section3[indexPath.row]
                cell.configure(icon: item.icon, name: item.nameSetting)
            default:
                break
            }
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "background")
        return headerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == .zero else {
            return
        }
        
//        section1[indexPath.row].isSelected.toggle()
//
//        if section1[indexPath.row].isSelected {
            goToProfile()
//        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? SettingCell else { return }

        let totalRows = tableView.numberOfRows(inSection: indexPath.section)

        if totalRows == 1 {
            cell.cellView.layer.cornerRadius = 16
            cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.width, bottom: 0, right: 0)
        } else if indexPath.row == 0 {
            cell.cellView.layer.cornerRadius = 16
            cell.cellView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else if indexPath.row == totalRows - 1 {
            cell.cellView.layer.cornerRadius = 16
            cell.cellView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.width, bottom: 0, right: 0)
        } else {
            cell.cellView.layer.cornerRadius = 0
        }

        cell.cellView.layer.masksToBounds = true
    }

    
    @objc func goToProfile() {
        if ProfileManager.shared.hasProfile() {
            let profileVC = ProfileVC()
            profileVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(profileVC, animated: true)
        } else {
            let infoProfileVC = InfoProfileVC()
            infoProfileVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(infoProfileVC, animated: true)
        }
    }
    
}

