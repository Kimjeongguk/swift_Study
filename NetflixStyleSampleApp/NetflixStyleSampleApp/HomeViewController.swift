//
//  HomeViewController.swift
//  NetflixStyleSampleApp
//
//  Created by Jeongguk Kim on 2022/07/22.
//

import UIKit


class HomeViewController: UICollectionViewController {
    var contents: [Content] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.hidesBarsOnSwipe = true
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "netflix_icon"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pperson.crop.circle"), style: .plain, target: nil, action: nil)
        
        contents = self.getContents()
        
        //CollectionView ItemCell 설정
        collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: "ContentCollectionViewCell")
        collectionView.register(ContentCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ContentCollectionViewHeader")
    }
    
    func getContents() -> [Content] {
        guard let path = Bundle.main.path(forResource: "Content", ofType: "plist"),
              let data = FileManager.default.contents(atPath: path),
              let list = try? PropertyListDecoder().decode([Content].self, from: data) else { return [] }
        return list
    }
}

//UICollectionView DataSorce, Delegate
extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default :
            return contents[section].contentItem.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch contents[indexPath.section].sectionType {
        case .basic, .large:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionViewCell", for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
            cell.imageView.image = contents[indexPath.section].contentItem[indexPath.row].image
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ContentCollectionViewHeader", for: indexPath) as? ContentCollectionViewHeader else { fatalError("Could not dequeue Header")}
            
            headerView.sectionNameLabel.text = contents[indexPath.section].sectionName
            return headerView
        }else {
            return UICollectionReusableView()
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return contents.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionName = contents[indexPath.section].sectionName
        print("Test: \(sectionName) section \(indexPath.row + 1)번째 컨텐츠")
    }
}
