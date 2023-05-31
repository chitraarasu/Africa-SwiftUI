//
//  VideoListView.swift
//  Africa
//
//  Created by kirshi on 4/24/23.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
//    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination:VideoPlayerView(videoSelected: item.id, videoTitle: item.name) ) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }
            }
            .scrollIndicators(.hidden)
//            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
//            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
                ToolbarItem {
                    Button {
                        videos.shuffle()
//                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
