//
//  CenterModifier.swift
//  Africa
//
//  Created by kirshi on 5/31/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
