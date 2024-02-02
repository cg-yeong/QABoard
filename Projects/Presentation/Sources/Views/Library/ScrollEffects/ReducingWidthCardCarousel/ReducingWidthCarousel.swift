//
//  MyLibrary.swift
//  Presentation
//
//  Created by root0 on 2024/02/02.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

struct ReducingWidthCardCarousel: View {
    @State private var cards: [Card] = [
        .init(image: "Profile 1"),
        .init(image: "Profile 2"),
        .init(image: "Profile 3"),
        .init(image: "Profile 4"),
        .init(image: "Profile 5"),
        .init(image: "Profile 6"),
        .init(image: "Profile 7"),
        .init(image: "Profile 8")
    ]
    var body: some View {
        VStack {
            GeometryReader {
                let size = $0.size
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10, content: {
                        ForEach(cards) { card in
                            makeCardView(card)
                        }
                    })
                    .padding(.trailing, size.width - 180)
//                    .scrollTargetLayout()
                }
//                .scrollTargetBehavior(.viewAligned)
                //            .scrollIndicators(.hidden)
                .clipShape(.rect(cornerRadius: 25))
            }
            .padding(.horizontal, 15)
            .padding(.top, 30)
            .frame(height: 210)

            Spacer(minLength: 0)
        }
    }

    @ViewBuilder
    func makeCardView(_ card: Card) -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            let minX = proxy.frame(in: .global).minX
            /// 190: 180 - Card Width; 10 - spacing
            let reducingWidth = (minX / 190) * 130
            let cappedWidth = min(reducingWidth, 130)

            let frameWidth = size.width - (minX > 0 ? cappedWidth : -cappedWidth)

            Image(card.image, bundle: .module)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .frame(width: frameWidth < 0 ? 0 : frameWidth)
                .clipShape(.rect(cornerRadius: 25))
                .offset(x: minX > 0 ? 0 : -cappedWidth)
                .offset(x: -card.previousOffset)
        }
        .frame(width: 180, height: 200)
        .offSetX { offset in
            let reducingWidth = (offset / 190) * 130
            let index = cards.indexOf(card)

            if cards.indices.contains(index + 1) {
                cards[index + 1].previousOffset = (offset < 0 ? 0 : reducingWidth)
            }
        }
    }

}

#Preview {
    ReducingWidthCardCarousel()
}
