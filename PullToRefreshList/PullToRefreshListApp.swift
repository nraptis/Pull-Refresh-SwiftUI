//
//  PullToRefreshListApp.swift
//  PullToRefreshList
//
//  Created by Nick Raptis on 8/27/22.
//

import SwiftUI

@main
struct PullToRefreshListApp: App {
    
    @StateObject var viewModel = DemoViewModel()
    
    var body: some Scene {
        WindowGroup {
            DemoView(viewModel: viewModel)
        }
    }
}
