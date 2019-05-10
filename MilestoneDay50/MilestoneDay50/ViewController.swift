//
//  ViewController.swift
//  MilestoneDay50
//
//  Created by Nick on 2019/5/9.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var images = [Picture]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPicture))
        
        loadData()
    }

    func loadData() {
        let fm = FileManager.default
        let bundle = Bundle.main.resourcePath!
        if let content = try? fm.contentsOfDirectory(atPath: bundle) {
            for image in content {
                if image.hasPrefix("nssl") {
                    let picture = Picture(name: "pic", image: image)
                    images.append(picture)
                }
            }
        }
        
    }
    
    @objc func addNewPicture() {
        let imgPick = UIImagePickerController()
        imgPick.allowsEditing = true
        imgPick.delegate = self
        imgPick.sourceType = .camera
        
        present(imgPick, animated: true)
    }

}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pic = images[indexPath.row]
        
        cell.textLabel?.text = pic.name
        
        var image = UIImage()
        if pic.image.contains("nssl") {
            image = UIImage(named: pic.image) ?? UIImage()
        } else {
            let path = getPath().appendingPathComponent(pic.image)
            if let data = try? Data(contentsOf: path) {
                image = UIImage(data: data) ?? UIImage()
            }
        }
        cell.imageView?.image = image
        
        return cell
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(type(of: info[.editedImage]))
        
        let uuid = UUID().uuidString
        
        let path = getPath().appendingPathComponent(uuid)
        
        if let image = info[.editedImage] as? UIImage {
            if let jpegData = image.jpegData(compressionQuality: 0.8) {
                try? jpegData.write(to: path)
                let pic = Picture(name: "custom", image: uuid)
                images.append(pic)
                self.tableView.reloadData()
            }
        }
        
        dismiss(animated: true)
        
    }
    
    func getPath() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return url[0]
    }
    
}

