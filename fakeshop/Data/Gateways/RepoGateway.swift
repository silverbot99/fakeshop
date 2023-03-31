//
//  RepoGateway.swift
//  fakeshop
//
//  Created by Admin on 31/03/2023.
//

import Combine
import Foundation

// Generally gateway is just another abstraction that will hide the actual implementation behind, similarly to the Facade Pattern. It could a Data Store (the Repository pattern), an API gateway, etc.
//All queries to the database should relatively simple like CRUD
protocol RepoGatewayType {
    func getRepos(_ dto: GetPageDto) -> Observable<PagingInfo<Repo>>
}

struct RepoGateway: RepoGatewayType {
    func getRepos(_ dto: GetPageDto) -> Observable<PagingInfo<Repo>> {
        let input = API.GetRepoListInput(dto: dto)
        
        return API.shared.getRepoList(input)
            .map { (output) -> [Repo]? in
                return output.repos
            }
            .replaceNil(with: [])
            .map {PagingInfo(page: dto.page, items: $0)}
            .eraseToAnyPublisher()
    }
}

struct PreviewRepoGateway: RepoGatewayType {
    func getRepos(_ dto: GetPageDto) -> Observable<PagingInfo<Repo>> {
        Future<PagingInfo<Repo>, Error> { promise in
            let request = [
                Repo(id: 0,
                    name: "SwiftUI",
                    fullname: "SwiftUI Framework",
                    urlString: "",
                    starCount: 10,
                    folkCount: 10,
                     owner: Repo.Owner(avatarUrl: ""))
            ]
            
            let page = PagingInfo(page: 1, items: request)
            promise(.success(page))
        }
        .eraseToAnyPublisher()
    }
}
