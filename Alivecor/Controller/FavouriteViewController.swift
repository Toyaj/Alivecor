//
//  FavouriteViewController.swift
//  Alivecor
//
//  Created by Toyaj Nigam on 20/12/20.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    // MARK: Variable
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel: FavouriteModelView = FavouriteModelView()
    
    // MARK: ViewDidLoad
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        
    }
    
    // MARK: ViewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}
