//
//  WidgetBannerViewController.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 23/02/22.
//  
//

import UIKit

class WidgetBannerViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterWidgetBannerProtocol?
    
}

extension WidgetBannerViewController: PresenterToViewWidgetBannerProtocol{
    // TODO: Implement View Output Methods
}
