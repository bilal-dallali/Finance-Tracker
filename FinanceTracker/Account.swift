//
//  Account.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 22/12/2022.
//

import Foundation

struct Account: Identifiable {
    let id = UUID()
    let iconName: String
    let name: String
    let amount: Float
}
