//
//  ImageViewController.swift
//  QuotesMovie
//
//  Created by admin on 17/05/1443 AH.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var imageLink: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageLink = imageLink{
        image.kf.setImage(with: URL(string: imageLink))
      
    }
    }
}
