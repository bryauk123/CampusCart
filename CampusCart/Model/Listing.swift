//
//  Listing.swift
//  CampusCart
//
//  Created by Sung Jae Ko on 10/2/23.
//

import Foundation


struct Listing: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var description: String
    var price: Int
    
}
