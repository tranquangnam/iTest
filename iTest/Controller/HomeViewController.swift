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
    }
    
    @IBAction func detailClick(_ sender: UIButton) {
        let detailController = DetailController(nibName: "DetailView", bundle: nil);
        navigationController?.pushViewController(detailController, animated: true);
    }
}
