//
//  VideoModel.swift
//  Africa
//
//  Created by kirshi on 5/1/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
