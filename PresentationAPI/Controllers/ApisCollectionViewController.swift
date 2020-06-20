//
//  ApisCollectionViewController.swift
//  PresentationAPI
//
//  Created by Egor Ukolov on 20.06.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import UIKit

enum UserActions: String, CaseIterable {
    
    case downloadImage = "Download Image"
    case exampleOne = "Api Example One"
    case exampleTwo = "Api Example Two"
}

class ApisCollectionViewController: UICollectionViewController {

    let userActions = UserActions.allCases
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        let userAction = userActions[indexPath.item]
        cell.userActionLabel.text = userAction.rawValue
        
        return cell 
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage:
            performSegue(withIdentifier: "ShowImage", sender: nil)
        case .exampleOne:
             performSegue(withIdentifier: "ExampleOne", sender: nil)
        case .exampleTwo:
             performSegue(withIdentifier: "ExampleTwo", sender: nil)
        }
    }

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "ShowImage" {
            let moviesReviewVC = segue.destination as! MoviesReviewController
            
            switch segue.identifier {
            case "ExampleOne":
                moviesReviewVC.fetchDataV1()
            default: break
            }
        }
    }
    
    
    
}

extension ApisCollectionViewController: UICollectionViewDelegateFlowLayout {
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
    
    
}
