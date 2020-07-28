//
//  CourseDetails.swift
//  Design+COde
//
//  Created by Jieying Yang on 7/27/20.
//

import SwiftUI

struct CourseDetails: View {
    var course:Course = courses[0]
    var namespace: Namespace.ID
    
    #if os(iOS)
    var cornerRadius: CGFloat = 22
    #else
    var cornerRadius: CGFloat = 0
    #endif
    
    var body: some View {
      
        #if os(iOS)
        content
        .edgesIgnoringSafeArea(.all)
        #else
        content
        #endif
    }
    
    var content: some View{
        VStack {
            ScrollView {
                CourseItem(course: course, cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height:300)
                
                
                VStack {
                    ForEach(courseSections) { item in
                        /*
                         pass course data to component "CourseRow"
                         */
                        CourseRow(item: item)
                        Divider()
                    }
                }
                .padding()
                
            }
            
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
    }
}

struct CourseDetails_Previews: PreviewProvider {
    /*
     because "course" has a defult value of courses[0], so you don't need to declare it here. However, you do need to declear "namespace since it doesn't have deful value.
     */
    @Namespace static var namespace
    
    static var previews: some View {
        CourseDetails(namespace: namespace)
    }
}
