//
//  RealmMovieModel.swift
//  Alivecor
//
//  Created by Toyaj Nigam on 20/12/20.
//

import RealmSwift

class RealmMovieModel: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var isFavourite: Bool = false
}
