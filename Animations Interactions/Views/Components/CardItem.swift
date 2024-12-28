//
//  CardItem.swift
//  Animations Interactions
//
//  Created by dleegan on 28/12/2024.
//

import SwiftUI

struct CardItem: View {
    var image: Image? = nil
    var title: String? = ""
    var description: String? = ""

    var body: some View {
        VStack(spacing: 20) {
            if image != nil {
                image
                    .frame(width: 250, height: 250)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10)
                    )
            }

            if let title {
                Text(title)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
            }

            if let description {
                Text(description)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .padding(.horizontal, 20)
        .frame(height: 450)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 10)
        )
        .shadow(radius: 15)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack {
        CardItem(
            image: Image(systemName: "Test"),
            title: "Preview title with image",
            description: "This is a preview description for the card"
        )
    }
    .padding()
}
