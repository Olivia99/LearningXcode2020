//
//  CloseButton.swift
//  Design+COde
//
//  Created by Jieying Yang on 7/24/20.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
       Image(systemName: "xmark")
        .font(.system(size: 17, weight: .bold))
        .foregroundColor(.white)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .background(Color.black.opacity(0.6))
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
