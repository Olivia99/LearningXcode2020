//
//  sidebar.swift
//  Design+COde (iOS)
//
//  Created by Jieying Yang on 7/17/20.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            #if os(iOS)

            content
                .navigationTitle("Learn")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            
            #else
            content
                .frame(minWidth:200, idealWidth:250,maxWidth:300)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle")
                        }
                    }
                }

            #endif
            
            
            CourseView()
        }
        
    }
    
    var content: some View {
        List {
            NavigationLink(destination: CourseList()) {
                Label("Courses", systemImage: "book.closed")
            }
            Label("Tutorials", systemImage: "list.bullet.rectangle")
            Label("Livestreams", systemImage: "tv")
            Label("Certificates", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")
          
            
        }
        .listStyle(SidebarListStyle())
 
        
    }
}

struct sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
