//
//  ServiceResult.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import Foundation

public typealias ServiceResult<T> = (data: Data, result: Result<T, ServiceError>)
