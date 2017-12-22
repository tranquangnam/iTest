//
//  MovieResponse.swift
//  iTest
//
//  Created by CO-WELL on 12/22/17.
//  Copyright © 2017 CO-WELL. All rights reserved.
//

import Foundation

class MovieResponse: BaseResponse {
    
    var id: String = "";
    var title: String = ""
    var description: String = ""
    var url: String = ""
    var director: String = ""
    var producer: String = ""
    var release_date: String = ""
    var rt_score: String = ""
    var people: [String] = []
    var species: [String] = []
    var locations: [String] = []
    var vehicles: [String] = []
    
    required init(jsonData: [String: Any]) {
        super.init(jsonData: jsonData);
        id = jsonData["id"] as! String;
        title = jsonData["title"] as! String;
        url = jsonData["url"] as! String;
    }
    
    func toDAO() -> MovieInfoDAO? {
        let object: MovieInfoDAO = MovieInfoDAO();
        object.id = id;
        object.title = title;
        object.url = url;
        object.description = description;
        
        return object;
    }
}
