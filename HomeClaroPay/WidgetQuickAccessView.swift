//
//  WidgetQuickAccessView.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 3/03/22.
//  
//

import Foundation
import UIKit

class WidgetQuickAccessView: UIViewController {

    // MARK: Properties
    var presenter: WidgetQuickAccessPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WidgetQuickAccessView: WidgetQuickAccessViewProtocol {
    // TODO: implement view output methods
}
