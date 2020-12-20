//
//  MoviesViewController+TableView.swift
//  Alivecor
//
//  Created by Toyaj Nigam on 20/12/20.
//

import UIKit
import Foundation

// MARK: TableViewDataSource

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.gettotalStoredMovieCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.prepareUI(model: viewModel.getRealmModel(item: indexPath.row))
        cell.likeBtn.tag = indexPath.row
        cell.delegate = self
        return cell
    }
}

// MARK: TableViewDelegate

extension MoviesViewController: UITableViewDelegate {}

// MARK: TableViewCellProtocol

extension MoviesViewController: MovieCellDelegate {
    func favouriteBtnClicked(item: Int) {
        viewModel.updateFavourite(id: viewModel.realmModel[item].id)
        print(viewModel.realmModel[item])
        tableView.reloadData()
    }    
}
