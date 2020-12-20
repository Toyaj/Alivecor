//
//  FavouriteModelView.swift
//  Alivecor
//
//  Created by Toyaj Nigam on 20/12/20.
//

import Foundation
import RealmSwift

class FavouriteModelView {
    
    var favouriteRealmModel = [RealmMovieModel]()
    
    func gettotalFavouriteMovieCount() -> Int {
        let realm = try! Realm()
        favouriteRealmModel = realm.objects(RealmMovieModel.self).filter("isFavourite == true").toArray()
        return favouriteRealmModel.count
    }
    
    func getRalmModel(item: Int) -> RealmMovieModel {
        favouriteRealmModel[item]
    }
}

// MARK: Update Saved data

extension FavouriteModelView {
    
    func updateFavourite(id: Int) {
        let realm = try! Realm()
        let movie = realm.objects(RealmMovieModel.self).filter("id = %@", id)
        if let movie = movie.first {
            try! realm.write {
                movie.isFavourite = false
            }
        }
    }
}

