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
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(type)
        contentView.addSubview(icon)
        contentView.layer.cornerRadius = 10
        contentView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        contentView.autoresizesSubviews = true
        contentView.autoresizingMask = AutoresizingMask.flexibleWidth
        //contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        type.frame = CGRect(x: 0,
                            y: contentView.frame.size.height - 50,
                            width: contentView.frame.size.width - 10,
                            height: 40)
        
        icon.frame = (CGRect(x: contentView.frame.width/2 - 30,
                             y: 5,
                             width: contentView.frame.width-50,
                             height: contentView.frame.size.height-40))
    }
}
