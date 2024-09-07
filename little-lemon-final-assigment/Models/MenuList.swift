import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
