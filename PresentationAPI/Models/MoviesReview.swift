//
//  MoviesReview.swift
//  PresentationAPI
//
//  Created by Egor Ukolov on 20.06.2020.
//  Copyright © 2020 Egor Ukolov. All rights reserved.
//

struct MoviesReview: Decodable {
    
    let review_type: String?
    let page_limit: String?
    let page: String?
    let country: String?
}
