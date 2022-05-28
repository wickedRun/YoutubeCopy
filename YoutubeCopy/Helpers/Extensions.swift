//
//  Extensions.swift
//  YoutubeCopy
//
//  Created by wickedRun on 2022/04/14.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return .init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraints(with format: String, views: UIView...) {
        let viewsDictionary = views.enumerated().reduce(into: [String: UIView]()) { (result, tuple) in
            tuple.element.translatesAutoresizingMaskIntoConstraints = false
            result["v\(tuple.offset)"] = tuple.element
        }

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    // 이미지 캐싱할때 load할 이미지의 url과 인터넷에서 받은 data의 url이 같은지 비교하여 같으면 저장함
    // 이렇게 하는 이유는 dataTask가 비동기로 이루어지기 때문에 잘못 저장될 수도 있다.
    var imageUrlString: String?
    
    func loadImage(using urlString: String) {
        imageUrlString = urlString
        let nsstring = NSString(string: urlString)
        let url = URL(string: urlString)!
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: nsstring) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                
                let imageToCache = UIImage(data: data!)!
                
                if self.imageUrlString == urlString {
                    imageCache.setObject(imageToCache, forKey: nsstring)
                }
                
                self.image = imageToCache
            }
        }.resume()
    }
}
