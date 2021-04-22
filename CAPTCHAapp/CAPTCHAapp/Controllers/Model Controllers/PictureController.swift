//
//  PictureController.swift
//  CAPTCHAapp
//
//  Created by Carson Ward on 4/22/21.
//

import UIKit

let carName = "images with cars"

let randomName = "images without cars"

class PictureController {
    
    static let carPhotos = [Picture(name: carName, photo: UIImage(named: "cars"), phototype: "carPhotos"),
                            Picture(name: carName, photo: UIImage(named: "cars1"), phototype: "carPhotos"),
                            Picture(name: carName, photo: UIImage(named: "cars2"), phototype: "carPhotos"),
                            Picture(name: carName, photo: UIImage(named: "cars3"), phototype: "carPhotos"),
                            Picture(name: carName, photo: UIImage(named: "cars4"), phototype: "carPhotos"),
                            Picture(name: carName, photo: UIImage(named: "cars5"), phototype: "carPhotos")]
    
    static let randomPhotos = [Picture(name: randomName, photo: UIImage(named: "random"), phototype: "randomPhotos"),
                               Picture(name: randomName, photo: UIImage(named: "random1"), phototype: "randomPhotos"),
                               Picture(name: randomName, photo: UIImage(named: "random2"), phototype: "randomPhotos"),
                               Picture(name: randomName, photo: UIImage(named: "random3"), phototype: "randomPhotos"),
                               Picture(name: randomName, photo: UIImage(named: "random4"), phototype: "randomPhotos"),
                               Picture(name: randomName, photo: UIImage(named: "random5"), phototype: "randomPhotos")]
    
}//End of class
