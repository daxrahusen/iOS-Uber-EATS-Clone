//
//  MealController.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 04/04/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit
import Hero

class MealController: UIViewController {
    
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
        return view
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

    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.tableFooterView = UIView()
        tv.separatorStyle = .none
        tv.register(TypeFoodCell.self, forCellReuseIdentifier: "typeFoodCell")
        tv.register(IntructionsCell.self, forCellReuseIdentifier: "intructionsCell")
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .white
        tv.keyboardDismissMode = .onDrag
        return tv
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.tintColor = .white
        button.setTitle("1 TOEVOEGEN AAN WINKELMAND €7.50", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }()
    
    var radioButtons = [RadioButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        tableView.tableHeaderView = headerView
        
        view.addGradient()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        if !navigationBar.isNavigationBarVisible {
            return .lightContent
        }
        
        return .default
    }
    
    private func setupViews() {
        
        view.addSubview(tableView)
        view.addSubview(submitButton)
        view.addSubview(backButton)
        view.addSubview(shareButton)
        view.addSubview(navigationBar)
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            submitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
            submitButton.heightAnchor.constraint(equalToConstant: 60),
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 18),
            backButton.heightAnchor.constraint(equalToConstant: 18),
            
            shareButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            shareButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            shareButton.widthAnchor.constraint(equalToConstant: 18),
            shareButton.heightAnchor.constraint(equalToConstant: 18)
        
        ])
        
        navigationBar.navTopConstraint = NSLayoutConstraint(item: navigationBar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: -64)
        navigationBar.navTopConstraint?.isActive = true
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 64).isActive = true
    }
    
    func backButtonClicked() {
        dismiss(animated: true, completion: nil)
    }

}

//MARK: - UITableViewDataSource
extension MealController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44)
        headerView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 233/255, alpha: 1)
        
        let label = UILabel(frame: CGRect(x: 12, y: 18, width: 200, height: 18))
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        
        if section == 0 {
            label.text = "KEUZE UIT:"
        } else {
            label.text = "SPECIALE INSTRUCTIES"
        }
        
        headerView.addSubview(label)
        
        if section == 0 {
        
            let requiredLabel = UILabel(frame: CGRect(x: tableView.frame.width - 108, y: 18, width: 90, height: 18))
            requiredLabel.backgroundColor = .lightGray
            requiredLabel.textColor = .white
            requiredLabel.textAlignment = .center
            requiredLabel.text = "VERPLICHT"
            requiredLabel.font = UIFont.boldSystemFont(ofSize: 12)
            requiredLabel.layer.cornerRadius = 2
            requiredLabel.layer.masksToBounds = true
            
            headerView.addSubview(requiredLabel)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let titles = ["Gewoon", "Speciaal"]
        
        if indexPath.section == 0 {
            //typeFoodCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "typeFoodCell", for: indexPath) as! TypeFoodCell
            cell.title = titles[indexPath.row]
            cell.radioButton.tag = indexPath.row
            cell.radioButton.delegate = self
            
            if indexPath.row == 1 {
                cell.extraTimeLabel.isHidden = false
                cell.seperatorView.isHidden = true
            }
            
            cell.selectionStyle = .none
            
            radioButtons.append(cell.radioButton)
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "intructionsCell", for: indexPath) as! IntructionsCell
            cell.stepperView.delegate = self
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 50
        case 1:
            return 250
        default:
            assert(false, "Something went terrebly wrong...")
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}

//MARK: - UIScrollViewDelegate
extension MealController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let headerView = tableView.tableHeaderView as! HeaderView
        headerView.scrollViewDidScroll(scrollView: scrollView)
        
        animateNavigationBarWith(scrollView: scrollView)
        
        print(scrollView.contentOffset.y)
    }
    
    private func animateNavigationBarWith(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > 136.0 {
            
            if !navigationBar.isNavigationBarVisible {
                
                navigationBar.isNavigationBarVisible = !navigationBar.isNavigationBarVisible
                navigationBar.navTopConstraint?.constant = 0
                
                setNeedsStatusBarAppearanceUpdate()
                
                let gradient = view.getGradienFrom(view: self.view)
                gradient?.isHidden = true
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
            
        } else {
            
            if navigationBar.isNavigationBarVisible {
                
                navigationBar.isNavigationBarVisible = !navigationBar.isNavigationBarVisible
                navigationBar.navTopConstraint?.constant = -64
                
                setNeedsStatusBarAppearanceUpdate()
                
                let gradient = view.getGradienFrom(view: self.view)
                gradient?.isHidden = false
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
        }
    }
}

//MARK: - UITableViewDelegate
extension MealController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

//MARK: - StepperViewDelegate
extension MealController: StepperViewDelegate {
    
    func updateAmountNumber(amount: Int) {
        
        let text = "\(amount) TOEVOEGEN AAN WINKELMAND €7.50"
        
        submitButton.setTitle(text, for: .normal)
    }
}

//MARK: - RadioButtonDelegate
extension MealController: RadioButtonDelegate {
    
    func didClickRadioButtonWith(int: Int, and state: Bool) {
        
        submitButton.backgroundColor = state ? UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 1) : UIColor.lightGray
        
        for button in radioButtons {
            
            if button.tag != int {
                
                if button.isRadioButtonSelected {
                
                    button.animateView()

                }
            }
        }
    }
}

//MARK: - NavigationBarDelegate
extension MealController: NavigationBarDelegate {
    
    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    func showPaymentDetailVC() {
        
    }
}


