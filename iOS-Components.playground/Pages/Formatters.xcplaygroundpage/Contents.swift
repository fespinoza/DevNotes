//: [Previous](@previous)

import Foundation

let price = 20000.0
let stringDate = "2019-07-03T23:43:32.9108+02:00"

let priceFormatter = NumberFormatter()
//priceFormatter.format = "#"
priceFormatter.usesSignificantDigits = true
priceFormatter.numberStyle = .currency
priceFormatter.string(for: price)

//let customPriceFormatter = Formatter()


// A date formatter that uses milliseconds as well
let dateFormatter = DateFormatter()
dateFormatter.locale = Locale(identifier: "en_US_POSIX")
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
if let date = dateFormatter.date(from: stringDate) {
    print(date)
}

// Number Formatter \d\d.\d\d
let sample = 3.0000000000000004
let norwegianPriceFormatter = NumberFormatter()
norwegianPriceFormatter.numberStyle = .decimal
norwegianPriceFormatter.maximumFractionDigits = 2
norwegianPriceFormatter.minimumFractionDigits = 2
norwegianPriceFormatter.decimalSeparator = "."
norwegianPriceFormatter.string(for: sample)
