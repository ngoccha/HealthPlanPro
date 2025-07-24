//
//  ViewController.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 03/07/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstLaunch = !UserDefaults.standard.bool(forKey: "firstLaunch")
        if firstLaunch {
            let window = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
            let vc = FirstPageVC()
            let naviVC = UINavigationController(rootViewController: vc)
            window?.rootViewController = naviVC
        }
        else {
            let window = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first

            let logVC = LogVC()
            let logNavi = UINavigationController(rootViewController: logVC)
            logVC.tabBarItem = UITabBarItem(title: "Report", image: UIImage(named: "report"), tag: 0)
            
            
            let settingVC = SettingVC()
            let settingNavi = UINavigationController(rootViewController: settingVC)
            settingVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), tag: 1)
            
            let tabbarController = UITabBarController()
            tabbarController.viewControllers = [logNavi, settingNavi]
            tabbarController.tabBar.tintColor = UIColor(named: "primary")
            tabbarController.tabBar.backgroundColor = .white
            tabbarController.tabBar.layer.cornerRadius = 20
            
            window?.rootViewController = tabbarController
        }
        
    }
}

