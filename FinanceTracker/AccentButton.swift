//
//  AccentButton.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 31/01/2023.
//

import SwiftUI

struct AccentButton: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.black)
                .font(.callout)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(8)
                .background(color)
                .cornerRadius(10)
        }
    }
}

struct AccentButton_Previews: PreviewProvider {
    static var previews: some View {
        AccentButton(title: "Test Button", color: Color("Orange"), action: {})
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
