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
                        let viewMoreBar = self.createBar(labelText: "Qué quieres hacer hoy?", buttonText: "Ver más")
                                                self.stackView.addArrangedSubview(viewMoreBar)

                        self.stackView.addArrangedSubview(widgetGeneralView.view)
                        widgetGeneralView.view.layoutIfNeeded()
                    }
                case "WIDGET_BANNER":
                    if let widgetBannerView = self.presenter?.createBannerWidget(){
                        self.addChild(widgetBannerView)
                        let constraintsHeight = widgetBannerView.view.heightAnchor.constraint(lessThanOrEqualToConstant: 900)
                        constraintsHeight.isActive = true
                        self.stackView.addArrangedSubview(widgetBannerView.view)
                        widgetBannerView.view.layoutIfNeeded()
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
extension HomeViewController{
    
    
    
    public func createBar(labelText: String, buttonText: String) -> UIView{
        let barView = UIView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height: 30))
        barView.backgroundColor = UIColor(hex: "#F0F1F4FF")
        var titleBarLabel: UILabel = UILabel()
        var viewMoreButton: UIButton = UIButton()
        titleBarLabel.frame = CGRect(x: 10, y: 10, width: 150, height: 30)
        titleBarLabel.adjustsFontSizeToFitWidth = true
        titleBarLabel.text = labelText
        barView.addSubview(titleBarLabel)
        
        viewMoreButton.frame = CGRect(x: UIScreen.main.bounds.width - 100, y: 10, width: 90, height: 30)
        //viewMoreButton.backgroundColor = UIColor.white
        viewMoreButton.backgroundColor = UIColor(hex: "#E4E3E4FF")
        viewMoreButton.setTitle(buttonText, for: UIControl.State.normal)
        viewMoreButton.layer.cornerRadius = 15.0
        viewMoreButton.titleLabel?.font = titleBarLabel.font
        viewMoreButton.titleLabel?.adjustsFontSizeToFitWidth = true
        viewMoreButton.setTitleColor(UIColor.black, for: .normal)
       
        barView.addSubview(viewMoreButton)
        return barView
    }
   
    
    
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

class ButtonCreator{
    func makeButton(title: String? = nil,
                               titleColor: UIColor = .black,
                               font: UIFont? = nil,
                               background: UIColor = .clear,
                               cornerRadius: CGFloat = 0,
                               borderWidth: CGFloat = 0,
                               borderColor: UIColor = .clear) -> UIButton {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(title, for: .normal)
            button.backgroundColor = background
            button.setTitleColor(titleColor, for: .normal)
            button.titleLabel?.font = font
            button.layer.cornerRadius = 6.0
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.red.cgColor
            return button
          }
            // Button Action
             @objc func pressed(_ sender: UIButton) {
                    print("Pressed")
              }
}
