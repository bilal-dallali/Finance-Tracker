//
//  Transaction.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 16/02/2023.
//

import Foundation

class Transaction: Identifiable, ObservableObject, Encodable {
    let id = UUID()
    @Published var label: String
    let amount: Float
    let currency: Currency
    let date: Date
    
    init(label: String, amount: Float, currency: Currency, date: Date) {
        self.label = label
        self.amount = amount
        self.currency = currency
        self.date = date
    }
    
    enum CodingKeys: CodingKey {
        case id
        case label
        case amount
        case currency
        case date
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(label, forKey: .label)
        try container.encode(amount, forKey: .amount)
        try container.encode(currency.rawValue, forKey: .currency)
        try container.encode(date, forKey: .date)
    }
}
