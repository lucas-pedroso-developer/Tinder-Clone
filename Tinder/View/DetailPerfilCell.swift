import UIKit

class DetailPerfilCell: UICollectionViewCell {
    
    var user: User? {
        didSet {
            if let user = user {
                nameLabel.text = user.name
                ageLabel.text = String(user.age)
                descriptionLabel.text = user.description
            }
        }
    }
    
    let nameLabel: UILabel = .textBoldLabel(32)
    let ageLabel: UILabel = .textLabel(28)
    let descriptionLabel: UILabel = .textLabel(18, numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let personalDataStackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel])
        personalDataStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [personalDataStackView, descriptionLabel, UIView()])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(
            top: 20,
            left: 20,
            bottom: 20,
            right: 20
        ))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
