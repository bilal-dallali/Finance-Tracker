//
//  TransactionCell.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 16/02/2023.
//

import SwiftUI

struct TransactionCell: View {
    
    @ObservedObject var transaction: Transaction
    let onDelete: () -> Void
    @State private var isDetailedMode = false
    @State private var isEditingMode = false
    @FocusState private var focusedField: Field?
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy à HH:mm"
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    if isEditingMode {
                        TextField("Repas du midi", text: $transaction.label)
                            .font(.headline)
                            .focused($focusedField, equals: .label)
                    } else {
                        Text(transaction.label)
                            .font(.headline)
                    }
                    
                    Text(dateFormatter.string(from: transaction.date))
                        .font(.footnote)
                        .foregroundColor(Color(white: 0.4))
                }
                Spacer()
                Text("\(String(format: "%.2f", transaction.amount)) \(transaction.currency.rawValue)")
            }
            if isDetailedMode {
                HStack {
                    Button {
                        onDelete()
                    } label: {
                        Text("Supprimer")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                    }
                    Button {
                        isEditingMode = true
                        focusedField = .label
                    } label: {
                        Text("Renommer")
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                    }

                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .onTapGesture {
            withAnimation {
                isDetailedMode.toggle()
            }
        }
    }
    
    private enum Field: Int, Hashable {
        case label
    }
}

struct TransactionCell_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCell(transaction: previewTransactions[0], onDelete: {})
            .previewLayout(.sizeThatFits)
            .padding(24)
            .background(Color("Grey"))
    }
}
