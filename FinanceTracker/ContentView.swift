//
//  HomeView.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 26/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            AccountCell(account:
                        Account(iconName: "icon_001", name: "Boursorama", amount: 2465.23)
            )
            AccountCell(account:
                        Account(iconName: "icon_002", name: "PayPal", amount: 163.09)
            )
            AccountCell(account:
                        Account(iconName: "icon_003", name: "Transport", amount: 23.53)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
