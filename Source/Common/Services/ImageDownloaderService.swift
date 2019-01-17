//
//  ImageDownloaderService.swift
//  GitHubRating
//
//  Created by dede.exe on 17/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class DownloadImageService {
    
    let session = URLSession.shared
    
    func get(imageUrl:String, completion: ((RequestResult<UIImage>) -> Void)?) {
        
        guard let url = URL(string:imageUrl) else {
            let error = NSError(domain: "Request error", code: 400, userInfo: nil)
            completion?(RequestResult<UIImage>.fail(error))
            return
        }
        
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let rawData = data, let image = UIImage(data: rawData) {
                let result = RequestResult<UIImage>.success(image)
                completion?(result)
                return
            }
            
            if let httpRespnse = response as? HTTPURLResponse {
                let error = NSError(domain: "Fail to download image", code: httpRespnse.statusCode, userInfo: nil)
                let result = RequestResult<UIImage>.fail(error)
                completion?(result)
                return
            }
            
            let err = error ?? NSError(domain: "Unknown error", code: 700, userInfo: nil)
            let result = RequestResult<UIImage>.fail(err)
            completion?(result)
            
        }.resume()
        
    }
    
}
