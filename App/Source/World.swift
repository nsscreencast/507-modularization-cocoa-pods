import Foundation
import Store
import WelcomeFeature

struct World {
    let mealStore: MealStore
}

let mealStore = MealStore(
    storage: .filename("meals.json"),
    calendar: .autoupdatingCurrent,
    sendNotification: { name, sender in
        NotificationCenter.default.post(name: name, object: sender)
    })

var CurrentEnvironment = World(
    mealStore: mealStore
)

extension World {
    var welcomeFeature: WelcomeFeature.Dependencies {
        .init(mealStore: mealStore)
    }
}
