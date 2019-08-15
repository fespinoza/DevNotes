import UIKit
import PlaygroundSupport

struct SampleData {
    let title: String
    let color: UIColor
}

class SampleCollectionViewCell: UICollectionViewCell {
    static let identifier = "SampleCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    let titleLabel = UILabel()

    private func setup() {
        // This is strangely important in Playgrounds!!
        backgroundColor = .clear

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

class SampleViewController: UICollectionViewController {
    let data: [SampleData] = [
        SampleData(title: "Hello World", color: .blue),
        SampleData(title: "Foo Bar", color: .red),
        SampleData(title: "Asdf", color: .green),
        SampleData(title: "Hello World", color: .blue),
        SampleData(title: "Foo Bar", color: .red),
        SampleData(title: "Asdf", color: .green),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(SampleCollectionViewCell.self, forCellWithReuseIdentifier: SampleCollectionViewCell.identifier)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PlayCell")

        collectionView?.backgroundColor = .lightGray
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SampleCollectionViewCell.identifier, for: indexPath)
        let model = data[indexPath.row]

        if let cell = cell as? SampleCollectionViewCell {
            cell.titleLabel.text = model.title
        }

        cell.contentView.layer.cornerRadius = 5
        cell.contentView.backgroundColor = model.color

        return cell
    }
}

let layout = UICollectionViewFlowLayout()
layout.itemSize = CGSize(width: 365, height: 200)
layout.scrollDirection = .vertical
layout.minimumInteritemSpacing = 8
layout.minimumLineSpacing = 8
layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

// usage
let controller = SampleViewController(collectionViewLayout: layout)

PlaygroundPage.current.liveView = controller
