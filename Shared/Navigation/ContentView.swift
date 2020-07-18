//
//  ContentView.swift
//  Shared
//
//  Created by Jieying Yang on 7/16/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        #if os(iOS)
        Sidebar()
        
        #else
        Sidebar()
            .frame(minWidth: 1000, minHeight: 600)
        #endif
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
           
        }
    }
}
