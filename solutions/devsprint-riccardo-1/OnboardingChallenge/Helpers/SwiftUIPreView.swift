//
//  SwiftUIPreView.swift
//  OnboardingChallenge
//
//  Created by Riccardo Cipolleschi on 10/12/21.
//

import Foundation

#if DEBUG
import SwiftUI

struct SwiftUIPreView<V>: UIViewRepresentable where V: UIView {
    
    let viewFactory: (Context) -> V
    
    func makeUIView(context: Context) -> V {
        return viewFactory(context)
    }
    
    func updateUIView(_ uiView: V, context: Context) {
        
    }
}
#endif
