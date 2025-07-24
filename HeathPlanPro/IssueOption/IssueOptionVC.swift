//
//  IssueOptionVC.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 03/07/2025.
//

import UIKit

class IssueOptionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var issues: [IntroOption] = [
        IntroOption(name: "Heart Rate", imageName: "issue1", isSelected: false),
        IntroOption(name: "High Blood Pressure", imageName: "issue2", isSelected: false),
        IntroOption(name: "Stress & Anxiety", imageName: "issue3", isSelected: false),
        IntroOption(name: "Low Energy Levels", imageName: "issue4", isSelected: false)
    ] 
    
    @IBAction func continueButton(_ sender: UIButton) {
        
        let goalOptionVC = GoalOptionVC()

        navigationController?.pushViewController(goalOptionVC, animated: true)
    }
    
    @IBOutlet weak var continueButtonOutlet: UIButton!
    
    @IBOutlet weak var issueOptionCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButtonOutlet.layer.cornerRadius = 16
        continueButtonOutlet.backgroundColor = UIColor(named: "neutral3")
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        issueOptionCollectionView.delegate = self
        issueOptionCollectionView.dataSource = self

        issueOptionCollectionView.register(UINib(nibName: "IssueOptionCell", bundle: .main), forCellWithReuseIdentifier: "IssueOptionCell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return issues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = issueOptionCollectionView.dequeueReusableCell(withReuseIdentifier: "IssueOptionCell", for: indexPath) as! IssueOptionCell
        
        
        let item = issues[indexPath.row]
        cell.issueLabel.text = item.name
        cell.issueImage.image = UIImage(named: item.imageName)
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
        
        issues[indexPath.row].isSelected.toggle()
        collectionView.reloadItems(at: [indexPath])
        
        let isAnyItemSelected = issues.contains { (item: IntroOption) -> Bool in
            return item.isSelected
        }

        if isAnyItemSelected {
            continueButtonOutlet.isEnabled = true
            continueButtonOutlet.backgroundColor = UIColor(named: "primary")
        } else {
            continueButtonOutlet.isEnabled = false
            continueButtonOutlet.backgroundColor = UIColor(named: "neutral3")
        }
    }
}

extension IssueOptionVC: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

