//
//  Favourite.swift
//  DoRe
//
//  Created by Praveen Nirmal on 15/1/22.
//

import Foundation
import UIKit

struct Favourite {
    var thumbnail: UIImage
    var title: String
    var album: String
    var artist: String
}


struct Product: Codable {
    var id: String
    var title: String
    var price: String
    var rating: Double
    var description: String
    var images: String
}
