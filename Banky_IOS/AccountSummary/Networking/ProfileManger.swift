//
//  ProfileManger.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 23/08/2023.
//

import Foundation

protocol ProfileManagable: AnyObject {
    func fetchProfile(forUserId userID: String, completion: @escaping (Result<Profile, NetworkError>) -> Void)
}
