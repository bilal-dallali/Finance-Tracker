//
//  MainButton.swift
//  FinanceTracker
//
//  Created by Bilal Dallali on 24/01/2023.
//

import SwiftUI

struct MainButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(.black)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(.infinity)
        }

    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Preview Button", action: {
            print("hello")
        })
        .padding()
    }
}
