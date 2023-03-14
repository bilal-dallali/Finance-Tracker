//
//  Account.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 22/12/2022.
//

import Foundation

class Account: Identifiable, ObservableObject {
    let id = UUID()
    let iconName: String
    let name: String
    let initialAmount: Float
    @Published var transactions: [Transaction]
    let currency: Currency
    var amount: Float {
        initialAmount + transactions.map { $0.amount }.reduce(0, +)
    }
    
    init(iconName: String, name: String, initialAmount: Float, transactions: [Transaction], currency: Currency) {
        self.iconName = iconName
        self.name = name
        self.initialAmount = initialAmount
        self.transactions = transactions
        self.currency = currency
    }
}
