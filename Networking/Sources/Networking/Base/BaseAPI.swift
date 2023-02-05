//
//  File.swift
//  
//
//  Created by Ahmed Nasr on 05/02/2023.
//

import Foundation
import Moya

public class BaseAPI<T: TargetType> {
    
    func connectWithServer<M: Decodable>(target: T, completion: @escaping (Result<M?, NSError>) -> Void) {
        
        let provider = MoyaProvider<T>()
        
        provider.request(target) { result in
            
            switch result {
            case .success(let response):
                
                let data = response.data
                do {
                    let json = try JSONDecoder().decode(M.self, from: data)
                    completion(.success(json))
                } catch {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                    completion(.failure(error))
                }
                
            case .failure(_):
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                completion(.failure(error))
            }
        }
    }
}

