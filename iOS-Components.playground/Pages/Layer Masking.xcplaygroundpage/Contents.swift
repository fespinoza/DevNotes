import UIKit

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * .pi / 180
    }
}

class SampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        let rectView = UIView()
        rectView.translatesAutoresizingMaskIntoConstraints = false
        rectView.backgroundColor = .red


        view.addSubview(rectView)

        NSLayoutConstraint.activate([
            rectView.widthAnchor.constraint(equalToConstant: 300),
            rectView.heightAnchor.constraint(equalToConstant: 400),

            rectView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        view.layoutIfNeeded()

        // Creating a mask for another view
        let path = UIBezierPath()
        let rect = rectView.bounds
        let origin = rect.origin
        // between: (0 to 0.5) distance to the rect width center from the curve point
        let curveSoftness: CGFloat = 0.3
        // % of the full rect height that will be visible
        let fullRectProportion: CGFloat = 0.8
        path.move(to: origin)
        path.addLine(to: origin.applying(.init(translationX: rect.width, y: 0)))
        path.addLine(to: origin.applying(.init(translationX: rect.width, y: rect.height * fullRectProportion)))
        path.addCurve(
            to: origin.applying(.init(translationX: rect.width / 2.0, y: rect.height)),
            controlPoint1: origin.applying(.init(translationX: rect.width, y: rect.height * fullRectProportion)),
            controlPoint2: origin.applying(.init(translationX: rect.width * (0.5 + curveSoftness), y: rect.height))
        )
        path.addCurve(
            to: origin.applying(.init(translationX: 0, y: rect.height * fullRectProportion)),
            controlPoint1: origin.applying(.init(translationX: rect.width * (0.5 - curveSoftness), y: rect.height)),
            controlPoint2: origin.applying(.init(translationX: 0, y: rect.height * fullRectProportion))
        )
        path.addLine(to: origin.applying(.init(translationX: 0, y: rect.height * fullRectProportion)))
        path.close()

        let subLayer = CAShapeLayer()
        subLayer.path = path.cgPath

//        rectView.layer.addSublayer(subLayer)
        rectView.layer.mask = subLayer
    }
}

// usage
let controller = SampleViewController()

// playground specific
import PlaygroundSupport

PlaygroundPage.current.liveView = controller

