//
//  Account.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 22/12/2022.
//

import Foundation

class Account: Identifiable, ObservableObject, Codable {
    
    var id = UUID()
    let iconName: String
    let name: String
    let initialAmount: Float
    @Published var transactions: [Transaction]
    let currency: Currency
    var amount: Float {
        initialAmount + transactions.map { $0.amount }.reduce(0, +)
    }
    
    enum CodingKeys: CodingKey {
        case id
        case iconName
        case name
        case initialAmount
        case currency
        case transactions
    }
    
    init(iconName: String, name: String, initialAmount: Float, transactions: [Transaction], currency: Currency) {
        self.iconName = iconName
        self.name = name
        self.initialAmount = initialAmount
        self.transactions = transactions
        self.currency = currency
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.iconName = try container.decode(String.self, forKey: .iconName)
        self.initialAmount = try container.decode(Float.self, forKey: .initialAmount)
        self.currency = try container.decode(Currency.self, forKey: .currency)
        self.transactions = try container.decode([Transaction].self, forKey: .transactions)
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
