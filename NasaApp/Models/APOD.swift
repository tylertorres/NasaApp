//
//  APOD.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import Foundation

struct APOD: Codable {
    
    let title: String
    let url: String
    let explanation: String
    let copyright: String?
    let date: String?
    let hdUrl: String?
    let mediaType: String?
    let serviceVersion: String?
    
    enum CodingKeys: String, CodingKey {
        case title, url, explanation, copyright, date
        case hdUrl = "hdurl"
        case mediaType = "media_type"
        case serviceVersion = "service_version"
    }
}
