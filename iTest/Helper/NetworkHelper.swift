//
//  NetworkHelper.swift
//  iTest
//
//  Created by CO-WELL on 12/22/17.
//  Copyright © 2017 CO-WELL. All rights reserved.
//

import Alamofire

class NetworkHelper {
    
    static func resolveURL(url: String) -> String {
        return String("\(BASE_URL)\(url)");
    }
    
    static func request<T: BaseResponse>(suffixUrl: String,
                        param: BaseRequest? = nil,
                        successHandler: @escaping (T) -> Void,
                        errorHandler: @escaping (Error?) -> Void) -> Void
    {
        let url: String = resolveURL(url: suffixUrl);
        print("Request URL: \(url)")
        Alamofire.request(resolveURL(url:suffixUrl)).responseJSON(completionHandler: {(response) in
            if (response.error == nil) {
                // Request success!!!
                
                print(response.result);
                let jsonData = response.result.value as! [String: Any]
                let data: T = T.init(jsonData: jsonData)
                successHandler(data);
            } else {
                // Request failed!!!
                
                print("Network error!!!");
                print("\(response.error.debugDescription)")
                errorHandler(response.error);
            }
        })
    }
    
    static func getMovies(
        successHandler: @escaping (MovieResponse) -> Void,
        errorHandler: @escaping (Error?) -> Void
        ) {
        request(suffixUrl: Constant.UrlConstant.GET_MOVIE, successHandler: successHandler, errorHandler: errorHandler);
    }
}
