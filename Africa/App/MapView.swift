//
//  MapView.swift
//  Africa
//
//  Created by Patrick Habib on 8/5/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.00286, longitude: 16.4377599)
        
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 79.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View
    {
        // MARK: Basic Map
        //Map(coordinateRegion: $region)
        
        //Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {item in
            
            //Option A OLD STYLE (always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //Option B NEW STYLE (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //Option C Custom basic annonation (it could be interactive)
//            MapAnnotation(coordinate: item.location)
//            {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }//Annotation
            
            //Option D Complex Map Annotation It Could Be Interactive
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }}
                
        ).overlay(
            HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 12){
            Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3)
                {
                    HStack
                    {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude):")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                        
                    }//HSTACK
                    
                    Divider()
                    
                    HStack
                    {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude):")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                        
                    }//HSTACK
                }//VSTACK
        
            }//HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.black
                            .cornerRadius(8)
                            .opacity(0.6))
            .padding()
            ,alignment: .top
        )
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
