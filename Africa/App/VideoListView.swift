//
//  VideoListView.swift
//  Africa
//
//  Created by Patrick Habib on 8/5/21.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View
    {
        NavigationView
        {
            List
            {
                ForEach(videos) { item in
                    NavigationLink(
                        destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)){
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }
            }//List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar
            {
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    Button(action:{
                        //Shuffle Videos
                        videos.shuffle()
                        
                        hapticImpact.impactOccurred()
                        
                    })
                    {
                        
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }//NavigationView
        
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView().previewDevice("iPhone 11 Pro")
    }
}
