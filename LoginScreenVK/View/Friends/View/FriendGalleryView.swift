//
//  FriendGalleryView.swift
//  LoginScreenVK
//
//  Created by Алексей on 10.01.2023.
//

import SwiftUI
import Kingfisher

struct FriendGalleryView: View {
    
    @ObservedObject var viewModel: FriendGalleryViewModel
    
    private let columns: [GridItem] = [
        GridItem.init(.flexible(minimum: 0, maximum: .infinity)),
        GridItem.init(.flexible(minimum: 0, maximum: .infinity)),
        GridItem.init(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, alignment: .center, spacing: 8, pinnedViews: .sectionHeaders)
            {
                ForEach(self.viewModel.photos) { photo in
                    KFImage(photo.findOptimalSize())
                        .cancelOnDisappear(true)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 135, height: 135, alignment: .center)
                }
            }
        }.onAppear(perform: {
            self.viewModel.getPhotos()
        })
            
    }
}
