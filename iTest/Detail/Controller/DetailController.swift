//
//  DetailController.swift
//  iTest
//
//  Created by CO-WELL on 12/21/17.
//  Copyright © 2017 CO-WELL. All rights reserved.
//

import Foundation
import UIKit

class DetailController: BaseViewController {
    
    @IBOutlet weak var detailTitle: UILabel!
    
    override func viewDidLoad() {
        let title = NSLocalizedString("detail_title", comment: "")
        self.title = title;
    }
}
