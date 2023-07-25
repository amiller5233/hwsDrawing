//
//  CircleView.swift
//  Drawing
//
//  Created by Adam Miller on 7/24/23.
//

import SwiftUI

struct CircleView: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .navigationTitle("Circle View")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
