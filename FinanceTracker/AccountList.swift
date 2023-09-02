//
//  AccountList.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 16/02/2023.
//

import Foundation

class AccountsList: ObservableObject {
    
    @Published var accounts: [Account]
    
    init(accounts: [Account] = []) {
        self.accounts = accounts
    }
    
    static func save(accounts: [Account], completion: @escaping (Result<Int, Error>) -> Void ) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(accounts)
                let outfile = try fileUrl()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(accounts.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static private func fileUrl() throws -> URL {
        let path = try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        
        let url = path.appendingPathComponent("accounts.data")
        
        print(url)
        
        return url
    }
}
