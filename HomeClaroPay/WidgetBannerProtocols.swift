//
//  WidgetBannerContract.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 23/02/22.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewWidgetBannerProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterWidgetBannerProtocol {
    
    var view: PresenterToViewWidgetBannerProtocol? { get set }
    var interactor: PresenterToInteractorWidgetBannerProtocol? { get set }
    var router: PresenterToRouterWidgetBannerProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorWidgetBannerProtocol {
    
    var presenter: InteractorToPresenterWidgetBannerProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterWidgetBannerProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterWidgetBannerProtocol {
    
}
