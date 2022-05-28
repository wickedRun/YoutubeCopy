//
//  Video.swift
//  YoutubeCopy
//
//  Created by wickedRun on 2022/05/26.
//

import UIKit

class Video: NSObject {
     
    var title: String?
    var thumbnailImageName: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
    var duration: Int?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
