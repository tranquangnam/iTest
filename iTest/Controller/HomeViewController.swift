//
//  HomeViewController.swift
//  iTest
//
//  Created by CO-WELL on 12/21/17.
//  Copyright © 2017 CO-WELL. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.title = NSLocalizedString("home_title", comment: "");
        setupSettingButton();
    }
    
    @IBAction func detailClick(_ sender: UIButton) {
        let detailController = DetailController(nibName: "DetailView", bundle: nil);
        navigationController?.pushViewController(detailController, animated: true);
    }
    
    func setupSettingButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(HomeViewController.showLeftMenu))
    }
    
    @objc func showLeftMenu() {
        if let container = parent as? ContainerController {
            container.showMenu();
        }
    }
    
//    @objc func hideMenu() {
//        if let container = parent as? ContainerController {
//            container.hideMenu();
//        }
//    }
}
