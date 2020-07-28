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
    
    var body: some View {
        VStack {
            ScrollView {
                CourseItem(course: course)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height:300)
                
                
                VStack {
                    ForEach(0 ..< 20) { item in
                        CourseRow()
                    }
                }
                .padding()
                
            }
            
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
        
        .edgesIgnoringSafeArea(.all)
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
