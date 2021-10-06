import UIKit
import Store

public enum WelcomeFeature {
    public static func start(root: UIViewController, dependencies: Dependencies) {
        let storyboard = UIStoryboard(name: "Walkthrough", bundle: .module)
        let nav = storyboard.instantiateInitialViewController()! as! WalkthroughNavigationController
        nav.mealStore = dependencies.mealStore
        root.present(nav, animated: true, completion: nil)
    }
    
    public struct Dependencies {
        let mealStore: MealStore
        
        public init(mealStore: MealStore) {
            self.mealStore = mealStore
        }
    }
}
