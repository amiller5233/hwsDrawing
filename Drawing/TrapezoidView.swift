//
//  TrapezoidView.swift
//  Drawing
//
//  Created by Adam Miller on 7/24/23.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct TrapezoidView: View {
    @State private var insetAmount = 50.0
    
    var body: some View {
        VStack {
            Trapezoid(insetAmount: insetAmount)
                .fill(.purple)
                .frame(width: 200, height: 100)
                .onTapGesture {
                    withAnimation {
                        insetAmount = Double.random(in: 10...90)
                    }
                }
            
            Text("\(insetAmount)")
        }
        .navigationTitle("Trapezoid View")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TrapezoidView_Previews: PreviewProvider {
    static var previews: some View {
        TrapezoidView()
    }
}
