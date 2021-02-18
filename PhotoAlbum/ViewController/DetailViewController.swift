//
//  DetailViewController.swift
//  PhotoAlbum
//
//  Created by Akdag on 18.02.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImageName : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageName = selectedImageName {
            imageView.image = UIImage(named: imageName)
        }
    }
    



}
