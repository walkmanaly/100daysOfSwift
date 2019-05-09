//
//  ViewController.swift
//  MilestoneDay50
//
//  Created by Nick on 2019/5/9.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var images = [String]()

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
                    images.append(image)
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
        cell.textLabel?.text = images[indexPath.row]
        cell.imageView?.image = UIImage(named: images[indexPath.row])
        
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
                images.append(uuid)
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

