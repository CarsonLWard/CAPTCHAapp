//
//  PhotoCollectionViewCell.swift
//  CAPTCHAapp
//
//  Created by Carson Ward on 4/22/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    // MARK: - Properties
    
    var picture: Picture? {
        
        didSet {
            
            updateViews()
            
        }
        
    }
    
    // MARK: - Helper Methods
    
    func updateViews() {
        
        guard let picture = picture else {return}
        
        pictureImageView.contentMode = .scaleAspectFill
        
        pictureImageView.image = picture.photo
        
    }
    
}//End of class
