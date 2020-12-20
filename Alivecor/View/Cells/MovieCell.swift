//
//  MovieCell.swift
//  Alivecor
//
//  Created by Toyaj Nigam on 20/12/20.
//

import UIKit
import SDWebImage

   // MARK: MovieCell Protocol

protocol MovieCellDelegate: AnyObject {
    func favouriteBtnClicked(item: Int)
}

class MovieCell: UITableViewCell {
    
    // MARK: Variable
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    weak var delegate: MovieCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: Function
    
    @IBAction func favouriteBtnClicked(_ sender: UIButton) {
        delegate?.favouriteBtnClicked(item: sender.tag)
    }
    
    func prepareUI(model: RealmMovieModel) {
        title.text = model.title
        let imgURl = model.posterPath
        if model.isFavourite {
            likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        if  imgURl != "" {
            self.setImage(url: "\(ServiceAPI.baseURL)\(imgURl)")
        }
    }
    
    // MARK: - Set thumbnail Image
    
    func setImage(url: String) {
        imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"), options: [], completed: nil)
    }
    
 
    
}
