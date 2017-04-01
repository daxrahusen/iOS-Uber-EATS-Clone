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
        return pv
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(pagingView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            pagingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            pagingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            pagingView.rightAnchor.constraint(equalTo: view.rightAnchor),
            pagingView.heightAnchor.constraint(equalToConstant: 44),
            
            collectionView.topAnchor.constraint(equalTo: pagingView.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}

//MARK: - UICollectionViewDelegate
extension BillingController: UICollectionViewDelegate {
    
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
        
        cell.backgroundColor = .white
        
        return cell
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
