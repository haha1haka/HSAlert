import UIKit

/**
 *  HSAlertController is a simple Alert
 *  A HSAlertController object displays an alert message to the user.
 */
public class HSAlertController: UIView {
    /// View
    private let alertView = UIView()
    private let mainLabel = UILabel()
    private let subLabel = UILabel()
    private let buttonStackView = UIStackView()
    private let cancelButton = UIButton()
    private let completeButton = UIButton()
    /// Alert title
    public var mainTitle: String?
    /// Alert description
    public var subTitle: String?
    /// Alert font Style
    public var font: UIFont?
    /// Alert completeButton text Color
    public var buttonTextColor: UIColor?
    /// Button Style
    public var alertButtonStyle: AlertButtonStyle?
    /// Action Handler
    public var completion: (() -> Void)?
    /// super initilaizer
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     Creates and returns a controller for displaying an alert to the user. Default alertButtonStyle is `.default`.
     
     - parameter mainTitle:        The maintitle of the alert.
     - parameter subTitle:         Descriptive text that provides additional details about the reason for the alert.
     - parameter font:             set titles font.
     - parameter alertButtonStyle: Style accordind to button
     - parameter buttonTextColor:  Constants indicating the type of alert to display.
     - parameter completion:       Executed after tappedCompleteButton .
     */
    public convenience init(mainTitle: String, subTitle: String? = nil, font: UIFont? = nil, buttonTextColor: UIColor? = .black, completion: (()-> Void)? = nil) {
        self.init(frame: .zero)
        self.mainTitle = mainTitle
        self.subTitle = subTitle
        self.font = font
        self.alertButtonStyle = .default
        self.buttonTextColor = buttonTextColor
        self.completion = completion
    }
    /// convenience init
    public convenience init() {
        self.init(frame: .zero)
        self.mainTitle = mainTitle
        self.subTitle = subTitle
        self.font = font
        self.alertButtonStyle = .default
        self.completion = completion
    }
}

/**
 *  Functions
 */
