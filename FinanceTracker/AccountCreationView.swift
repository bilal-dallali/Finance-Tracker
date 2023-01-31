//
//  AccountCreationView.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 22/01/2023.
//

import SwiftUI

struct AccountCreationView: View {
    
    @State private var accountName: String = ""
    @State private var amount: String = ""
    @State private var selectedCurrency: Currency = .euro
    @State private var selectedIcon: String = "icon_001"
    
    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: 16) {
                Text(accountName == "" ? "Nouveau compte" : accountName)
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top, 32)
                Text("Solde : \( String(format: "%.2f", Float(amount) ?? 0))")
                    .font(.system(size: 20, weight: .light))
                    .foregroundColor(Color(white: 0.4))
            }
            VStack(alignment: .leading) {
                Text("Nom")
                    .font(.title2)
                    .fontWeight(.bold)
                TextField("Ex : Paypal...", text: $accountName)
                    .padding(12)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .cornerRadius(.infinity)
            }
            VStack(alignment: .leading) {
                Text("Icône")
                    .font(.title2)
                    .fontWeight(.bold)
                IconSelector(selectedIcon: $selectedIcon)
                    .padding(.horizontal, -16)
            }
            VStack(alignment: .leading) {
                Text("Solde initial")
                    .font(.title2)
                    .fontWeight(.bold)
                HStack {
                    TextField("Ex : 486,73 \(selectedCurrency.rawValue)", text: $amount)
                        .padding(12)
                        .padding(.horizontal, 12)
                        .keyboardType(.numbersAndPunctuation)
                        .submitLabel(.done)
                    CurrencySelector(selectedCurrency: $selectedCurrency)
                        .foregroundColor(Color("Purple"))
                        .padding(4)
                }
                .background(Color.white)
                .cornerRadius(.infinity)
            }
            Spacer()
            MainButton(title: "Créer") {
                //
            }
        }
        .padding()
        .background(Color("Grey"))
    }
}

struct AccountCreationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountCreationView()
    }
}
