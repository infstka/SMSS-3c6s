//
//  Shop.swift
//  LR11
//
//  Created by infstka on 9.05.23.
//

import Foundation
import SwiftUI

struct Shop: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var description: String
    var site: String
    var popularity: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
