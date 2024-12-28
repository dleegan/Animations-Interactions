//
//  ReturnableCard.swift
//  Animations Interactions
//
//  Created by dleegan on 27/12/2024.
//

import SwiftUI

struct ReturnableCard: View {
    @State private var isFlipped: Bool = true

    var body: some View {
        VStack(spacing: 50) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 400)
//                .frame(width: 200, height: 300)
                .foregroundColor(.blue)
                .rotation3DEffect(
                    Angle.degrees(isFlipped ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.easeInOut(duration: 1), value: isFlipped)

            Button {
                withAnimation(.easeInOut) {
                    isFlipped.toggle()
                }
            } label: {
                Text("Retourner")
                    .padding()
                    .bold()
                    .frame(width: .infinity)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
    }
}

#Preview {
    ReturnableCard()
}
