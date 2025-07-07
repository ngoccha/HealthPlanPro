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

        settingTableView.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")

        settingTableView.delegate = self
        settingTableView.dataSource = self
        
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
        
        // cẩn thận sẽ lấy dữ liệu ở 3 mảng cùng lúc --> phải xác định xem đang ở section nào mới lấy dữ liệu ở mảng bằng switch
        
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
        // Chỉ cho phép chọn ở section 0 (section đầu tiên)
        guard indexPath.section == 0 else {
            // Nếu user bấm vào section khác thì không làm gì cả
            return
        }
        
        section1[indexPath.row].isSelected.toggle()

        if section1[indexPath.row].isSelected {
            goToProfile()
        }
    }
    
    @objc func goToProfile() {
        if ProfileManager.shared.hasProfile() {
            let profileVC = ProfileVC()
            navigationController?.pushViewController(profileVC, animated: true)
        } else {
            let infoProfileVC = InfoProfileVC()
            navigationController?.pushViewController(infoProfileVC, animated: true)
        }
    }
    
}
