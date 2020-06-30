//
//  Response.swift
//  Youtube
//
//  Created by Erdem Koçer on 30.06.2020.
//

import Foundation


struct Response: Decodable {
    
    let items: [Video]?
    
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
