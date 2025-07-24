//
//  PlanOptionVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 04/07/2025.
//

import UIKit

class PlanOptionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var plans: [IntroOption] = [
        IntroOption(name: "Educational Plan", imageName: "plan1", isSelected: false),
        IntroOption(name: "Exercise Plan", imageName: "plan2", isSelected: false),
        IntroOption(name: "Health Tests", imageName: "plan3", isSelected: false)
    ]

    @IBAction func continueButton(_ sender: UIButton) {
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
        
        UserDefaults.standard.set(true, forKey: "firstLaunch")
        
    }
    
    @IBOutlet weak var continueOutletButton: UIButton!
    
    @IBOutlet weak var planOptionCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        continueOutletButton.layer.cornerRadius = 16
        continueOutletButton.backgroundColor = UIColor(named: "neutral3")
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        planOptionCollectionView.delegate = self
        planOptionCollectionView.dataSource = self
        
        planOptionCollectionView.register(UINib(nibName: "PlanOptionCell", bundle: .main), forCellWithReuseIdentifier: "PlanOptionCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plans.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = planOptionCollectionView.dequeueReusableCell(withReuseIdentifier: "PlanOptionCell", for: indexPath) as! PlanOptionCell
        
        
        let item = plans[indexPath.row]
        cell.planLabel.text = item.name
        cell.planImage.image = UIImage(named: item.imageName)
        cell.checkButton.isSelected = item.isSelected
        
        if item.isSelected {
            cell.checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            cell.checkButton.configuration?.baseForegroundColor = UIColor(named: "primary")
            cell.layer.borderColor = UIColor(named: "primary")?.cgColor
            cell.layer.borderWidth = 1
        } else {
            cell.checkButton.setImage(UIImage(systemName: "square.fill"), for: .normal)
            cell.checkButton.configuration?.baseForegroundColor = UIColor(named: "neutral3")
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.borderWidth = 0
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        plans[indexPath.row].isSelected.toggle()
        collectionView.reloadItems(at: [indexPath])
        
        let isAnyItemSelected = plans.contains { (item: IntroOption) -> Bool in
            return item.isSelected
        }

        if isAnyItemSelected {
            continueOutletButton.isEnabled = true
            continueOutletButton.backgroundColor = UIColor(named: "primary")
        } else {
            continueOutletButton.isEnabled = false
            continueOutletButton.backgroundColor = UIColor(named: "neutral3")
        }
    }

}

extension PlanOptionVC: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
