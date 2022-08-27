//
//  DemoCell.swift
//  PullRefresh
//
//  Created by Nicholas Raptis on 8/15/22.
//

import SwiftUI

struct DemoCell: View {
    let model: ListItemModel
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Text(model.text)
                        .lineLimit(6)
                        .font(Font.system(size: 16, weight: .bold))
                        .foregroundColor(.gray)
                        .padding(.vertical, 6.0)
                    Spacer()
                }
            }
            .background(RoundedRectangle(cornerRadius: 12.0).fill().foregroundColor(.indigo))
            .background(RoundedRectangle(cornerRadius: 12.0).stroke(lineWidth: 2.0).foregroundColor(.mint))
        }
    }
}
