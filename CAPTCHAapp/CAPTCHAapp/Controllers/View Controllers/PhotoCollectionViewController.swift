//
//  PhotoCollectionViewController.swift
//  CAPTCHAapp
//
//  Created by Carson Ward on 4/22/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    
    var displayedPictures: [Picture] = []
    
    var targetedPicture: Picture?
    
    var selectedPhotoType = "randomPhotos"
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        shufflePhotos(phototype: selectedPhotoType)
        
    }
    
    // MARK: - Helper Methods
    
    func shufflePhotos(phototype: String) {
        
        if phototype == "randomPhotos" {
            
            let shuffledRandomPhotosGroup = PictureController.randomPhotos.shuffled()
            
            let randomPhotosGroup = shuffledRandomPhotosGroup.prefix(3)
            
            displayedPictures = Array(randomPhotosGroup)
            
            targetedPicture = PictureController.carPhotos.randomElement()
    
        } else {
            
            let shuffledKeyPhotosGroup = PictureController.carPhotos.shuffled()
            
            let keyPhotosGroup = shuffledKeyPhotosGroup.prefix(3)
            
            displayedPictures = Array(keyPhotosGroup)
            
            targetedPicture = PictureController.randomPhotos.randomElement()
            
        }
        
        updateViews()
        
    }
    
    // MARK: - Functions
    
    func updateViews() {
        
        guard let picture = targetedPicture else {return}
        
        displayedPictures.append(picture)
        
        displayedPictures.shuffle()
        
        self.title = "Find \(picture.name)"
        
        collectionView.reloadData()
        
    }
    
    func presentAlert(picture: Picture) {
        
        let success = picture == targetedPicture
        
        let alertController = UIAlertController(title: success ? "You are not a robot" : "You are a robot", message: nil, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { (_) in
            self.shufflePhotos(phototype: self.selectedPhotoType)
            
        }
        
        alertController.addAction(doneAction)
        
        if success {
            
            alertController.addAction(shuffleAction)
            
        }
        
        present(alertController, animated: true)
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toFilterVC" {
            
            guard let destination = segue.destination as? FilterViewController else {return}
            
            destination.delegate = self
            
        }
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return displayedPictures.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictureCell", for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
    
        let picture = displayedPictures[indexPath.row]
        
        cell.picture = picture
    
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let picture = displayedPictures[indexPath.row]
        
        presentAlert(picture: picture)
        
    }

}//End of class

// MARK: - Extensions

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width / 2
        
        return CGSize(width: width - 20, height: width + 30)
        
    }
    
}//End of extension

extension PhotoCollectionViewController: FilterSelectionDelegate {
    
    func photoWasSelected(photo: String) {
        
        selectedPhotoType = photo
        
        shufflePhotos(phototype: photo)
        
    }
    
}//End of extension
