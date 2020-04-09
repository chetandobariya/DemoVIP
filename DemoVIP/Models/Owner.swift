//
//  Owner.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

import Foundation
import UIKit

struct Owner {
    var id: Int
    var url: String
    var reposUrl: String
    var avatarUrl: String
    var siteAdmin: Bool
}

extension Owner: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id, url
        case reposUrl = "repos_url"
        case avatarUrl = "avatar_url"
        case siteAdmin = "site_admin"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? container.decode(Int.self, forKey: .id)) ?? 1
        self.url = (try? container.decode(String.self, forKey: .url)) ?? ""
        self.avatarUrl = (try? container.decode(String.self, forKey: .avatarUrl)) ?? ""
        self.reposUrl = (try? container.decode(String.self, forKey: .reposUrl)) ?? ""
        self.siteAdmin = (try? container.decode(Bool.self, forKey: .siteAdmin)) ?? false
    }
}

