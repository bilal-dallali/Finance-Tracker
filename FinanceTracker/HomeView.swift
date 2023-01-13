//
//  HomeView.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 26/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("Solde total :")
                    Text("\(String(format: "%.2F", previewAccounts.map { $0.amount }.reduce(0, +))) €")
                        .font(.system(size: 32, weight: .bold))
                }
                //.previewAccount.map { $0.amount }.reduce(0, +)
                VStack(alignment: .leading) {
                    Text("Mes comptes")
                        .font(.title2)
                        .bold()
                    if previewAccounts.count > 0 {
                        VStack(spacing: 16) {
                            ForEach(previewAccounts) { account in
                                AccountCell(account: account)
                            }
                        }
                    } else {
                        Text("Ajouter un compte")
                            .padding(32)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(24)
        }
        .background(Color("Grey"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
