//
//  URLImageView.swift
//  ThinkingInSwiftUICh2
//
//  Created by Nicholas Maccharoli on 2020/05/04.
//  Copyright © 2020 Nicholas Maccharoli. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

struct LoadingView: View {
    
    @State var animating = false
    
    let animation = Animation
        .linear(duration: 1.25)
        .repeatForever(autoreverses: false)
    
    var body: some View {
        Image(systemName: "rays")
            .rotationEffect(animating ? Angle.degrees(360) : .zero)
            .onAppear {
                withAnimation(self.animation) {
                    self.animating = true
                }
        }
    }
}

struct ImageFetcherView: View {
    var url: URL
    @ObservedObject private var imageFetcher = ImageFetcher()
    
    var body: some View {
        VStack(alignment: .center) {
            if imageFetcher.imageData == nil {
                LoadingView()
            }
            
            if imageFetcher.imageData != nil {
                Image(uiImage: UIImage(data: imageFetcher.imageData!)!)
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
            }
        }
            
        .onAppear { self.imageFetcher.fetch(url: self.url)}
        .onDisappear { self.imageFetcher.cancel() }
        
        
    }
}
