//
//  MoviesReviewController.swift
//  PresentationAPI
//
//  Created by Egor Ukolov on 20.06.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

import UIKit

class MoviesReviewController: UITableViewController {
    
    private let jsonUrlOne = "http://api.rottentomatoes.com/api/public/v1.0/movies/{id}/reviews.json"
    
    private var moviesReview: [MoviesReview] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieReviewCell", for: indexPath) as! MovieReviewCell
        let moviewReview = moviesReview[indexPath.row]
        // остановка
        return cell
    }
    
    func fetchDataV1() {
        
        guard let url = URL(string: jsonUrlOne) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            
            do {
                let moviesReview = try decoder.decode(MoviesReview.self, from: data)
                
            } catch let erorr {
                print(erorr.localizedDescription)
            }
            
            
        }.resume()
    }
}


