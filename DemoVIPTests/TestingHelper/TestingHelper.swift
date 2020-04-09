//
//  TestingHelper.swift
//  DemoVIPTests
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

import Foundation

func sampleOwner(id: Int = 1,
                url: String = "https://api.github.com/users/mojombo",
                reposUrl: String = "https://api.github.com/users/mojombo/repos",
                avatarUrl: String = "https://avatars0.githubusercontent.com/u/1?v=4",
                siteAdmin: Bool = false) -> Owner {
    return Owner (id: id,
                url: url,
                reposUrl: reposUrl,
                avatarUrl: avatarUrl,
                siteAdmin: siteAdmin)
}

func sampleRepository(id: Int = 1,
                name: String = "name",
                description: String = "description",
                fullname: String = "fullname",
                owner: Owner = sampleOwner()) -> Repository {
    return Repository(id: id,
                name: name,
                description: description,
                fullname: fullname,
                owner: owner )
}
