//
//  Account.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 22/12/2022.
//

import Foundation

class Account: Identifiable, ObservableObject, Encodable {
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
    
    enum CodingKeys: CodingKey {
        case id
        case iconName
        case name
        case initialAmount
        case currency
        case transactions
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(iconName, forKey: .iconName)
        try container.encode(initialAmount, forKey: .initialAmount)
        try container.encode(currency.rawValue, forKey: .currency)
        try container.encode(transactions, forKey: .transactions)
    }
}
