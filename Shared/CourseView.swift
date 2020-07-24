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
            
            if selectedItem != nil {
                ZStack(alignment: .topTrailing)
                {
                    
                    VStack {
                        ScrollView {
                            CourseItem(course: selectedItem!)
                                .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
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
                    .matchedGeometryEffect(id: "container\(selectedItem!.id)", in: namespace)
                    
                    .edgesIgnoringSafeArea(.all)
                    
                    
                    CloseButton()
                        .padding(.trailing, 16)
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
            }
            
        }
        
        
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
