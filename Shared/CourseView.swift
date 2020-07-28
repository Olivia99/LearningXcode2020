//
//  CourseView.swift
//  Design+COde
//
//  Created by Jieying Yang on 7/17/20.
//

import SwiftUI

struct CourseView: View {
    @State var show = false
    @Namespace var namespace
    @State var selectedItem: Course? = nil
    @State var isDisable = false
    
    
    var body: some View{
        ZStack {
            #if os(iOS)
            content
                .navigationBarHidden(true)
            fullContent
                .background(VisualEffectBlur())
                .edgesIgnoringSafeArea(.all)
            #else
            content
            fullContent
                
                    .background(VisualEffectBlur())
                    .edgesIgnoringSafeArea(.all)
            
            #endif
            
            
        }
        .navigationTitle("Course")
        
        
    }
    
    
    var content: some View {
        
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 160), spacing:16)
                ], spacing: 16
            ){
                ForEach(courses) { item in
                    VStack {
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame( height: 250)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    show.toggle()
                                    selectedItem = item
                                    isDisable = true
                                }
                                
                            }
                            .disabled(isDisable)
                    }
                    .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    
                }
                
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
    }
    
    /*
     You typically use ViewBuilder as a parameter attribute for child view-producing closure parameters, allowing those closures to provide multiple child views.
     */
    @ViewBuilder
   
    var fullContent : some View {
        
        if selectedItem != nil {
            ZStack(alignment: .topTrailing)
            {
                /*
                 passing "course" and "namespace" value to CourseDetails
                 */
                CourseDetails(course: selectedItem!, namespace: namespace)
                
                
                CloseButton()
                    .padding(16)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration:0)){
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                                isDisable = false
                            }
                        }
                    }
            }
            .zIndex(2)
            .frame(maxWidth: 712)
            .frame(maxWidth:.infinity)
            
        }
        
    }
    
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
