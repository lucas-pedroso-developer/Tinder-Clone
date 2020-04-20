import UIKit

class DetailHeaderView: UICollectionReusableView {
    
    var user: User? {
        didSet {
            if let user = user {
                photoImageView.image = UIImage(named: user.photo)
            }
        }
    }
    
    var photoImageView: UIImageView = .photoImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        photoImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implanted")
    }
    
}

