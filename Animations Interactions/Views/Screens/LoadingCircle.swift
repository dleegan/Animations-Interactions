//
//  LoadingCircle.swift
//  Animations Interactions
//
//  Created by dleegan on 27/12/2024.
//

import SwiftUI

struct LoadingCircle: View {
    @State private var rotationAngle: Double = 0

    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.30)
                .stroke(style:
                    StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round
                    )
                )
                .frame(width: 50, height: 50)
                .rotationEffect(Angle.degrees(rotationAngle))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: false)) {
                        rotationAngle = 360
                    }
                }
        }
    }
}

#Preview {
    LoadingCircle()
}
