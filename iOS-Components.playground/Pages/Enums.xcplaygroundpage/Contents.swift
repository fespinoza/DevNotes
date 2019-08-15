import Foundation

enum TestCases: Int {
    case one = 0
    case two
    case three
}


let foo = TestCases.one

String(describing: foo)

