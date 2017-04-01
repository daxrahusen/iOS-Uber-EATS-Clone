//
//  DetailController.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 12/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit
import Hero

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

class DetailController: UIViewController {
    
    lazy var navigationBar: NavigationBar = {
        let view = NavigationBar(frame: .zero)
        view.titleLabel.text = "Roti Shop"
        view.delegate = self
        let backImage = #imageLiteral(resourceName: "Delete").withRenderingMode(.alwaysTemplate)
        view.backButton.setImage(backImage, for: .normal)
        let shareImage = #imageLiteral(resourceName: "share").withRenderingMode(.alwaysTemplate)
        view.shareButton.setImage(shareImage, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heroModifiers = [.translate(x: 0, y: -250)]
        return view
    }()

    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.bounces = false
        tb.delegate = self
        tb.dataSource = self
        tb.register(DetailRestaurantCell.self, forCellReuseIdentifier: "cell")
        tb.heroModifiers = [.translate(y: 500)]
        return tb
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = #imageLiteral(resourceName: "Delete").withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        button.heroModifiers = [.fade, .translate(x: 0, y: -200)]
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = #imageLiteral(resourceName: "share").withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        button.heroModifiers = [.fade, .translate(x: 0, y: -200)]
        return button
    }()
    
    let fabButton: FabButton = {
        let button = FabButton(frame: .zero)
        let hamburgerImage = #imageLiteral(resourceName: "UberFabImage").withRenderingMode(.alwaysTemplate)
        button.setImage(hamburgerImage, for: .normal)
        button.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.heroModifiers = [.fade, .translate(x: 0, y: 500)]
        return button
    }()
    
    var panGesture: UIPanGestureRecognizer!
    
    let meals = Meal.getMeals()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        if navigationBar.isNavigationBarVisible == true {
            return .default
        } else {
            return .lightContent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(gestureRecognizer:)))
        panGesture.delegate = self
        tableView.addGestureRecognizer(panGesture)

        let detailHeader = DetailHeader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 390))
        detailHeader.addGradient()
        tableView.tableHeaderView = detailHeader
        
        isHeroEnabled = true
        
        setupViews()
    }
    
    private func setupViews() {
        
        view.addSubview(tableView)
        view.addSubview(backButton)
        view.addSubview(shareButton)
        view.addSubview(navigationBar)
        view.addSubview(fabButton)

        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 18),
            backButton.heightAnchor.constraint(equalToConstant: 18),
            
            shareButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            shareButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            shareButton.widthAnchor.constraint(equalToConstant: 18),
            shareButton.heightAnchor.constraint(equalToConstant: 18),
            
            fabButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            fabButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            fabButton.widthAnchor.constraint(equalToConstant: 50),
            fabButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        navigationBar.navTopConstraint = NSLayoutConstraint(item: navigationBar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: -64)
        navigationBar.navTopConstraint?.isActive = true
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
    }
    
    func backButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        
        let distance = panGesture.translation(in: view)
        
        if tableView.contentOffset.y == 0.0 {
            
            if distance.y > 0 {
            
                switch panGesture.state {
                case .began:
                    dismiss(animated: true, completion: nil)
                    
                case .changed:
                    let translation = panGesture.translation(in: view)
                    let progress = translation.y / 2 / view.bounds.height
                    Hero.shared.update(progress: Double(progress))
                    
                default:
                    Hero.shared.end()
                }
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        animateHeaderButtons(scrollView: scrollView)
        animateNavigationBar(scrollView: scrollView)
    }
    
    private func animateHeaderButtons(scrollView: UIScrollView) {

        backButton.alpha = (100 - scrollView.contentOffset.y) / 100
        shareButton.alpha = (100 - scrollView.contentOffset.y) / 100
    }
    
    private func animateNavigationBar(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > 100.0 {
            
            if !navigationBar.isNavigationBarVisible {
                
                navigationBar.isNavigationBarVisible = !navigationBar.isNavigationBarVisible
                navigationBar.navTopConstraint?.constant = 0
                
                setNeedsStatusBarAppearanceUpdate()
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
            
        } else {
            
            if navigationBar.isNavigationBarVisible {
                
                navigationBar.isNavigationBarVisible = !navigationBar.isNavigationBarVisible
                navigationBar.navTopConstraint?.constant = -64
                
                setNeedsStatusBarAppearanceUpdate()
                                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
        }
    }
}

//MARK: - UITableViewDelegate
extension DetailController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension DetailController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let meal = meals[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailRestaurantCell
        cell.meal = meal
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return DetailTableHeader()
    }
    
}

//MARK: - UIGestureRecognizerDelegate
extension DetailController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if let pan = panGesture {
            let velocity = pan.velocity(in: tableView)
            return fabs(velocity.y) > fabs(velocity.x)
        }
        return true
    }
    
}

//MARK: - NavigationBarDelegate
extension DetailController: NavigationBarDelegate {
    
    func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showPaymentDetailVC() { return }
}




