//
//  BillingController.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 01/04/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class BillingController: UIViewController {

    lazy var pagingView: PagingView = {
        let pv = PagingView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.delegate = self
        pv.layer.shadowColor = UIColor.black.cgColor
        pv.layer.shadowOffset = CGSize(width: 0, height: 0)
        pv.layer.shadowRadius = 5
        pv.layer.shadowOpacity = 0.2
        pv.layer.masksToBounds = false
        return pv
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 233/255, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        cv.register(PreviousOrderCell.self, forCellWithReuseIdentifier: "previousOrderId")
        cv.register(SavedMealCell.self, forCellWithReuseIdentifier: "savedOrderId")
        cv.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        cv.scrollIndicatorInsets = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        return cv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        view.addSubview(pagingView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pagingView.topAnchor.constraint(equalTo: view.topAnchor),
            pagingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            pagingView.rightAnchor.constraint(equalTo: view.rightAnchor),
            pagingView.heightAnchor.constraint(equalToConstant: 64)
            
        ])
    }
}

//MARK: - Extension
extension BillingController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if !pagingView.selectorViewIsScrolling {
            
            let item = scrollView.contentOffset.x > 187.5 ? 1 : 0
            
            let indexPath = IndexPath(item: item, section: 0)
            
            pagingView.animateSelectorViewWith(indexPath: indexPath)
            pagingView.selectItemWith(indexPath: indexPath)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pagingView.selectorViewIsScrolling = false
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pagingView.selectorViewIsScrolling = false
    }
}

//MARK: - UICollectionViewDataSource
extension BillingController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previousOrderId", for: indexPath) as! PreviousOrderCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "savedOrderId", for: indexPath) as! SavedMealCell
            cell.delegate = self
            return cell
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension BillingController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


//MARK: - PagingViewDelegate
extension BillingController: PagingViewDelegate {
    
    func didSelectItemInPagingViewWith(index: Int) {
        
        pagingView.selectorViewIsScrolling = true
        
        let indexPath = IndexPath(item: index, section: 0)
        
        if index == 0 {
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        } else {
            collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }
    }
}

//MARK: - SavedMealDelegate
extension BillingController: SavedMealDelegate {
    
    func showHomeVC() {
        tabBarController?.selectedIndex = 0
    }
}
