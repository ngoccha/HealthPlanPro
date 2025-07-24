//
//  IntroVC.swift
//  HeathPlanPro
//
//  Created by iKame Elite Fresher 2025 on 7/24/25.
//

import UIKit

class IntroVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var parentCollectionView: UICollectionView!
    @IBOutlet weak var continueButton: UIButton!
    
    var currentPage = 0
    
    private let options = [issues, goals, plans]
    private var selectedOption: [[Int]] = [[], [], []]
    
    let titles = [
        "Which heart health issue concerns you the most?",
        "What would you like to achieve?",
        "What type of plan would you like to follow?"
    ]
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        if currentPage < 2 {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            parentCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
            
            titleLabel.text = titles[currentPage]
            
            if selectedOption[currentPage].count > 0 {
                continueButton.isEnabled = true
                continueButton.backgroundColor = UIColor(named: "primary")
            } else {
                continueButton.isEnabled = false
                continueButton.backgroundColor = UIColor(named: "neutral3")
            }
        } else {
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButton.layer.cornerRadius = 16
        continueButton.backgroundColor = UIColor(named: "neutral3")
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        parentCollectionView.delegate = self
        parentCollectionView.dataSource = self
        
        parentCollectionView.register(UINib(nibName: "IntroParentCell", bundle: nil), forCellWithReuseIdentifier: "IntroParentCell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroParentCell", for: indexPath) as! IntroParentCell
        cell.configure(with: options[indexPath.item], selectedItems: selectedOption[indexPath.item]) { [weak self] selectedIndices in
            self?.selectedOption[indexPath.item] = selectedIndices
            
            guard let self = self else { return }
            if self.selectedOption[self.currentPage].count > 0 {
                self.continueButton.isEnabled = true
                self.continueButton.backgroundColor = UIColor(named: "primary")
            } else {
                self.continueButton.isEnabled = false
                self.continueButton.backgroundColor = UIColor(named: "neutral3")
            }
        }
        return cell
    }
    
}
