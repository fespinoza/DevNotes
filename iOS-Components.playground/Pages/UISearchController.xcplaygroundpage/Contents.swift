import UIKit

struct Candy {
  let category: String
  let name: String
}

class SampleViewController: UITableViewController {
  let candies = [
    Candy(category:"Chocolate", name:"Chocolate Bar"),
    Candy(category:"Chocolate", name:"Chocolate Chip"),
    Candy(category:"Chocolate", name:"Dark Chocolate"),
    Candy(category:"Hard", name:"Lollipop"),
    Candy(category:"Hard", name:"Candy Cane"),
    Candy(category:"Hard", name:"Jaw Breaker"),
    Candy(category:"Other", name:"Caramel"),
    Candy(category:"Other", name:"Sour Chew"),
    Candy(category:"Other", name:"Gummi Bear"),
    Candy(category:"Other", name:"Candy Floss"),
    Candy(category:"Chocolate", name:"Chocolate Coin"),
    Candy(category:"Chocolate", name:"Chocolate Egg"),
    Candy(category:"Other", name:"Jelly Beans"),
    Candy(category:"Other", name:"Liquorice"),
    Candy(category:"Hard", name:"Toffee Apple")
  ]

  var filteredCandies = [Candy]()

  // nil is passed then the current view controller will show the results
  let searchController = UISearchController(searchResultsController: nil)

  override func viewDidLoad() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    super.viewDidLoad()

    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search Candies"
    navigationItem.searchController = searchController
    navigationItem.title = "Candies"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.isTranslucent = true
    definesPresentationContext = true
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

    let model = candies[indexPath.row]
    cell.textLabel?.text = model.name

    return cell
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return candies.count
  }

  // MARK: - Private instance methods

  func searchBarIsEmpty() -> Bool {
    // Returns true if the text is empty or nil
    return searchController.searchBar.text?.isEmpty ?? true
  }

  func filterContentForSearchText(_ searchText: String, scope: String = "All") {
    filteredCandies = candies.filter({( candy : Candy) -> Bool in
      return candy.name.lowercased().contains(searchText.lowercased())
    })

    tableView.reloadData()
  }
}

extension SampleViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    filterContentForSearchText(searchController.searchBar.text!)
  }
}

// usage
let controller = UINavigationController(rootViewController: SampleViewController())

// playground specific
import PlaygroundSupport

PlaygroundPage.current.liveView = controller
