//
//  ViewController.swift
//  Project13
//
//  Created by Nick on 2019/5/12.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var radius: UISlider!
    @IBOutlet weak var scale: UISlider!
    @IBOutlet weak var center: UISlider!
    
    @IBOutlet weak var changeFilter: UIButton!
    
    var currentImage: UIImage!
    var context : CIContext!
    var currentFilter: CIFilter!
    
    var radiusFilter: CIFilter!
    var scaleFilter: CIFilter!
    var centerFilter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
        radiusFilter = CIFilter(name: "CIGaussianBlur")
        scaleFilter = CIFilter(name: "CIUnsharpMask")
        centerFilter = CIFilter(name: "CITwirlDistortion")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
    }

    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        let beginImage = CIImage(image: image)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentImage = image
        applyProcessing()
        dismiss(animated: true)
    }
    
    func applyProcessing() {
        
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(slider.value, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(slider.value * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(slider.value * 10, forKey: kCIInputScaleKey) }
        if inputKeys.contains(kCIInputCenterKey) {
            currentFilter.setValue(CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2), forKey: kCIInputCenterKey) }
        
        guard let image = currentFilter.outputImage else {
            return
        }
        
        if let cgImage = context.createCGImage(image, from: image.extent) {
            let imagev = UIImage(cgImage: cgImage)
            imageView.image = imagev
        }
    }
    
    @IBAction func changeFilter(_ sender: Any) {
        let ac = UIAlertController(title: "Choose filter", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func setFilter(action: UIAlertAction) {
        guard currentImage != nil else { return }
        guard let title = action.title else { return }
        
        changeFilter.setTitle(title, for: .normal)
        
        currentFilter = CIFilter(name: title)
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
        
    }
    
    @IBAction func save(_ sender: Any) {
        if let image = imageView.image {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(save(_:didFinishSavedWithError:context:)), nil)
        } else {
            let ac = UIAlertController(title: "Tips", message: "no image", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    @IBAction func intenstyChanged(_ sender: Any) {
        applyProcessing()
    }
    @IBAction func radiusChanged(_ sender: Any) {
    }
    @IBAction func scaleChanged(_ sender: Any) {
    }
    @IBAction func centerChanged(_ sender: Any) {
    }
    
    @objc func save(_ image: UIImage, didFinishSavedWithError error: Error?, context: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Oops", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "save!", message: "succeed", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "ok", style: .default))
            present(ac, animated: true)
        }
    }
}

