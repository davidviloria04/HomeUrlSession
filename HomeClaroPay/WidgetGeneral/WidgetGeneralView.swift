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
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.height/3)-4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(WidgetGeneralCell.self, forCellWithReuseIdentifier: WidgetGeneralCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        collectionView.frame = view.bounds
    }
  
}



extension WidgetGeneralView: WidgetGeneralViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WidgetGeneralCell", for: indexPath)
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


