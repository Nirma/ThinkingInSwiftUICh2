//
//  DetailView.swift
//  ThinkingInSwiftUICh2
//
//  Created by Nicholas Maccharoli on 2020/05/02.
//  Copyright © 2020 Nicholas Maccharoli. All rights reserved.
//

import SwiftUI

struct PhotoDetailView: View {
    var photo: PhotoDatum
    var body: some View {
        List {
            photo.downloadURL.map { url in
                Section {
                    ImageFetcherView(url: url)
                        .frame(height: 200, alignment: .center)
                }
            }
            
            Section {
                Text("Author: \(photo.author)")
                Text("Photo ID: \(photo.id)")
                Text("Width: \(photo.width)")
                Text("Height: \(photo.height)")
                photo.downloadURL.map {
                    Text("Download URL: \($0)")
                }
                photo.url.map {
                    Text("URL: \($0)")
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}
