//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation
import Moya

public enum HomeTarget {
    case users
    case albums(userId: Int)
    case albumPhotos(albumId: Int)
}

extension HomeTarget: TargetType {
    public var baseURL: URL {
        return EndPoints.baseURL.url
    }
    
    public var path: String {
        switch self {
        case .users:
            return "/users"
        case .albums:
            return "/albums"
        case .albumPhotos:
            return "/photos"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .users:
            return .requestPlain
        case .albums(userId: let userId):
            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.default)
        case .albumPhotos(albumId: let albumId):
            return .requestParameters(parameters: ["albumId": albumId], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Typer": "application/json"]
    }
}
