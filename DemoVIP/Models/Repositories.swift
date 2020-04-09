//
//  Repositories.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

import Foundation
import UIKit

struct Repository {
    var id: Int
    var name: String
    var description: String
    var fullname: String
    var owner: Owner?
}

extension Repository: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id, name, description, owner
        case fullname = "full_name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? container.decode(Int.self, forKey: .id)) ?? 1
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        self.fullname = (try? container.decode(String.self, forKey: .fullname)) ?? ""
        self.owner = (try? container.decode(Owner.self, forKey: .owner)) ?? nil
    }
}

