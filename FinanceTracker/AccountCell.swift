//
//  AccountCell.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 21/12/2022.
//

import SwiftUI

struct AccountCell: View {
    
    let iconName: String
    let name: String
    let amount: Float
    
    var body: some View {
        HStack {
            Image(iconName)
                .resizable()
                .padding(4)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Solde : \(String(format: "%.2f", amount)) €")
                    .font(.footnote)
                    .foregroundColor(Color(white: 0.4))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct AccountCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AccountCell(iconName: "icon_001", name: "Visa", amount: 1234.56)
            AccountCell(iconName: "icon_002", name: "PayPal", amount: 1234.56)
            AccountCell(iconName: "icon_003", name: "Transport", amount: 1234.56)
            AccountCell(iconName: "icon_004", name: "AirBnB", amount: 1234.56)
        }
        .padding()
        .background(Color("Grey"))
        .previewLayout(.sizeThatFits)
    }
}
