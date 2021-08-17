//
//  CoverImageModel.swift
//  Africa
//
//  Created by Patrick Habib on 8/5/21.
//

import SwiftUI

struct Video: Codable, Identifiable
{
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail: String
    {
        "video-\(id)"
    }
}
