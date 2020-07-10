import UIKit

// Nested Types Action

struct BlackjackCard {
    enum Suit: Character {
        case spade = "s", hearts = "h", diamonds = "d", clubs = "c"
    }
    
    // Nested Rank enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue)"
        output += "value is \(rank.values.first)"
        if let second = rank.values.second {
            output += "or \(second)"
        }
        return output
    }
}

let theAceOfSpace = BlackjackCard(rank: .ace, suit: .spade)
print("the aceOfSpade: \(theAceOfSpace.description)")

// Referring to Nested Types

let heartSymbol = BlackjackCard.Suit.hearts.rawValue
