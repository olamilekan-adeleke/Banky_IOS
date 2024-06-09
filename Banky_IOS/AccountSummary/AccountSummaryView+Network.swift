//
//  AccountSummaryHeader+Network.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 22/08/2023.
//

import Foundation

// MARK: - Account

struct Account: Codable {
    let id: String
    let type: AccountType
    let name: String
    let amount: Decimal
    let createdDateTime: Date
}

extension AccountSummaryViewController {
    func fetchAccount(forUserID userID: String, completion: @escaping (Result<[Account], NetworkError>) -> Void) {
        guard let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(userID)/accounts") else {
            return completion(.failure(.invaildURL))
        }
        print(url.absoluteString)

        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async { 
                guard let data = data, error == nil else {
                    return completion(.failure(.serverError))
                }

                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601

                    let accounts: [Account] = try jsonDecoder.decode([Account].self, from: data)
                    return completion(.success(accounts))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }

        dataTask.resume()
    }
}
