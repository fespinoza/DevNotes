import Foundation

//: ## Splitting arrays in multiple collections of a size
//: - use function `stride`
//: - [stack overflow source](https://stackoverflow.com/questions/26395766/swift-what-is-the-right-way-to-split-up-a-string-resulting-in-a-string-wi/38156873#38156873)

let collection = [1, 2, 3, 4, 5, 6, 7, 8, 9] // odd number of elements
collection.count

let chunkSize = 2
let result = stride(from: 0, to: collection.count, by: chunkSize)

extension Array {
    func chunked(by size: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, self.count)])
        }
    }
}

let arrays = collection.chunked(by: chunkSize)

// dump(arrays)
