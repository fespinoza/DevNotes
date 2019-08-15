import UIKit

/*:

 # How to set the line height of text for label in iOS

 - [question in stack overflow](https://stackoverflow.com/questions/39158604/how-to-increase-line-spacing-in-uilabel-in-swift)

 Sample from **Abstract**:

 ```css
 font-size: 16px;
 font-weight: normal;
 height: 88px;
 line-height: 22px;
 ```
 */

class SampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        let text = "Legg ut en annonse på FINN for å selge, gi bort eller leie ut (nesten) hva som helst."
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        let fullRange = NSRange(location: 0, length: attributedString.length)
        // paragraphStyle.minimumLineHeight = 22.0
        paragraphStyle.lineSpacing = 22.0 - 16.0 // desired lineHeight - font size
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: fullRange)

        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        let label2 = UILabel()
        label2.attributedText = attributedString
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.numberOfLines = 0
        label2.textColor = .black

        view.addSubview(label2)

        NSLayoutConstraint.activate([
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            label2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            label2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
}

// usage
let controller = SampleViewController()

// playground specific
import PlaygroundSupport

PlaygroundPage.current.liveView = controller
