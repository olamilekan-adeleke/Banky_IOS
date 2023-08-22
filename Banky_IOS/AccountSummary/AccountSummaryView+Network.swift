//
//  AccountSummaryHeader+Network.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 22/08/2023.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
    case invaildURL
}

struct Profile: Codable {
    let id: String
    let firstName: String
    let lastName: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

extension AccountSummaryHeader {
    private func fetchProfile(forUserId userID: String, completion: @escaping (Result<Profile, NetworkError>) -> Void) {
        guard let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(userID)") else {
            return completion(.failure(.invaildURL))
        }

        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(.serverError))
            }

            do {
                let profileData: Profile = try JSONDecoder().decode(Profile.self, from: data)
                return completion(.success(profileData))
            } catch {
                return completion(.failure(.decodingError))
            }

        }.resume()
    }
}
