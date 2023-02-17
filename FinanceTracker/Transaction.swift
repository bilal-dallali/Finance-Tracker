//
//  Transaction.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 16/02/2023.
//

import Foundation


struct Transaction: Identifiable {
    let id = UUID()
    let label: String
    let amount: Float
    let currency: Currency
    let date: Date
}
