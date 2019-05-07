//
//  Person.swift
//  Project10
//
//  Created by Nick on 2019/5/4.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
