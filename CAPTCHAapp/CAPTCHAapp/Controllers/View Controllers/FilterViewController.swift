//
//  FilterViewController.swift
//  CAPTCHAapp
//
//  Created by Carson Ward on 4/22/21.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    
    func photoWasSelected(photo: String)
    
}

class FilterViewController: UIViewController {
    
    // MARK: Properties
    
    weak var delegate: FilterSelectionDelegate?
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    
    @IBAction func randomPhotoButtonTapped(_ sender: Any) {
        
        delegate?.photoWasSelected(photo: "randomPhotos")
        
        self.dismiss(animated: true)
        
    }
    
    
    @IBAction func keyPhotoButtonTapped(_ sender: Any) {
        
        delegate?.photoWasSelected(photo: "carPhotos")
        
        self.dismiss(animated: true)
        
    }
    
}//End of class
