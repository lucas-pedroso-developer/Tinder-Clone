import UIKit

class SlidePhotoCell: UICollectionViewCell {
    
    var photoImageView: UIImageView = .photoImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        layer.cornerRadius = 8
        clipsToBounds = true
        
        addSubview(photoImageView)
        photoImageView.fillSuperview()
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
