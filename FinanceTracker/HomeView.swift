//
//  HomeView.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 26/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPresentingNewAccountScreen = false
    @StateObject private var accountsList = AccountsList(accounts: previewAccounts)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 32) {
                    VStack(spacing: 8) {
                        Text("Solde total :")
                        Text("\(String(format: "%.2F", accountsList.accounts.map { $0.amount }.reduce(0, +))) €")
                            .font(.system(size: 32, weight: .bold))
                    }
                    .frame(maxWidth: .infinity)
                    
                    AccentButton(title: "+ account", color: Color("Orange")) {
                        isPresentingNewAccountScreen = true
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Mes comptes")
                            .font(.title2)
                            .bold()
                        if previewAccounts.count > 0 {
                            VStack(spacing: 16) {
                                ForEach(accountsList.accounts) { account in
                                    NavigationLink {
                                        AccountDetailView(account: account)
                                    } label: {
                                        AccountCell(account: account)
                                    }
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
            .sheet(isPresented: $isPresentingNewAccountScreen) {
                AccountCreationView { newAccount in
                    accountsList.accounts.append(newAccount)
                }
            }
        }
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
