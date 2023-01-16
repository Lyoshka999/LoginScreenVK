//
//  NavigationView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI

struct NavigationContent: View {
    
    @State var isLoginComplete = false
    
    var body: some View {
        NavigationView {
            HStack {
                
                ContentWebView(isLoginComplete: $isLoginComplete)
                
                NavigationLink(
                    destination: HeadView(),
                    isActive: self.$isLoginComplete,
                    label: {
                        EmptyView()
                    })
                    
            }
            .navigationBarHidden(true)
        }
    }
}
