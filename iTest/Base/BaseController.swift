//
//  BaseController.swift
//  iTest
//
//  Created by CO-WELL on 12/21/17.
//  Copyright © 2017 CO-WELL. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    func showDialog(message: String) -> Void {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .destructive:
                print("destructive")
                
                
            case .cancel:
                print("Cancel")
            }}))
        self.present(alert, animated: true, completion: nil);
    }
}
