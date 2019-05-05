//
//  ViewController.swift
//  Project10
//
//  Created by Nick on 2019/5/4.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPersonImage))
    }

    @objc func addPersonImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        }
        
        present(picker, animated: true)
    }

}

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as? PersonCell else {
            fatalError("can not dequeue cell")
        }
        
        let person = people[indexPath.item]
        cell.name.text = person.name
        let path = getPathComponent().appendingPathComponent(person.image)
        cell.imageView.image = UIImage(contentsOfFile: path.path)
        
        cell.imageView.layer.borderColor = UIColor.init(white: 0, alpha: 0.5).cgColor
        cell.imageView.layer.borderWidth = 1
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 8
        
        return cell
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageString = UUID().uuidString
        let imagePath = getPathComponent().appendingPathComponent(imageString)
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let person = Person(name: "Unknow", image: imageString)
        people.append(person)
        
        collectionView.reloadData()
        
        dismiss(animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let outerac = UIAlertController(title: "Operation", message: "choose one", preferredStyle: .alert)
        outerac.addAction(UIAlertAction(title: "Edit", style: .default) { [weak self] _ in
            let ac = UIAlertController(title: "Tips", message: "Input name", preferredStyle: .alert)
            ac.addTextField()
            
            ac.addAction(UIAlertAction(title: "Ok", style: .default) {
                [weak self, weak ac] _ in
                guard let name = ac?.textFields?[0].text else { return }
                if let person = self?.people[indexPath.item] {
                    person.name = name
                }
                self?.collectionView.reloadData()
            })
            ac.addAction(UIAlertAction(title: "cancel", style: .cancel))
            
            self?.present(ac, animated: true)
        })
        outerac.addAction(UIAlertAction(title: "Delete", style: .default) {
            [weak self] _ in
            self?.people.remove(at: indexPath.item)
            self?.collectionView.reloadData()
        })
        present(outerac, animated: true)
    }
    
    func getPathComponent() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}
