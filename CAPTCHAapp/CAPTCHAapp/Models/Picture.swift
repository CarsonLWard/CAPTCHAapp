//
//  Picture.swift
//  CAPTCHAapp
//
//  Created by Carson Ward on 4/22/21.
//

import UIKit

class Picture {
    
    let name: String
    
    let photo: UIImage?
    
    let phototype: String
    
    let uuid: String
    
    init(name: String, photo: UIImage?, phototype: String, uuid: String = UUID().uuidString) {
        
        self.name = name
        
        self.photo = photo
        
        self.phototype = phototype
        
        self.uuid = uuid
        
    }
    
}//End of class

// MARK: - Extensions

extension Picture: Equatable {
    
    static func == (lhs: Picture, rhs: Picture) -> Bool {
        
        return lhs.uuid == rhs.uuid
        
    }
    
}
