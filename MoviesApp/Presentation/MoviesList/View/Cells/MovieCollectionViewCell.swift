//
//  MovieCollectionViewCell.swift
//  MoviesApp
//
//  Created by OSX on 09/07/2025.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    var favoriteButtonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configure(data: Movie) {
        nameLabel.text = data.title
        let posterURL = URL(string: "\(Endpoints.posterURL)\(data.posterPath)")
        imageView.kf.setImage(with: posterURL)
        favButton.setImage(UIImage(systemName: data.isFavorite ? "heart.fill" : "heart"), for: .normal)
    }
    
    
    @IBAction func didTapFavButton(_ sender: Any) {
        favoriteButtonAction?()
    }
    
}
