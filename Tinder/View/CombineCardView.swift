import UIKit

class CombineCardView: UIView {
    
    var user: User? {
        didSet {
            if let user = user {
                photoImageView.image = UIImage(named: user.photo)
                nameLabel.text = user.name
                ageLabel.text = String(user.age)
                descriptionLabel.text = user.description
            }
        }
    } 
    
    let photoImageView: UIImageView = .photoImageView()
    
    let nameLabel: UILabel = .textBoldLabel(32, textColor: .white)
    let ageLabel: UILabel = .textLabel(28, textColor: .white)
    let descriptionLabel: UILabel = .textLabel(18, textColor: .white, numberOfLines: 2)
    
    let deslikeImageView: UIImageView = .iconCard(named: "card-deslike")
    let likeImageView: UIImageView = .iconCard(named: "card-like")
    
    var callback: ((User) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        nameLabel.addShadow()
        ageLabel.addShadow()
        descriptionLabel.addShadow()
        
        addSubview(photoImageView)
        
        addSubview(deslikeImageView)
        deslikeImageView.fill(top: topAnchor,
                              leading: nil,
                              trailing: trailingAnchor,
                              bottom: nil,
                              padding: .init(top: 20, left: 0, bottom: 0, right: 20)
        )
        
        addSubview(likeImageView)
        likeImageView.fill(top: topAnchor,
                              leading: leadingAnchor,
                              trailing: nil,
                              bottom: nil,
                              padding: .init(top: 20, left: 20, bottom: 0, right: 0)
        )
        
        photoImageView.fillSuperview()
        
        let personalDatastackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel, UIView()])
        personalDatastackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [personalDatastackView, descriptionLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.fill(top: nil,
                       leading: leadingAnchor,
                       trailing: trailingAnchor,
                       bottom: bottomAnchor,
                       padding: .init(top: 0, left: 16, bottom: 14, right: 16)
        )
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(visualizeClick))
        stackView.isUserInteractionEnabled = true
        stackView.addGestureRecognizer(tap)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func visualizeClick() {
        if let user = self.user {
            self.callback?(user)
        }
    }
    
}


