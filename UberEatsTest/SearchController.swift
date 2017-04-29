//
//  SearchController.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 30/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class SearchController: UITabBarController {

    let searchTextField: ImageTextField = {
        let tf = ImageTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .none
        tf.tintColor = UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1)
        let searchImage = #imageLiteral(resourceName: "search_unselected")
        tf.leftImage = searchImage
        tf.placeholder(text: "Zoeken", withfont: 26)
        return tf
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.register(CategoryCell.self, forCellWithReuseIdentifier: "id")
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        cv.keyboardDismissMode = .onDrag
        cv.bounces = false
        return cv
    }()
    
    var textFieldHeightConstant: NSLayoutConstraint?
    
    var categories = Category.getFoodCategories()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    private func setupViews() {
        
        view.addSubview(searchTextField)
        
        searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 22).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textFieldHeightConstant = searchTextField.heightAnchor.constraint(equalToConstant: 100)
        textFieldHeightConstant?.isActive = true

        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UICollectionViewDelegate
extension SearchController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(123)
    }
}

//MARK: - UICollectionViewDataSource
extension SearchController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! CategoryCell
        
        cell.category = categories[indexPath.row]
        
        cell.backgroundColor = .blue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId", for: indexPath)
        
        let label = UILabel(frame: CGRect(x: 0, y: 25, width: 200, height: 20))
        label.text = "Topcategorieën"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        
        header.addSubview(label)
        
        return header
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SearchController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = view.frame.width / 2 - 12
        
        return CGSize(width: size, height: size - 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
}

//MARK: - UIScrollViewDelegate
extension SearchController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y < 60 {
            
            print(scrollView.contentOffset.y)
            
            textFieldHeightConstant?.constant = 100 - scrollView.contentOffset.y
            
            self.view.layoutIfNeeded()
        }
        
        if (textFieldHeightConstant?.constant)! < CGFloat(50) {
            searchTextField.placeholder(text: "Zoek een restaurant of keuken", withfont: 18)
        } else {
            searchTextField.placeholder(text: "Zoeken", withfont: 26)
        }
    }
}














