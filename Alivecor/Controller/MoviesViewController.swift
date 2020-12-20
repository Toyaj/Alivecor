//
//  ViewController.swift
//  Alivecor
//
//  Created by Toyaj Nigam on 20/12/20.
//

import UIKit
import RealmSwift

class MoviesViewController: UIViewController {
    
    // MARK: Variable
    
    let viewModel: MoviesModelView = MoviesModelView()
    @IBOutlet weak var tableView: UITableView!
    let progressHUD = ProgressHud(text: "Processing...")
    
    // MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel.gettotalStoredMovieCount() == 0 {
            fetchMovieData()
        }
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        tableView.tableFooterView = UIView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: FetchMovieData
    
    func fetchMovieData() {
        if Reachability.isConnectedToNetwork() {
            progressHUD.show()
            viewModel.fetchMovieList { [weak self] movies in
                DispatchQueue.main.async { [self] in
                    if self?.viewModel.isAPIFailed == true {
                        let alert = UIAlertController(title: "Alert", message: "Please try after some time!", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self?.present(alert, animated: true, completion: nil)
                        self?.progressHUD.hide()
                    } else {
                        self?.tableView?.reloadData()
                        print("Controll come to main thread")
                        self?.progressHUD.hide()
                    }
                }
            }
        }
    }
}