extension HSAlertController {
    /// Add Complete Button
    public func addCompleteButton() -> HSAlertController {
        alertButtonStyle = .complete
        return self
    }
    /// Add Cancel Button
    public func addCancelButton() -> HSAlertController{
        alertButtonStyle = .cancel
        return self
    }
    /**
    show Alert
     - parameter rootView: UIView where this object will be excuted.
     - work: Set hierarchy accordind to buttonStyle
     */
    public func showAlert(_ rootView: UIView) {
        rootView.addSubview(self)
        addSubview(alertView)
        alertView.addSubview(mainLabel)
        alertView.addSubview(subLabel)
        
        switch alertButtonStyle {
        case .default:
            show(type: .default)
            configureLayout(rootView, buttonStyle: .default)
        case .complete:
            show(type: .complete)
            alertView.addSubview(buttonStackView)
            buttonStackView.addArrangedSubview(completeButton)
            configureLayout(rootView, buttonStyle: .complete)
        case .cancel:
            show(type: .cancel)
            alertView.addSubview(subLabel)
            alertView.addSubview(buttonStackView)
            buttonStackView.addArrangedSubview(cancelButton)
            buttonStackView.addArrangedSubview(completeButton)
            configureLayout(rootView, buttonStyle: .cancel)
        default:
            return
        }
        configureAttributes()
    }
    // set Constraints
    private func configureLayout(_ rootView: UIView, buttonStyle: AlertButtonStyle) {
        switch buttonStyle {
        case .default:
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: rootView.topAnchor),
                leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
                trailingAnchor.constraint(equalTo: rootView.trailingAnchor),
                bottomAnchor.constraint(equalTo: rootView.bottomAnchor)
            ])
            NSLayoutConstraint.activate([
                alertView.centerXAnchor.constraint(equalTo: centerXAnchor),
                alertView.centerYAnchor.constraint(equalTo: centerYAnchor),
                alertView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
                alertView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: subTitle == nil ? 0.082 : buttonStyle.height)
            ])
            NSLayoutConstraint.activate([
                mainLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 25),
                mainLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 10),
                mainLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -10),
            ])
            NSLayoutConstraint.activate([
                subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 15),
                subLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
                subLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -20),
                subLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 80)
            ])
            translatesAutoresizingMaskIntoConstraints = false
            alertView.translatesAutoresizingMaskIntoConstraints = false
            mainLabel.translatesAutoresizingMaskIntoConstraints = false
            subLabel.translatesAutoresizingMaskIntoConstraints = false
            
        default:
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: rootView.topAnchor),
                leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
                trailingAnchor.constraint(equalTo: rootView.trailingAnchor),
                bottomAnchor.constraint(equalTo: rootView.bottomAnchor)
            ])
            NSLayoutConstraint.activate([
                alertView.centerXAnchor.constraint(equalTo: centerXAnchor),
                alertView.centerYAnchor.constraint(equalTo: centerYAnchor),
                alertView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
                alertView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: subTitle == nil ? 0.13 : buttonStyle.height)
            ])
            NSLayoutConstraint.activate([
                mainLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 25),
                mainLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 10),
                mainLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -10),
            ])
            NSLayoutConstraint.activate([
                subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 25),
                subLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
                subLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -20),
                subLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 80)
            ])
            NSLayoutConstraint.activate([
                buttonStackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
                buttonStackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
                buttonStackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor),
                buttonStackView.heightAnchor.constraint(equalToConstant: 44),
            ])
            translatesAutoresizingMaskIntoConstraints = false
            alertView.translatesAutoresizingMaskIntoConstraints = false
            mainLabel.translatesAutoresizingMaskIntoConstraints = false
            subLabel.translatesAutoresizingMaskIntoConstraints = false
            buttonStackView.translatesAutoresizingMaskIntoConstraints = false
            cancelButton.translatesAutoresizingMaskIntoConstraints = false
            completeButton.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    /**
    show
     - parameter type: AlertButtonStyle.
     - work: Acticate alert according to buttonStyle
     */
    private func show(type: AlertButtonStyle) {
        if type == .default {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                print("completion")
                self.dismiss{}
            }
        } else {
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let self = self else { return }
                self.alertView.alpha = 1
            }
        }
    }
    /**
    dismiss
     - parameter handler: Completion Handler after disabling alert.
     */
    private func dismiss(handler: @escaping () -> Void) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.backgroundColor = .clear
            self.alertView.alpha = 0
        } completion: { [weak self] _ in
            guard let self = self else { return }
            self.removeFromSuperview()
            handler()
        }
    }
    /// set Attributes
    private func configureAttributes() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        alertView.layer.cornerRadius = 4
        alertView.layer.masksToBounds = true
        alertView.backgroundColor = .white
        
        mainLabel.text = mainTitle
        mainLabel.textColor = .black
        mainLabel.textAlignment = .center
        mainLabel.font = font
        
        subLabel.text = subTitle
        subLabel.numberOfLines = 3
        subLabel.textAlignment = .center
        subLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        buttonStackView.distribution = .fillEqually
        buttonStackView.layer.borderWidth = 0.16
        buttonStackView.layer.borderColor = UIColor.lightGray.cgColor
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = .white
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.layer.borderWidth = 0.16
        cancelButton.layer.masksToBounds = true
        cancelButton.layer.borderColor = UIColor.lightGray.cgColor
        cancelButton.addTarget(self, action: #selector(tappedCancelButton), for: .touchUpInside)

        completeButton.setTitle("확인", for: .normal)
        completeButton.setTitleColor(buttonTextColor, for: .normal)
        completeButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        completeButton.layer.borderWidth = 0.16
        completeButton.backgroundColor = .white
        completeButton.layer.masksToBounds = true
        completeButton.layer.borderColor = UIColor.lightGray.cgColor
        completeButton.addTarget(self, action: #selector(tappedCompleteButton), for: .touchUpInside)

    }
    /// Cancel Button AddTarget
    @objc func tappedCancelButton() {
        dismiss{}
    }
    /// Complete Button AddTarget
    @objc func tappedCompleteButton() {
        dismiss{
            self.completion?()
        }
    }

}
