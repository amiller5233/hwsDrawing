//
//  CheckerboardView.swift
//  Drawing
//
//  Created by Adam Miller on 7/24/23.
//

import SwiftUI

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)

        // loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

struct CheckerboardView: View {
    
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        VStack {
            Text("Tap me!")
            
            GeometryReader { geometry in
                Checkerboard(rows: rows, columns: columns)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .onTapGesture {
                        withAnimation(.linear(duration: 3)) {
                            rows = 8
                            columns = 16
                        }
                    }
            }
        }
        .navigationTitle("Checkerboard View")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CheckerboardView_Previews: PreviewProvider {
    static var previews: some View {
        CheckerboardView()
    }
}
