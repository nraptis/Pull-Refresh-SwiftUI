//
//  DemoViewModel.swift
//  PullRefresh
//
//  Created by Nicholas Raptis on 8/15/22.
//

import SwiftUI

class DemoViewModel: ObservableObject {
    
    private var model = DemoModel()
    
    var data: [ListItemModel] {
        return model.data
    }
    
    // MARK: - Intent(s)
    
    func fetchDataAsync() async {
        let t = Task.detached {
            self.fetchDataAsyncInline()
        }
        _ = await t.result
        await MainActor.run {
            self.objectWillChange.send()
        }
    }
    
    private func fetchDataAsyncInline() {
        let g = DispatchGroup()
        g.enter()
        model.fetchData {
            g.leave()
        }
        g.wait()
    }
}
