import UIKit

class DetailPhotoCell: UICollectionViewCell {
    
    let descriptionLabel: UILabel = .textBoldLabel(16)
    
    let slidePhotoVC = SlidePhotoVC()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        descriptionLabel.text = "Fotos recentes Instagram"
        addSubview(descriptionLabel)
        descriptionLabel.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20)
        )
        
        addSubview(slidePhotoVC.view)
        slidePhotoVC.view.fill(
            top: descriptionLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
