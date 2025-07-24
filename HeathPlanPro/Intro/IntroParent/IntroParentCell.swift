//
//  IntroParentCell.swift
//  HeathPlanPro
//
//  Created by iKame Elite Fresher 2025 on 7/24/25.
//

import UIKit

class IntroParentCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var options: [IntroOption] = []
    var selectedOptionIndices: [Int] = []
    var onSelectionChanged: (([Int]) -> Void)?

    @IBOutlet weak var parentCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        parentCollectionView.delegate = self
        parentCollectionView.dataSource = self
        
        parentCollectionView.register(UINib(nibName: "IntroChildCell", bundle: nil), forCellWithReuseIdentifier: "IntroChildCell")
        parentCollectionView.allowsMultipleSelection = true
    }
    
    func configure(with items: [IntroOption], selectedItems: [Int], onSelectionChanged: @escaping ([Int]) -> Void) {
        self.options = items
        self.selectedOptionIndices = selectedItems
        self.onSelectionChanged = onSelectionChanged
        
        parentCollectionView.reloadData()
        
        for index in selectedItems {
            let indexPath = IndexPath(item: index, section: 0)
            parentCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroChildCell", for: indexPath) as! IntroChildCell
        
        let item = options[indexPath.item]
        
        cell.configure(title: item.name, image: item.imageName)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !selectedOptionIndices.contains(indexPath.item) {
            selectedOptionIndices.append(indexPath.item)
        }
        onSelectionChanged?(selectedOptionIndices)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selectedOptionIndices.removeAll { $0 == indexPath.item }
        onSelectionChanged?(selectedOptionIndices)
    }
    
}
