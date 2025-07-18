//
//  GoalOptionVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 04/07/2025.
//

import UIKit

class GoalOptionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var goals: [Option] = [
        Option(name: "Improve Heart Health", imageName: "goal1", isSelected: false),
        Option(name: "Improve blood pressure health", imageName: "goal2", isSelected: false),
        Option(name: "Reduce Stress", imageName: "goal3", isSelected: false),
        Option(name: "Increase Energy Levels", imageName: "goal4", isSelected: false)
    ]
    
    @IBAction func continueButton(_ sender: UIButton) {
        let planOptionVC = PlanOptionVC()
        navigationController?.pushViewController(planOptionVC, animated: true)
    }
    
    @IBOutlet weak var continueOutletButton: UIButton!
    
    @IBOutlet weak var goalOptionCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        
        continueOutletButton.layer.cornerRadius = 16
        continueOutletButton.backgroundColor = UIColor(named: "neutral3")
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        goalOptionCollectionView.delegate = self
        goalOptionCollectionView.dataSource = self
        
        goalOptionCollectionView.register(UINib(nibName: "GoalOptionCell", bundle: .main), forCellWithReuseIdentifier: "GoalOptionCell")
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = goalOptionCollectionView.dequeueReusableCell(withReuseIdentifier: "GoalOptionCell", for: indexPath) as! GoalOptionCell
        
        
        let item = goals[indexPath.row]
        cell.goalLabel.text = item.name
        cell.goalImage.image = UIImage(named: item.imageName)
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
        
        goals[indexPath.row].isSelected.toggle()
        collectionView.reloadItems(at: [indexPath])
        
        let isAnyItemSelected = goals.contains { (item: Option) -> Bool in
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

extension GoalOptionVC: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
