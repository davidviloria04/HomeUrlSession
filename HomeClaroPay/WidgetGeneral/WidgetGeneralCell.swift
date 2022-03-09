//
//  WidgetGeneralCell.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 25/02/22.
//

import UIKit

class WidgetGeneralCell: UICollectionViewCell {
    
    static let identifier = "WidgetGeneralCell"
    
    let icon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "house")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let type: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "Custom 2"
        typeLabel.textAlignment = .center
        return typeLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray4
        contentView.addSubview(type)
        contentView.addSubview(icon)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        type.frame = CGRect(x: 5,
                            y: contentView.frame.size.height - 30,
                            width: contentView.frame.size.width - 10,
                            height: 40)
        
        icon.frame = (CGRect(x: 5,
                             y: 0,
                             width: contentView.frame.width-10,
                             height: contentView.frame.size.width-30))
    }
}
