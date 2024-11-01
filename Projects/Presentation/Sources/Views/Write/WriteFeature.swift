//
//  WriteFeature.swift
//  Presentation
//
//  Created by root0 on 2024/02/05.
//  Copyright © 2024 com.raoot0. All rights reserved.
//

import SwiftUI

struct WriteFeature: View {
    var body: some View {

        WriteQuiz(numberOfQuestion: 3)
            .overlay(alignment: .bottomTrailing) {
                Button {

                } label: {
                    Color.pink
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                .padding(.horizontal)
            }


    }
}

#Preview {
    WriteFeature()
}
