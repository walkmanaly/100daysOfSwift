//
//  Picture.swift
//  MilestoneDay50
//
//  Created by Nick on 2019/5/10.
//  Copyright © 2019 Nick. All rights reserved.
//

import Foundation

class Picture: NSObject {
    var name: String
    var image: String
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
