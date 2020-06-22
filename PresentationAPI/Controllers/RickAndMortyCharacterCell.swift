//
//  MovieReviewCell.swift
//  PresentationAPI
//
//  Created by Egor Ukolov on 20.06.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import UIKit

class RickAndMortyCharacterCell: UITableViewCell {
    
    @IBOutlet var characterImage: UIImageView!
    
    @IBOutlet var nameCharacterLabel: UILabel!
    @IBOutlet var statusCharacterLabel: UILabel!
    @IBOutlet var speciesCharacterLabel: UILabel!
  //  @IBOutlet var genderCharacterLabel: UILabel!
    
    
    func configure(with character: RickAndMortyCharacter) {
        nameCharacterLabel.text = "Name: \(character.name ?? "unknown")"
        statusCharacterLabel.text = "Status: \(character.status ?? "unknown")"
        speciesCharacterLabel.text = "Species: \(character.species ?? "unknown")"
    //    genderCharacterLabel.text = "Gender: \(character.gender ?? "unknown")"
        
        DispatchQueue.global().async {     
            guard let stringURL = character.image else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
        
    }
}
