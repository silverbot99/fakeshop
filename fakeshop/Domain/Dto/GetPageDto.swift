//
//  GetPageDto.swift
//  fakeshop
//
//  Created by Admin on 31/03/2023.
//

import Foundation
import Dto

struct GetPageDto: Dto {
    var page = 1
    var perPage = 10
    var usingCache = false

    var validatedProperties: [ValidatedProperty] {
        return []
    }
}
