//
//  ServiceError.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import Foundation

public enum ServiceError: Error {

    case undecodable
    case invalidToken
    case internalServerError
    case badRequest
    case invalidInfo(String)
    case unauthorized
    case conflict(String)
    case notFound(String)
    case custom(String)
    case empty
    case invalidUrl
    case invalidImageUrl
    case invalidLocalImageUrl

}
