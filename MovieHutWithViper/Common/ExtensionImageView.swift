//
//  ExtensionImageView.swift
//  MovieHutWithViper
//
//  Created by Faizul Karim on 20/3/22.
//

import Foundation
import SDWebImage
var imageCache = NSCache<NSString,UIImage>()

extension UIImageView {
    func setImageWithDownload(_ url : URL, withIndicator isIndicator: Bool = true) {
        self.sd_imageTransition = .fade
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: url, completed: nil)
    }
    func downloadImage(_ url : String, withIndicator isIndicator: Bool = true,completion:@escaping (Bool,UIImage)->()) {
        guard let imageUrl = URL(string: url) else{return}
        if let cachedImage = imageCache.object(forKey: url as NSString){
            self.image = cachedImage
            completion(true,cachedImage)
        }else{
            self.image = nil
            DispatchQueue(label: url, qos: .background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil).async {
                URLSession.shared.dataTask(with: imageUrl, completionHandler: { (data, response, error) in
                    guard error  == nil else{return}
                    guard let tempData = data else{return}
                    if let image = UIImage(data: tempData){
                        DispatchQueue.main.async {
                            self.image = image
                            completion(false,image)
                        }
                        imageCache.setObject(image, forKey: url as NSString)
                    }
                }).resume()
            }
        }
    }
}
