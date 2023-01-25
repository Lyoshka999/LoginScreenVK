//
//  LikeView.swift
//  LoginScreenVK
//
//  Created by Алексей on 23.01.2023.
//

import SwiftUI

struct LikeView: View {
    @ObservedObject var viewModel: LikeViewModel
    
    private var nameHeart: String {
        self.viewModel.isLikes ? "heart.fill" : "heart"
    }
    
    @State private var opacity = 1.0
    @State private var degress = 0.0
    
    
    var body: some View {
        HStack {
            Text("\(self.viewModel.countLikes)")
                .rotation3DEffect(Angle(degrees: self.degress),
                                  axis: (
                                    x: CGFloat(10),
                                    y: CGFloat(0),
                                    z: CGFloat(0)))
            Image(systemName: self.nameHeart)
                .foregroundColor(self.viewModel.isLikes ? .red : .none)
                .opacity(self.opacity)
                .onTapGesture {
                    self.viewModel.toggleLike()
                    self.opacity = 0.5
                    withAnimation(.linear(duration: 1)) {
                        self.opacity = 1
                        self.degress = 360
                    }
                    let dispatchTime = DispatchTime.now() + 1
                    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                        self.degress = 0
                    }
                }
        }
        
    }
}
