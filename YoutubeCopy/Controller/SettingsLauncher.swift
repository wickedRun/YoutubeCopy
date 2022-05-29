//
//  File.swift
//  YoutubeCopy
//
//  Created by wickedRun on 2022/05/29.
//

import UIKit

// TODO: 바텀시트 재구현 UISheetPresentationController
// iOS 9에서는 이렇게 바텀시트를 구현했지만 지금은 UISheetPresentationController를 사용해서 다시 구현해보자
// 혹은 Action Sheet로.
// 그렇게하면 deprecate된 keyWindow도 접근을 하지 않아도 될듯하다.

class SettingsLauncher: NSObject {
    
    let blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    func showSettings() {
        // show menu
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            
            window.addSubview(collectionView)
            
            let height: CGFloat = 200
            let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 200)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(
                    x: 0,
                    y: y,
                    width: self.collectionView.frame.width,
                    height: self.collectionView.frame.height
                )
            }
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(
                    x: 0,
                    y: window.frame.height,
                    width: self.collectionView.frame.width,
                    height: self.collectionView.frame.height
                )
            }
        }
    }
}
