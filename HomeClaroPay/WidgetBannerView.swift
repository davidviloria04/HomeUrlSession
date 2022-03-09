//
//  WidgetBannerView.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 8/03/22.
//  
//

import Foundation
import UIKit

class WidgetBannerView: UIViewController {

    // MARK: Properties
    var presenter: WidgetBannerPresenterProtocol?
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.getWidgetBannerData()
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemGray4
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        presenter?.getWidgetBannerData()

    }
}

extension WidgetBannerView: WidgetBannerViewProtocol {
    // TODO: implement view output methods
    func succes() {
        print(">>>>>Succes")
    }
    func error(error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            self.present(alert, animated: true)
        }
    }
}
extension WidgetBannerView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1, height: collectionView.frame.height/2)
    }
    
    
}
