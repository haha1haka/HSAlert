import Foundation
/**
Button Style Enum
 - parameter `default`:  Toast that closes after a certain amount of time.
 - parameter complete: consists of one buttons(completeButton).
 - parameter cancel: consists of one buttons(cancelButton, completeButton).
 */
public enum AlertButtonStyle {
    case `default`
    case complete
    case cancel
}
/// Height adjustment calculation according to button presence
extension AlertButtonStyle {
    var height: Double {
        switch self {
        case .default:
            return 0.2
        case .complete:
            return 0.25
        case .cancel:
            return 0.25
        }
    }
}
