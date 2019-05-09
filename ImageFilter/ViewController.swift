
//
//  ViewController.swift
//  ImageFilter
//
//  Created by Bill Tanthowi Jauhari on 08/05/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var importImage: UIButton!
    @IBOutlet weak var takePicture: UIButton!
    
//    var fileUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func takePictureAction(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.camera
        image.allowsEditing = false
        
        self.present(image, animated: true){
            
        }
    }
    
    @IBAction func importImageAction(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true){
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            photo.image = image
            filterSepia(image: image)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func filterSepia(image: UIImage) {
        let beginImage = CIImage(image: image)
        let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(beginImage, forKey: kCIInputImageKey)
        filter?.setValue(0.5, forKey: kCIInputIntensityKey)
        
        let newImage = UIImage(ciImage: (filter?.outputImage)!)
        self.photo.image = newImage
    }

}

