//
//  CourseList.swift
//  Design+COde
//
//  Created by Jieying Yang on 7/17/20.
//

import SwiftUI

struct CourseList: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
       content
        .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth: 800, minHeight:600)
        #endif
    }
    
    var content: some View{
        List(0 ..< 5) { item in
            CourseRow()
        }
        
        .navigationTitle("Course")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
