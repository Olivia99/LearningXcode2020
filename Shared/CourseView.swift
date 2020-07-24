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
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 160), spacing:16)
                    ], spacing: 16
                    
                    
                ){
                    ForEach(courses) { item in
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
                    
                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
            
            if selectedItem != nil {
                ScrollView {
                    CourseItem(course: selectedItem!)
                        .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                        .frame(height:300)
                        .onTapGesture {
                            withAnimation(.spring()){
                                show.toggle()
                                selectedItem = nil
                                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                                    isDisable = false
                                }
                                
                            }
                            
                        }
                    
                    VStack {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                    
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion:  AnyTransition
                            .opacity
                            .animation(Animation.spring().delay(0.3)),
                        removal:  AnyTransition
                            .opacity
                            .animation(.spring()))
                )
                .edgesIgnoringSafeArea(.all)
            }
            
        }
        
        
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
