//
//  ImageFetcher.swift
//  ThinkingInSwiftUICh2
//
//  Created by Nicholas Maccharoli on 2020/05/04.
//  Copyright © 2020 Nicholas Maccharoli. All rights reserved.
//

import Foundation
import Combine

class ImageFetcher: ObservableObject {
    @Published var imageData: Data?
    
    private var cancellable: AnyCancellable?
    
    func fetch(url: URL?) {
        guard let url = url else { return }
        cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data.isEmpty ? nil : $0.data }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.imageData, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
