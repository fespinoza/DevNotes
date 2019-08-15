import UIKit

// UIButton + Images + Rounded Corners + Bigger Tappable Area

class SampleViewController: UIViewController {
    let button = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        let closeImage = UIImage(named: "closeButton2")

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(closeImage, for: .normal)
        button.backgroundColor = .red
        button.contentEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        button.addTarget(self, action: #selector(handleTap(sender:)), for: .touchUpInside)

        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.layer.cornerRadius = button.bounds.width / 2.0
    }

    @objc func handleTap(sender: UIButton) {
        print("Tap!")
    }
}

// usage
let controller = SampleViewController()

// playground specific
import PlaygroundSupport

PlaygroundPage.current.liveView = controller
