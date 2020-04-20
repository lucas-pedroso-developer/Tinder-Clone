import UIKit

class MatchVC: UIViewController, UITextFieldDelegate {
    
    var user: User? {
        didSet {
            if let user = user {
                photoImageView.image = UIImage(named: user.photo)
                messageLabel.text = "\(user.name) curtiu você também!"
            }
        }
    }
    
    let photoImageView: UIImageView = .photoImageView(named: "pessoa-1")
    let likeImageView: UIImageView = .photoImageView(named: "icone-like")
    let messageLabel: UILabel = .textBoldLabel(19, textColor: .white, numberOfLines: 1)
    
    let messageTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.placeholder = "Diga algo legal"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.textColor = .darkText
        textField.returnKeyType = .go
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 0))
        textField.rightViewMode = .always
        
        return textField
    }()
    
    let messageSendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor(UIColor(red: 62/255, green: 163/255, blue: 255/255, alpha: 1), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setTitle("Voltar para o Tinder", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.addSubview(photoImageView)
        photoImageView.fillSuperview()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
        
        photoImageView.layer.addSublayer(gradient)
        
        messageTextField.delegate = self
        messageLabel.textAlignment = .center
        
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        likeImageView.contentMode = .scaleAspectFit
        
        messageTextField.addSubview(messageSendButton)
        messageSendButton.fill(
            top: messageTextField.topAnchor,
            leading: nil,
            trailing: messageTextField.trailingAnchor,
            bottom: messageTextField.bottomAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 16)
        )
        messageSendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [likeImageView, messageLabel, messageTextField, backButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.fill(
            top: nil,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor,
            padding: .init(top: 0, left: 32, bottom: 46, right: 32)
        )
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.sendMessage()
        return true
    }
    
    @objc func sendMessage() {
        if let message = self.messageTextField.text {
            print("message to send")
        }
    }
        
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
 
    @objc func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
            NSValue)?.cgRectValue {
            if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
                
                UIView.animate(withDuration: duration) {
                    
                    self.view.frame = CGRect (
                        x: self.view.frame.origin.x,
                        y: self.view.frame.origin.y,
                        width: self.view.frame.width,
                        height: self.view.frame.height - keyboardSize.height
                    )
                    self.view.layoutIfNeeded()
                }
                
            }
        }
    }
    
    @objc func keyboardHide(notification: NSNotification) {
        if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            UIView.animate(withDuration: duration) {
                self.view.frame = UIScreen.main.bounds
                self.view.layoutIfNeeded()
            }
            
        }
        
    }
    
}
