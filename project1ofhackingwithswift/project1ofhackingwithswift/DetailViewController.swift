//
//  DetailViewController.swift
//  project1ofhackingwithswift
//
//  Created by Nick on 2019/4/13.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selecedImage: String?
    var headTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = headTitle
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareClick))
        
        if let imageLoad = selecedImage {
            imageView.image = UIImage(named: imageLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareClick() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("There is no image")
            return
        }
        guard let title = headTitle else {
            print("There is no title")
            return
        }
        let vc = UIActivityViewController(activityItems: [image, title], applicationActivities: [])
        // if we don't add this code, the app will crash on the ipad
        vc.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }

}
