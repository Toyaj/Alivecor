//
//  MoviesModelView.swift
//  Alivecor
//
//  Created by Toyaj Nigam on 20/12/20.
//

import Foundation
import RealmSwift
import SDWebImage
import UIKit

class MoviesModelView {
    
    // MARK: - Initialization
    
    init(model: [MovieModel]? = nil) {
        if let inputModel = model {
            movies = inputModel
        }
    }
    
    // MARK: - Variable
    
    var movies = [MovieModel]()
    var realmModel = [RealmMovieModel]()
    var isAPIFailed: Bool = false
    
    // Mark: - Function
    
    func gettotalStoredMovieCount() -> Int {
        let realm = try! Realm()
        realmModel = realm.objects(RealmMovieModel.self).toArray()
        return realmModel.count
    }
    
    func getRealmModel(item: Int) -> RealmMovieModel {
        realmModel[item]
    }
}

// MARK: API Call

extension MoviesModelView {
    
    func fetchMovieList(completion: @escaping (Result<[MovieModel], Error>) -> Void) {
        HTTPManager.shared.get(urlString: "\(ServiceAPI.url)\(Bundle.main.object(forInfoDictionaryKey: "movieDbKey") ?? "")", completionBlock: { [weak self] result in
            guard self != nil else {return}
            switch result {
            case .failure(let error):
                print ("failure", error)
                self?.isAPIFailed = true
            case .success(let dta) :
                let decoder = JSONDecoder()
                do
                {
                    let moviesModel = try decoder.decode(MoviesModel.self, from: dta)
                    self?.movies = moviesModel.results
                    self?.saveDataToRealm(model: self?.movies)
                    completion(.success(moviesModel.results))
                } catch {
                    self?.isAPIFailed = true
                }
            }
        })
    }
}

// MARK: Persist Data Locally

extension MoviesModelView {
    
    func saveDataToRealm(model: [MovieModel]?) {
        guard model != nil else {
            return
        }
        let count = (model?.count)!
        let realm = try! Realm()
        for i in 0..<count  {
            try! realm.write({
                let newMovie = RealmMovieModel()
                newMovie.id = (model?[i].id)!
                newMovie.posterPath = (model?[i].posterPath)!
                newMovie.title = (model?[i].title)!
                realm.add(newMovie)
            })
        }
    }
}

// MARK: Update Saved data

extension MoviesModelView {
    
    func updateFavourite(id: Int) {
        let realm = try! Realm()
        let movie = realm.objects(RealmMovieModel.self).filter("id = %@", id)
        if let movie = movie.first {
            try! realm.write {
                movie.isFavourite = true
            }
        }
    }
}
