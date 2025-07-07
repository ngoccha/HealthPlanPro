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

        let window = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
        let vc = FirstPageVC()
        let naviVC = UINavigationController(rootViewController: vc)
        window?.rootViewController = naviVC
        window?.makeKeyAndVisible()
        
    }


}

