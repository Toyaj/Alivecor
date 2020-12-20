//
//  FavouriteViewController+TableView.swift
//  Alivecor
//
//  Created by Toyaj Nigam on 20/12/20.
//

import UIKit

// MARK: TableViewDataSource

extension FavouriteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.gettotalFavouriteMovieCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.prepareUI(model: viewModel.getRalmModel(item: indexPath.item))
        cell.likeBtn.tag = indexPath.row
        cell.delegate = self
        return cell
    }
}

// MARK: TableViewDelegate

extension FavouriteViewController: UITableViewDelegate {}

// MARK: TableViewCellProtocol

extension FavouriteViewController: MovieCellDelegate {
    func favouriteBtnClicked(item: Int) {
        viewModel.updateFavourite(id: viewModel.favouriteRealmModel[item].id)
        print(viewModel.favouriteRealmModel[item])
        tableView.reloadData()
    }
}
