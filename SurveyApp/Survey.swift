import SwiftUI

struct Survey: Identifiable {
    var id: UUID = UUID()
    var responses: [Int]
    var timestamp: Date
}
