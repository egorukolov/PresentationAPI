//
//  MoviesReviewController.swift
//  PresentationAPI
//
//  Created by Egor Ukolov on 20.06.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import UIKit

class RickAndMortyController: UITableViewController {
    
    private let jsonUrlOne = "https://rickandmortyapi.com/api/character/1,183"
    
    private var characters: [RickAndMortyCharacter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
       
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count 
    }
     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RickAndMortyCharacterCell
        
        
        let character = characters[indexPath.row]
        cell.configure(with: character)
        
        return cell
    }
    
    func fetchDataV1() {
        
        guard let url = URL(string: jsonUrlOne) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
             
            do {
                self.characters = try decoder.decode([RickAndMortyCharacter].self, from: data)
                //print(self.characters)
            } catch let erorr {
                print(erorr.localizedDescription)
            }
        }.resume()
    }
}
 

