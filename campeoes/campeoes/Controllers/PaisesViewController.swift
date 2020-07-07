//
//  PaisesViewController.swift
//  campeoes
//
//  Created by aluno on 05/07/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit
class PaisesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    

    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["África do Sul", "Alemanha Ocidental", "Alemanha Oriental", "Alemanha", "Arábia Saudita", "Argélia", "Argentina", "Austrália", "Áustria", "Bélgica", "Bolívia", "Brasil", "Bulgária", "Camarões", "Chile", "China", "Colômbia", "Coréia do Sul", "Costa Rica", "Croácia", "Dinamarca", "Emirados Árabes", "Espanha", "Estados Unidos", "França", "Gana", "Holanda", "Honduras", "Hungria", "Inglaterra", "Itália", "Iugoslávia", "México", "Noruega", "País de Gales", "Paraguai", "Peru", "Polônia", "Portugal", "República Tcheca", "Romênia", "Rússia", "Suécia", "Suíça", "Tchecoslováquia", "Turquia", "Ucrânia", "União Soviética", "Uruguai"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


    
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        cell.myImage.image = UIImage(named: cell.myLabel.text!)
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.backgroundColor = UIColor.lightGray
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    


   
  

    
}



