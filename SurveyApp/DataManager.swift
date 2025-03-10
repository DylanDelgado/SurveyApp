import Firebase
import SwiftUI

class DataManager: ObservableObject {
    func addAppUsage(App: String, Motive: String, Activity: String) {
        let db = Firestore.firestore()
        let ref = db.collection("AppUsage").document()
        ref.setData(["App": App, "Motive": Motive, "Activity": Activity, "id": UUID().uuidString]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func addSurvey(responses: [Int]) {
        let db = Firestore.firestore()
        let ref = db.collection("Survey").document()
        ref.setData([
            "responses": responses,
            "id": UUID().uuidString,
            "timestamp": Timestamp()
        ]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
