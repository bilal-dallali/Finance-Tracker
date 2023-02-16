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
}
