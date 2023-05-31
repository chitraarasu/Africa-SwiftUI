//
//  GalleryView.swift
//  Africa
//
//  Created by kirshi on 4/24/23.
//

import SwiftUI

struct GalleryView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State var selectedImage: String = "lion"
    
    @State var gridLayout: [GridItem] = [GridItem()]
    @State var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center
                   , spacing: 30){
                
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                Slider(value: $gridColumn, in: 2...4, step: 1).onChange(of: gridColumn) { newValue in
                    gridSwitch()
                }
                
                LazyVGrid(
                    columns: gridLayout,
                    alignment: .center,
                    spacing: 10
                ) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedImage = animal.image
                            }
                    }
                }
                .animation(.easeIn)
            }
                   .padding(.horizontal, 10)
                   .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
        .onAppear {
            gridSwitch()
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
