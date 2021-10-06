import UIKit
import Store

public protocol WalkthroughDelegate: AnyObject {
    func didCompleteWalkthrough()
}

public class WalkthroughNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    public weak var walkthroughDelegate: WalkthroughDelegate?
    
    var mealStore: MealStore!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
        isModalInPresentation = true
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let vc = viewController as? WalkthroughDinnerPromptViewController {
            vc.mealStore = mealStore
            vc.walkthroughDelegate = walkthroughDelegate
        }
    }
}
