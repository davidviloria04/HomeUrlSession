//
//  WidgetGeneralView.swift
//  HomeClaroPay
//
//  Created by David Viloria Ortega on 24/02/22.
//  
//

import Foundation
import UIKit

class WidgetGeneralView: UIViewController {

    // MARK: Properties
    var presenter: WidgetGeneralPresenterProtocol?
    private var collectionView: UICollectionView?
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        //layout.minimumInteritemSpacing = 1.5
        layout.itemSize = CGSize(width: (view.frame.size.width/3.8) ,
                                 height: (view.frame.size.height/6))
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        //layout.collectionView?.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = self.collectionView else {
            return
        }
        collectionView.register(WidgetGeneralCell.self, forCellWithReuseIdentifier: WidgetGeneralCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(hex: "#F0F1F4FF")
        
        collectionView.frame = view.bounds
        presenter?.getWidgetGeneralData()
    }
}

extension WidgetGeneralView: WidgetGeneralViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WidgetGeneralCell", for: indexPath) as! WidgetGeneralCell
        cell.type.text = "Texto \(indexPath.row)"
        return cell
    }
    
    func succes() {
        print(">>>>> Succes")
    }
    
    func error(error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }

}
