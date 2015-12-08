//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Abdelrahman Mohamed on 12/2/15.
//  Copyright © 2015 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {

    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl : NSURL , title : String) {
        super.init()
        self.filePathUrl = filePathUrl
        self.title = title
    }
}