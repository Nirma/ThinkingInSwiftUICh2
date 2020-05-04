//
//  ContentView.swift
//  ThinkingInSwiftUICh2
//
//  Created by Nicholas Maccharoli on 2020/04/27.
//  Copyright © 2020 Nicholas Maccharoli. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var remote = Remote<PhotoDatum>(url: URL(string: "https://picsum.photos/v2/list")!)
    
    var body: some View {
        NavigationView {
            List {
                remote.photos.map {
                    ForEach($0, id: \.self) { item in
                        NavigationLink(destination: PhotoDetailView(photo: item)) {
                            Text(item.author)
                        }
                    }
                }
            }
        }
        .onAppear { self.remote.load() }
        .onDisappear { self.remote.cancel() }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
