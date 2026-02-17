//
//  accountSummary+networking.swift
//  Bankey App
//
//  Created by Mustafa Nour on 17/02/2026.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case serverError
    case decodingError
}

public struct Profile: Codable {
    let id: String
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

extension AccountSummaryViewController {
                        // fetching the data using urlSessin and compeletion handeler for handeling errors
    
    func fetchProfile(forUserId userId: String, completion: @escaping (Result<Profile,NetworkError>) -> Void) {
        
        let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(userId)")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            /* because network calls happens asyncoronouslly so we need to put it to work in the main thread,
             and without dispatch -> the network call will runs on the background thread which cause an error
             because the compeletion handeller called on a different GCD queue than the one that created the task so this conflict.
             So the soulotion to back to the main thread .
             
           */
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                
                do {
                    let profile = try JSONDecoder().decode(Profile.self, from: data)
                    completion(.success(profile))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
        
}
