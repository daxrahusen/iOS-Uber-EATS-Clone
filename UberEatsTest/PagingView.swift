//
//  PagingView.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 01/04/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

protocol PagingViewDelegate: class {
    func didSelectItemInPagingViewWith(index: Int)
}

class PagingView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.register(PagingCell.self, forCellWithReuseIdentifier: "id")
        return cv
    }()
    
    let selectorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let titles = ["EERDERE BESTELLINGEN", "BINNENKORT"]
    var selectorViewIsScrolling = false
    
    var selectorXAnchorConstraint: NSLayoutConstraint?
    
    weak var delegate: PagingViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        let indexPath = IndexPath(item: 0, section: 0)
        selectItemWith(indexPath: indexPath)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(collectionView)
        addSubview(selectorView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        selectorXAnchorConstraint = selectorView.centerXAnchor.constraint(equalTo: centerXAnchor)
        selectorXAnchorConstraint?.constant -= UIScreen.main.bounds.width / 4
        selectorXAnchorConstraint?.isActive = true

        selectorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 1).isActive = true
        selectorView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        selectorView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 60).isActive = true
    }
    
    func animateSelectorViewWith(indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            selectorXAnchorConstraint?.constant = 0 - UIScreen.main.bounds.width / 4
        } else {
            selectorXAnchorConstraint?.constant = UIScreen.main.bounds.width / 4
        }
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveLinear, animations: {
            
            self.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    func selectItemWith(indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
    }
}

//MARK: - UICollectionViewDelegate
extension PagingView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItemInPagingViewWith(index: indexPath.item)
        animateSelectorViewWith(indexPath: indexPath)
    }
}

//MARK: - UICollectionViewDataSource
extension PagingView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! PagingCell
        cell.backgroundColor = .white
        cell.titleLabel.text = titles[indexPath.row]
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PagingView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (frame.width / 2) - 2
        
        return CGSize(width: width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
