//
//  DetailController.swift
//  iTest
//
//  Created by CO-WELL on 12/21/17.
//  Copyright © 2017 CO-WELL. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DetailController: BaseViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBAction func startClicked(_ sender: UIButton) {
        NetworkHelper.getMovies(successHandler: {(movie) in
            self.showDialog(message: String("Movie info \(movie.title)"))
        }, errorHandler: {
            (error) in
            self.showDialog(message: String("Network Error!!!"))
        })
    }
    
    override func viewDidLoad() {
        let title = NSLocalizedString("detail_title", comment: "")
        self.title = title;
        
        Alamofire.request("http://media.doisongphapluat.com/476/2016/10/27/hinh-anh-halloween-de-thuong1.jpg", method: .get)
            .responseData { (response) in
                if response.error == nil {
                    print(response.result)
                    
                    // Show the downloaded image:
                    if let data = response.data {
                        self.image.image = UIImage(data: data)
                    }
                }
        }
    }
}
