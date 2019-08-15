import Foundation

//: # Create a concrete date

let calendar = Calendar.current

let dateComponents = DateComponents(year: 2020, month: 8, day: 29, hour: 12, minute: 30)

let weddingDate = calendar.date(from: dateComponents)!

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full

print(dateFormatter.string(from: weddingDate))


