import UIKit

public class ImageLibrary {
    public enum Key: String {
        case apple
        case pancakes
        case pizza = "pizza-slice"
        case burger = "burger-and-soda"
    }
    
    public static func image(for key: Key) -> UIImage? {
        UIImage(named: key.rawValue, in: .module, compatibleWith: nil)
    }
}
