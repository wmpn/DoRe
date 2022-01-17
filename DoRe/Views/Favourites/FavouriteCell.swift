//
//  FavouriteCell.swift
//  DoRe
//
//  Created by Praveen Nirmal on 15/1/22.
//

import UIKit

class FavouriteCell: UITableViewCell {

    @IBOutlet weak var favouriteImageView: UIImageView!
    @IBOutlet weak var favouriteTitleLabel: UILabel!
    @IBOutlet weak var favouriteAlbumLabel: UILabel!
    @IBOutlet weak var favouriteArtistLabel: UILabel!
    
    func setFavourite(favourite: Favourite) {
        favouriteImageView.image = favourite.thumbnail
        favouriteTitleLabel.text = favourite.title
        favouriteAlbumLabel.text = favourite.album
        favouriteArtistLabel.text = favourite.artist
    }
}
