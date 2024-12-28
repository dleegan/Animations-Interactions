//
//  RemovableCell.swift
//  Animations Interactions
//
//  Created by dleegan on 27/12/2024.
//

import SwiftUI

struct RemovableCell: View {
    @State private var dragOffset = CGSize.zero
    @State private var hideItem: Bool = false
    let name: String = "Preview Name"
    let date: String = "02/06/2014"

    var body: some View {
        VStack(spacing: 30) {
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title3)
                        .bold()
                    Text(date)
                        .font(.callout)
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.white)
                .offset(x: dragOffset.width)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                HStack {
                    Image(systemName: "trash")
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .padding()
                .background(.red)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 3)
            .rotation3DEffect(
                Angle.degrees(hideItem ? 90 : 0),
                axis: (x: 1, y: 0, z: 0))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.translation.width <= 0, value.translation.width >= -200 {
                            dragOffset = value.translation
                        }
                    }.onEnded { value in
                        if value.translation.width <= -190 {
                            withAnimation(.linear(duration: 1)) {
                                dragOffset = CGSize(width: -400, height: 0)
                            }
                            withAnimation(.linear.delay(0.8)) {
                                hideItem = true
                            }
                        } else {
                            withAnimation {
                                dragOffset = .zero
                            }
                        }
                    }
            )

            Button {
                hideItem = false
                dragOffset = .zero
            } label: {
                Text("Reset")
            }
        }
        .padding()
    }
}

#Preview {
    RemovableCell()
        .padding()
}
