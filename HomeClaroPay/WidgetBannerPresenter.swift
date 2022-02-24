//
//  WidgetBannerPresenter.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 23/02/22.
//  
//

import Foundation

class WidgetBannerPresenter: ViewToPresenterWidgetBannerProtocol {

    // MARK: Properties
    var view: PresenterToViewWidgetBannerProtocol?
    var interactor: PresenterToInteractorWidgetBannerProtocol?
    var router: PresenterToRouterWidgetBannerProtocol?
}

extension WidgetBannerPresenter: InteractorToPresenterWidgetBannerProtocol {
    
}
