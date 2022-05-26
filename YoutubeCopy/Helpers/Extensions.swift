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

