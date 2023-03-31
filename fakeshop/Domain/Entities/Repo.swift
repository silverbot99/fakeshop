//
//  Repo.swift
//  fakeshop
//
//  Created by Admin on 31/03/2023.
//

import Then


struct Repo: Decodable {
    var id: Int?
    var name: String?
    var fullname: String?
    var urlString: String?
    var starCount: Int?
    var folkCount: Int?
    var owner: Owner?
    
    struct Owner: Decodable {
        var avatarUrl: String?
        
        // swiftlint:disable:next nesting
        private enum CodingKeys: String, CodingKey {
            case avatarUrl = "avatar_url"
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, name
        case fullname = "full_name"
        case urlString = "html_url"
        case starCount = "stargazers_count"
        case folkCount = "forks"
        case owner
    }
}


extension Repo: Then, Equatable {
    static func == (lhs: Repo, rhs: Repo) -> Bool {
        return lhs.id == rhs.id
    }
}
