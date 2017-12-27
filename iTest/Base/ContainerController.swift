//
//  ContainerController.swift
//  iTest
//
//  Created by CO-WELL on 12/25/17.
//  Copyright © 2017 CO-WELL. All rights reserved.
//

import UIKit

protocol ContainerDelegate: class {
    func showMenu() -> Void
    
    func hideMenu() -> Void
}

class ContainerController: UINavigationController, ContainerDelegate {
    
    let ANIMATE_TIME = 0.4;
    
    var showCenter: CGPoint!
    var hideCenter: CGPoint!
    
    var mMenuWidth = 0;
    var mMenuHeight = 0;

    var menuController: MenuTableViewController = MenuTableViewController();
    var touchGesture: UITapGestureRecognizer?
    var mIsMenuShowing: Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mMenuWidth = Int(view.bounds.width) * 2 / 3 as Int;
        mMenuHeight = Int(view.bounds.height) as Int;
        showCenter = CGPoint(x: mMenuWidth / 2, y: mMenuHeight / 2);
        hideCenter = CGPoint(x: CGFloat(mMenuWidth) / -2.0, y: showCenter.y);
        
        menuController.addMenuItem(menuItem: "Menu")
        menuController.addMenuItem(menuItem: "Left")
        
        addChildViewController(menuController);
        view.addSubview(menuController.view);
        let size: CGSize = CGSize(width: mMenuWidth, height: mMenuHeight);
        let bounds: CGRect = CGRect(origin: view.bounds.origin, size: size);
        menuController.view.frame = bounds;
        
        menuController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        menuController.didMove(toParentViewController: self);
        
        menuController.view.center.x = hideCenter.x;
//        menuController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showMenu() -> Void {
        print("Show Left Menu");
        
        // Setup touch
        
        for controller in viewControllers {
            if (controller is BaseViewController) {
                touchGesture = UITapGestureRecognizer(target: self, action: #selector(hideMenu))
                touchGesture!.numberOfTapsRequired = 1;
                controller.view.addGestureRecognizer(touchGesture!);
            } else {
                continue;
            }
        }
        
        // Setup animation
        UIView.animate(withDuration: ANIMATE_TIME) {
            self.menuController.view.center = self.showCenter;
        }
        
        mIsMenuShowing = true;
    }
    
    @objc func hideMenu() -> Void {
        print("Hide Left Menu")
        mIsMenuShowing = false;
        
        // Animation Left
        UIView.animate(withDuration: ANIMATE_TIME) {
            self.menuController.view.center = self.hideCenter;
        }
        //
        
        // Setup touch
        for controller in viewControllers {
            if (controller is BaseViewController) {
                controller.view.removeGestureRecognizer(touchGesture!);
                touchGesture = nil;
            }
        }
        
    }
    
    func isMenuShowing() -> Bool {
        return mIsMenuShowing;
    }
    
}
