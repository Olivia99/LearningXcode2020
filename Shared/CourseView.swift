//
//  CourseView.swift
//  Design+COde
//
//  Created by Jieying Yang on 7/17/20.
//

import SwiftUI

struct CourseView: View {
    var body: some View {
        List(0 ..< 5) { item in
            CourseRow()
        }
        
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
