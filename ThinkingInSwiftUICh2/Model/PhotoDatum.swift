//
//  PhotoDatum.swift
//  ThinkingInSwiftUICh2
//
//  Created by Nicholas Maccharoli on 2020/05/04.
//  Copyright © 2020 Nicholas Maccharoli. All rights reserved.
//

import Foundation

struct PhotoDatum: Decodable, Hashable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: URL?
    let downloadURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case width
        case height
        case url
        case downloadURL = "download_url"
    }
}
