//
//  DemoModel.swift
//  PullRefresh
//
//  Created by Nicholas Raptis on 8/15/22.
//

import Foundation

class DemoModel {
    
    init() {
        makeData()
    }
    
    var data = [ListItemModel]()
    
    private func makeWord(_ minLength: Int, _ maxLength: Int) -> String {
        let length = Int.random(in: minLength...maxLength)
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var resultArray = [Character]()
        for _ in 0..<length {
            if let letter = letters.randomElement() {
                resultArray.append(letter)
            }
        }
        return String(resultArray)
    }
    
    private func makeSentence() -> String {
        var length = Int.random(in: 4...10)
        if Bool.random() {
            length += Int.random(in: 12...30)
        }
        var result = ""
        for i in 0..<length {
            result += makeWord(2, 8)
            if i < (length - 1) { result += " " }
        }
        return result
    }
    
    private var startId = 0
    
    private func makeData() {
        var count = Int.random(in: 4...8)
        if Bool.random() {
            count += Int.random(in: 6...20)
        }
        if Bool.random() {
            count += Int.random(in: 6...20)
        }
        data.removeAll()
        for i in 0..<count {
            let sentence = makeSentence()
            data.append(ListItemModel(id: startId + i, text: sentence))
        }
        startId += (count + 100)
    }
    
    let workerQueue = DispatchQueue(label: "worker.queue",
                                    qos: .default,
                                    attributes: DispatchQueue.Attributes.concurrent,
                                    autoreleaseFrequency: .inherit,
                                    target: nil)
    
    // This simulates a fetch using some type of
    // network or data-transfer protocol
    func fetchData(_ completion: @escaping () -> Void) {
        workerQueue.async {
            self.fetchDataSynchronously()
            completion()
        }
    }
    
    func fetchDataSynchronously() {
        print("fetchDataSynchronously BEGIN(mt: \(Thread.isMainThread))")
        sleep(1)
        if Bool.random() { sleep(1) }
        self.makeData()
        print("fetchDataSynchronously FINISHED(mt: \(Thread.isMainThread))")
    }
}
