//
//  ContentView.swift
//  Drawing
//
//  Created by Adam Miller on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    FlowerView()
                } label: {
                    Text("Flower View")
                }
                
                NavigationLink {
                    CircleView()
                } label: {
                    Text("Circle View")
                }
                
                NavigationLink {
                    TrapezoidView()
                } label: {
                    Text("Trapezoid View")
                }
                
                NavigationLink {
                    CheckerboardView()
                } label: {
                    Text("Checkerboard View")
                }
            }
            .navigationTitle("Drawing")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
