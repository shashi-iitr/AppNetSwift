//
//  Model.swift
//  AppNet
//
//  Created by shashi kumar on 04/05/15.
//  Copyright (c) 2015 shashi kumar. All rights reserved.
//

import Foundation

class Model {
    
    var text = ""
    var name = ""
    var sourceUrl = ""
    var imageUrl = ""
    var createdAt = ""
    
    init(name: String, text: String, sourceUrl: String, imageUrl: String, createdAt: String) {
        self.name = name
        self.text = text
        self.sourceUrl = sourceUrl
        self.imageUrl = imageUrl
        self.createdAt = createdAt
    }
}