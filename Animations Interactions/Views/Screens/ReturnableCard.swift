//
//  ReturnableCard.swift
//  Animations Interactions
//
//  Created by dleegan on 27/12/2024.
//

import SwiftUI

struct ReturnableCard: View {
    @State private var isFlipped: Bool = true
    @State private var showResponse: Bool = true

    var body: some View {
        VStack(spacing: 50) {
            ZStack {
                CardItem(
                    image: Image(systemName: "Test"),
                    title: "Preview title with image",
                    description: "This is a preview description for the card"
                )
                .rotation3DEffect(
                    Angle.degrees(180),
                    axis: (x: 0, y: 1, z: 0)
                )
                .opacity(showResponse ? 0.0 : 1)

                CardItem(
                    title: "Question",
                    description: "This is a preview description for the card"
                )
                .opacity(showResponse ? 1.0 : 0.0)
            }
            .rotation3DEffect(
                Angle.degrees(isFlipped ? 0 : 180),
                axis: (x: 0, y: 1, z: 0)
            )

            Button {
                withAnimation(.linear(duration: 1)) {
                    isFlipped.toggle()
                }
                withAnimation(.linear(duration: 0.01).delay(0.5)) {
                    showResponse.toggle()
                }
            } label: {
                Text("Retourner")
                    .padding()
                    .bold()
                    .frame(maxWidth: .infinity)
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
