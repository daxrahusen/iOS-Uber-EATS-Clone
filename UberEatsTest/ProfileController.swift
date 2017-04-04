//
//  ProfileController.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 30/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit

class ProfileController: UITableViewController {
    
    var settings = Settings.getSettings()
    
    var statusBarView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableHeader = ProfileHeader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        tableView.tableHeaderView = tableHeader
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        tableView.register(ProfileSettingCell.self, forCellReuseIdentifier: "profileSettingsId")
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 244/255.0, alpha: 1)
        tableView.bounces = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupStatusBarView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        statusBarView.removeFromSuperview()
    }
    
    private func setupStatusBarView() {
        
        statusBarView = UIView()
        statusBarView.backgroundColor = .white
        statusBarView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20)
        
        if let window = UIApplication.shared.delegate?.window {
            window?.addSubview(statusBarView)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return 6
        case 1:
            return 1
        case 2:
            return 1
        default:
            assert(false, "Something went totaly wrong...")
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileSettingsId", for: indexPath) as! ProfileSettingCell
            cell.setting = settings[indexPath.row]
            cell.selectionStyle = .none
            return cell
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
            cell.backgroundColor = UIColor(red: 92/255.0, green: 197/255.0, blue: 94/255.0, alpha: 0.5)
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            break
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.textLabel?.text = "Over Uber"
            cell.selectionStyle = .none
            return cell
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 8
        case 2:
            return 8
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 55
        case 1:
            return 80
        case 2:
            return 40
        default:
            break
        }
        
        return 44
    }
}

