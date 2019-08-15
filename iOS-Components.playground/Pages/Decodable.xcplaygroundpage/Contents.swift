import Foundation

/*:

 - Custom JSON decoding

 */

let jsonString = """
{
  "id": "34541863",
  "name": "\\"A\\" Cell Breeding Device",
  "type": "Spell Card",
  "desc": "During each of your Standby Phases, put 1 A-Counter on 1 face-up monster your opponent controls.",
  "race": "Continuous",
  "archetype": "Alien",
  "card_sets": [
    {
      "set_name": "Force of the Breaker",
      "set_code": "FOTB-EN043",
      "set_rarity": "Common",
      "set_price": "0.89"
    }
  ],
  "card_images": [
    {
      "id": "34541863",
      "image_url": "https://storage.googleapis.com/ygoprodeck.com/pics/34541863.jpg",
      "image_url_small": "https://storage.googleapis.com/ygoprodeck.com/pics_small/34541863.jpg"
    }
  ],
  "card_prices": {
    "cardmarket_price": "0.15",
    "tcgplayer_price": "0.21",
    "ebay_price": "0.99",
    "amazon_price": "0.05"
  }
}
"""

struct Card: Decodable {
  let id: String
  let name: String
  let prints: [Print]

  struct Print: Decodable {
    let setName: String
    let setCode: String
    let rarity: String

    private enum CodingKeys: String, CodingKey {
      case setName = "set_name"
      case setCode = "set_code"
      case rarity = "set_rarity"
    }

    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.setName = try container.decode(String.self, forKey: .setName)
      self.setCode = try container.decode(String.self, forKey: .setCode)
      self.rarity = try container.decode(String.self, forKey: .rarity)
    }
  }

  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case prints = "card_sets"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    self.id = try container.decode(String.self, forKey: .id)
    self.name = try container.decode(String.self, forKey: .name)
    self.prints = try container.decode([Print].self, forKey: .prints)
  }
}

guard let rawData = jsonString.data(using: .utf8) else {
    fatalError(":(")
}

do {
  let card = try JSONDecoder().decode(Card.self, from: rawData)

  print(card.name)
  print(card.prints.first?.rarity)
} catch {
  print(error)
}
