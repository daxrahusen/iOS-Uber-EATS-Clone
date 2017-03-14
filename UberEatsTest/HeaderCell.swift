//
//  HeaderCell.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 12/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .white
        sv.delegate = self
        sv.isPagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        return sv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GEEN MINIMUM BESTEL BEDRAG"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NO MINIMUM ORDER SIZE"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPage = 0
        pc.numberOfPages = 3
        pc.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.4)
        pc.currentPageIndicatorTintColor = .white
        return pc
    }()
    
    let images = [#imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image2"), #imageLiteral(resourceName: "image3")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        
        
        setupViews()
        setupScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(pageControl)
        
        pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        pageControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 40).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(detailLabel)
        
        detailLabel.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -4).isActive = true
        detailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        detailLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        detailLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        addSubview(titleLabel)
        
        titleLabel.bottomAnchor.constraint(equalTo: detailLabel.topAnchor, constant: -4).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: frame.width - (frame.width / 4)).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    private func setupScrollView() {
        
        scrollView.contentSize = CGSize(width: frame.width * CGFloat(3), height: frame.height)
        
        for (index, image) in images.enumerated() {
            
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.frame.size.width = bounds.size.width
            imageView.clipsToBounds = true
            imageView.frame = CGRect(x: CGFloat(index) * bounds.size.width, y: 0, width: bounds.width, height: bounds.height)
            addGradient(imageView: imageView)
            scrollView.addSubview(imageView)
        }
    }
    
    private func addGradient(imageView: UIImageView) {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = imageView.bounds
        gradient.colors = [UIColor.black.withAlphaComponent(0.3).cgColor, UIColor.black.withAlphaComponent(0.3).cgColor]
        gradient.locations = [0.0, 1.0]
        
        imageView.layer.insertSublayer(gradient, at: 0)
    }
    
}

//MARK: - UIScrollViewDelegate
extension HeaderCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let int = scrollView.contentOffset.x / scrollView.frame.width
        
        pageControl.currentPage = Int(int)
    }
    
}
