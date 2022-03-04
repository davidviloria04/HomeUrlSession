//
//  WidgetQuickAccessCell.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 3/03/22.
//

import Foundation
import UIKit

class WidgetQuickAccessCell: UICollectionViewCell {
    static let identifier = "WidgetGeneralCell"
    
    
    private let icon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "flame.fill")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let type: UILabel = {
        let typeLabel = UILabel()
        typeLabel.text = "WidgetQuickAccess"
        typeLabel.textAlignment = .center
        return typeLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray
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
                            y: contentView.frame.size.height - 40,
                            width: contentView.frame.size.width - 10,
                            height: 40)
        
        icon.frame = (CGRect(x: 5,
                             y: 0,
                             width: contentView.frame.width-10,
                             height: contentView.frame.size.width-50))
    }
}
