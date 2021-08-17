//
//  CoverImageModel.swift
//  Africa
//
//  Created by Patrick Habib on 8/5/21.
//

import SwiftUI
import MapKit

struct NationalParkLocation: Codable, Identifiable
{
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    //Computed Property
    var location: CLLocationCoordinate2D
    {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
