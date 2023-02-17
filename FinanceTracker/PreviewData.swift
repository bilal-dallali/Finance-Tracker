//
//  PreviewData.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 09/01/2023.
//

import Foundation

let previewAccounts =  [
    Account(iconName: "icon_002", name: "PayPal", initialAmount: 163.09, transactions: previewTransactions, currency: .euro),
    Account(iconName: "icon_007", name: "Binance", initialAmount: 3656.54, transactions: previewTransactions, currency: .euro),
    Account(iconName: "icon_001", name: "Bourso", initialAmount: 2465.23, transactions: previewTransactions, currency: .euro),
    //Account(iconName: "icon_003", name: "Transport", amount: 23.53)
]

let previewTransactions = [
    Transaction(label: "Repas du midi", amount: 8.54, currency: .euro, date: Date()),
    Transaction(label: "Tickets de métro", amount: 16.50, currency: .euro, date: Date()),
    Transaction(label: "Loyer", amount: 745, currency: .euro, date: Date())
]
