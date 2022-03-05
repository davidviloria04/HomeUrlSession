//
//  HomeViewController.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 21/02/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    var presenter: HomePresenterProtocol?
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //View -> Presenter
        HomePresenter.buildPresenter(view: self)
        presenter?.getHomeData()
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: HomeViewControllerProtocol{
    
    func succes() {
        print(">>>>> Succes")
        
        DispatchQueue.main.async {
            guard let items = self.presenter?.getdata() else{
                return
            }
            
            for item in items {
                switch item.type{
                case "WIDGET_GENERAL":
                    if let widgetGeneralView = self.presenter?.createGeneralWidget(){
                        self.addChild(widgetGeneralView)
                        let constraintsHeight = widgetGeneralView.view.heightAnchor.constraint(lessThanOrEqualToConstant: 900)
                        constraintsHeight.isActive = true
                        self.stackView.addArrangedSubview(widgetGeneralView.view)
                        widgetGeneralView.view.layoutIfNeeded()
                    }
                case "WIDGET_QUICK_ACCESS":
                    if let widgetQuickAccess = self.presenter?.createQuickAccessWidget(){
                        self.addChild(widgetQuickAccess)
                        let constraintsHeight = widgetQuickAccess.view.heightAnchor.constraint(lessThanOrEqualToConstant: 900)
                        constraintsHeight.isActive = true
                        self.stackView.addArrangedSubview(widgetQuickAccess.view)
                        widgetQuickAccess.view.layoutIfNeeded()
                    }
                    
                default :
                    print("No se generó ninguna vista")
                }
            }
        }
    }
    
    func error(error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
}
