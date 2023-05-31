//
//  CoverImageView.swift
//  Africa
//
//  Created by kirshi on 4/24/23.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImage: [CoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImage) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
    }
}
