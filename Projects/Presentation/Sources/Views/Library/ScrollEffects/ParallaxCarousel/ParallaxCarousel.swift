//
//  ParallaxCarousel.swift
//  Presentation
//
//  Created by root0 on 2024/02/02.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

struct ParallaxCarousel: View {

    var tripCards: [TripCard] = [
        .init(title: "London", subTitle: "England", image: "Profile 1"),
        .init(title: "New York", subTitle: "U.S.A", image: "Profile 2"),
        .init(title: "Prague", subTitle: "Czech Republic", image: "Profile 3")
    ]

    @State private var searchText: String = ""

    init() {

    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(spacing: 12) {
                    Button {
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title)
                            .foregroundStyle(.blue)
                    }

                    HStack(spacing: 12, content: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)

                        TextField("Search", text: $searchText)
                    })
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial, in: .capsule)

                }

                Text("Where do you want to \ntravel?")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)

                // Carousel
                GeometryReader { proxy in
                    let size = proxy.size

                    tripCardScrollView(size)
                }
                .frame(height: 500)
                .padding(.horizontal, -15)
                .padding(.top, 10)
            }
            .padding(15)
        }

    }

    @ViewBuilder
    func tripCardScrollView(_ size: CGSize) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(tripCards) { card in
                    /// 카드를 역방향 시차 효과로 이동시키기 위해
                    GeometryReader { proxy in
                        let cardSize = proxy.size
                        let minX = proxy.frame(in: .global).minX - 30
                        Image(card.image, bundle: .module)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x: -minX)
                            .frame(width: cardSize.width, height: cardSize.height, alignment: .center)
                            
                            .clipShape(.rect(cornerRadius: 15))
                            .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)

                    }
                    .frame(width: size.width - 60, height: size.height - 50)
                    // scroll animatino
//                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
//                                    view.scaleEffect(phase.isIdentity ? 1 : 0.95)
//                                }

                }
            }
            .padding(.horizontal, 30)
//                        .scrollTargetLayout()
            .frame(height: size.height, alignment: .top)
        }
        .coordinateSpace(name: "Scroll")
//                    .scrollTargetBehavior(.viewAligned)
//                    .scrollIndicators(.hidden)
    }
}

#Preview {
    ParallaxCarousel()
}
