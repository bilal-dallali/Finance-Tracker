//
//  AccountSelectorMenu.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 22/02/2023.
//

import SwiftUI

struct AccountSelectorMenu: View {
    
    let accountList: AccountsList
    @Binding var selectedAccountIndex: Int
    let onCreateAccountButtonPressed:() -> Void
    @State private var isShowingAccountsList: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                HStack {
                    Text(accountList.accounts[selectedAccountIndex].name)
                    Text("(\(String(format: "%.2f", accountList.accounts[selectedAccountIndex].amount))\(accountList.accounts[selectedAccountIndex].currency.rawValue))")
                }
                .padding(12)
                .padding(.horizontal, 12)
                Spacer()
                Button {
                    withAnimation {
                        isShowingAccountsList.toggle()
                    }
                } label: {
                    Image(systemName: isShowingAccountsList ? "multiply.circle" : "ellipsis.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(Color("Purple"))
                        .padding(4)
                }
            }
            if isShowingAccountsList {
                ForEach(accountList.accounts) { account in
                    if accountList.accounts[selectedAccountIndex].id != account.id
                    {
                        Divider()
                        HStack {
                            Text(account.name)
                                .foregroundColor(.black)
                            Text("(\(String(format: "%.2f", account.amount))\(account.currency.rawValue))")
                        }
                        .padding(12)
                        .padding(.horizontal, 12)
                        .onTapGesture {
                            selectedAccountIndex = accountList.accounts.firstIndex { $0.id == account.id }!
                            withAnimation {
                                isShowingAccountsList = false
                            }
                        }
                    }
                }
                Divider()
                Button {
                    onCreateAccountButtonPressed()
                } label: {
                    Text("Créer un compte")
                        .foregroundColor(Color("Purple"))
                        .padding(12)
                        .padding(.horizontal, 12)
                }

            }
        }
        .background(Color.white)
        .cornerRadius(22)
    }
}

struct AccountSelectorMenu_Previews: PreviewProvider {
    static var previews: some View {
        AccountSelectorMenu(
            accountList: AccountsList(accounts: previewAccounts),
            selectedAccountIndex: .constant(0),
            onCreateAccountButtonPressed: {}
        )
        .padding()
        .background(Color("Grey"))
        .previewLayout(.sizeThatFits)
    }
}
