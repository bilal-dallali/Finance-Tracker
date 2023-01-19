//
//  CurrencySelector.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 19/01/2023.
//

import SwiftUI

struct CurrencySelector: View {
    
    private let currencies = Currency.allCases
    @State private var selectedCurrency: Currency = .euro
    @State var isSelectedMode = false
    
    var body: some View {
        HStack {
            ForEach(currencies.indices) { index in
                Image(systemName: selectedCurrency == currencies[index] ? currencies[index].filledIconName : currencies[index].iconName)
                    .font(.system(size: 32))
            }
        }
    }
}

struct CurrencySelector_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelector()
    }
}
