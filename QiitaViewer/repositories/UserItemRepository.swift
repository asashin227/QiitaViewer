//
//  UserItemRepository.swift
//  QiitaRepository
//
//  Created by Asakura  Shinsuke on 2020/02/27.
//  Copyright © 2020 Asakura  Shinsuke. All rights reserved.
//

import QiitaRepository
import Foundation

protocol UserItemRepository {
    var result: [Item] { get set }
    var error: Error? { get set }
    func getItems(userId: String, page: Int, parPage: Int)
}

final class UserItemRepositoryImpl: UserItemRepository, ObservableObject {
    
    @Published var result: [Item] = []
    @Published var error: Error? = nil
    
    func getItems(userId: String, page: Int, parPage: Int) {
        GetUserItem(userId: userId, page: page, parPage: parPage).start {  (result: Result<[UserItem], Error>) in
            switch result {
            case .success(let item):
                let items = ItemConverter.converts(userItems: item)
                DispatchQueue.main.async {
                    self.result = items
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        }
    }
}
