//
//  HomeView.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 26/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewAccountScreen = false
    @State private var isShowingFavouriteOnly = false
    @StateObject private var accountsList = AccountsList()
    
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
                        HStack {
                            Text("Mes comptes")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Button {
                                withAnimation {
                                    isShowingFavouriteOnly.toggle()
                                }
                            } label: {
                                Image(systemName: isShowingFavouriteOnly ? "star.fill" : "star")
                                    .foregroundColor(isShowingFavouriteOnly ? .yellow : Color(white: 0.4))
                                    .padding(.trailing)
                            }

                        }
                        if accountsList.accounts.count > 0 {
                            VStack(spacing: 16) {
                                ForEach(accountsList.accounts) { account in
                                    if !isShowingFavouriteOnly || account.isFavourite {
                                        NavigationLink {
                                            AccountDetailView(account: account)
                                                .environmentObject(accountsList)
                                        } label: {
                                            AccountCell(account: account)
                                        }
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
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                AccountsList.save(accounts: accountsList.accounts) { result in
                    if case.failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
            }
        }
        .onAppear {
            AccountsList.load { result in
                switch result {
                case .failure(let error):
                    fatalError(error.localizedDescription)
                    //print("error")
                case .success(let accounts):
                    accountsList.accounts = accounts
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
