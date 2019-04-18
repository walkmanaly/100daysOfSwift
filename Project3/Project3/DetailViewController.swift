//
//  DetailViewController.swift
//  Project3
//
//  Created by Nick on 2019/4/18.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var image: String?
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = image {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareClicked))
    }
    
    @objc func shareClicked() {
        guard let imageData = imageView.image?.jpegData(compressionQuality: 0.8) else {
            return
        }
        let vc = UIActivityViewController(activityItems: [imageData], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
