//
//  Remote.swift
//  ThinkingInSwiftUICh2
//
//  Created by Nicholas Maccharoli on 2020/04/27.
//  Copyright © 2020 Nicholas Maccharoli. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

final class Remote<Item: Decodable & Hashable>: ObservableObject {
    @Published var photos: [Item]?
    
    private let url: URL
    private var myCancel: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    func cancel() {
        myCancel?.cancel()
    }
    
    func load() {
       myCancel = URLSession.shared.dataTaskPublisher(for: url)
            .map {
                try? JSONDecoder().decode([Item].self, from: $0.data)
        }
       .receive(on: DispatchQueue.main)
       .replaceError(with: nil)
       .assign(to: \.photos, on: self)
    }
}
