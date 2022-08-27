//
//  DemoView.swift
//  PullRefresh
//
//  Created by Nicholas Raptis on 8/15/22.
//

import SwiftUI

struct DemoView: View {
    
    @ObservedObject var viewModel: DemoViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text("Some Stuff")
                    .font(Font.system(size: 16, weight: .bold))
                    .foregroundColor(.brown)
                    .padding(.all, 12.0)
                Spacer()
            }
            
            List() {
                
                //Note: These do not properly stack without the VStack...
                VStack(spacing: 0) {
                    ForEach(viewModel.data) { item in
                        DemoCell(model: item)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .onAppear() {
                UITableView.appearance().tableFooterView = UIView()
                    UITableView.appearance().separatorStyle = .none
            }
            .refreshable {
                await viewModel.fetchDataAsync()
            }
        }
    }
}
