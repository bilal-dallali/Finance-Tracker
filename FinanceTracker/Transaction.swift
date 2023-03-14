//
//  Transaction.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 16/02/2023.
//

import Foundation


class Transaction: Identifiable, ObservableObject {
    let id = UUID()
    let label: String
    let amount: Float
    let currency: Currency
    let date: Date
    
    init(label: String, amount: Float, currency: Currency, date: Date) {
        self.label = label
        self.amount = amount
        self.currency = currency
        self.date = date
    }
}
