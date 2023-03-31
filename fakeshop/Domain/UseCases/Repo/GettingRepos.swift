//
//  GettingRepos.swift
//  fakeshop
//
//  Created by Admin on 31/03/2023.
//

import Combine

protocol GettingRepos {
    var repoGateway: RepoGatewayType { get set }
}

extension GettingRepos {
    func getRepos(dto: GetPageDto) -> Observable<PagingInfo<Repo>> {
        repoGateway.getRepos(dto: dto)
    }
}
