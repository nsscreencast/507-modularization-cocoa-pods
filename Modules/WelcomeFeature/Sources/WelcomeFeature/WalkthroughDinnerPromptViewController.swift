import UIKit
import Styleguide
import Store
import Core

public class WalkthroughDinnerPromptViewController: UIViewController {
    
    public weak var walkthroughDelegate: WalkthroughDelegate?
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var imageView: UIImageView!
    
    var mealStore: MealStore!
    
    @IBAction private func skipTapped() {
        walkthroughDelegate?.didCompleteWalkthrough()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = ImageLibrary.image(for: .pizza)
        textField.delegate = self
    }
}

extension WalkthroughDinnerPromptViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        walkthroughDelegate?.didCompleteWalkthrough()
        
        let meal = Meal(name: textField.text ?? "", date: Date(), type: .dinner)
        mealStore.add(meal)
        try! mealStore.save()
        
        return true
    }
}
