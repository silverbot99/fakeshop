//
//  AppError.swift
//  fakeshop
//
//  Created by Admin on 31/03/2023.
//

import Foundation

enum AppError: LocalizedError {
    case none
    case error(message: String)

    var errorDescription: String? {
        switch self {
        case let .error(message):
            return message
        default:
            return ""
        }
    }
}
