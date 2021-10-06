import UIKit
import WelcomeFeature
import Store

@UIApplicationMain
final class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let vc = UIViewController()
        vc.view.backgroundColor = .black        
        window?.rootViewController = vc
        
        let mealStore = MealStore(storage: .inMemory, calendar: .autoupdatingCurrent, sendNotification: { _, _ in })
        let dependencies = WelcomeFeature.Dependencies(mealStore: mealStore)
        
        WelcomeFeature.start(root: vc, dependencies: dependencies)
        
        return true
    }
}
