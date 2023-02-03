//
//  Person.swift
//  10_NameToFaces
//
//  Created by Brennan Dumm on 2/2/23.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
