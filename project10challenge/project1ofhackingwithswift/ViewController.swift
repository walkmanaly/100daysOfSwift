//
//  ViewController.swift
//  project1ofhackingwithswift
//
//  Created by Nick on 2019/4/13.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    var picturesStr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        performSelector(inBackground: #selector(fetchData), with: nil)
        fetchData()
        title = "Pictures List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareListClicked))
    }
    
    @objc func fetchData() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                picturesStr.append(item)
            }
        }
        picturesStr.sort()
        print(picturesStr)
    }
    
    @objc func shareListClicked() {
        
        let vc = UIActivityViewController(activityItems: ["My project1 of hacking swift"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picturesStr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as? PictureCell else {
            return UICollectionViewCell()
        }
        
        let name = picturesStr[indexPath.item]
        cell.imageView.image = UIImage(named: name)
        cell.title.text = name
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let picture = picturesStr[indexPath.item]
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailViewController else { return }
        vc.headTitle = picture
        vc.selecedImage = picture
        navigationController?.pushViewController(vc, animated: true)
    }
}

