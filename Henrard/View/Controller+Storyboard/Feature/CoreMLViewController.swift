//
//  FeatureViewController.swift
//  henrard
//
//  Created by Julien Henrard on 19/05/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit
import CoreML
import QuartzCore

@available(iOS 11.0, *)
class CoreMLViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var buttonTakePicture: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelPrediction: UILabel!
    
    var model: Inceptionv3!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.midnightBlue
        self.buttonTakePicture.setTitleColor(UIColor.pumpkin, for: .normal)
        self.containerView.addDashedBorder(strokeColor: UIColor.carrot, lineWidth: 2, radius: 4)
        
        self.labelPrediction.text = "Give me an image"
        self.labelPrediction.round()
        self.labelPrediction.textColor = UIColor.darkGray
        self.labelPrediction.backgroundColor = UIColor.white
        self.labelPrediction.layer.shadowColor = UIColor.cloud.cgColor
        self.labelPrediction.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.labelPrediction.layer.shadowRadius = self.labelPrediction.bounds.height / 2
        self.labelPrediction.layer.shadowOpacity = 0.5
        self.labelPrediction.layer.masksToBounds = true
        self.labelPrediction.layer.shouldRasterize = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.model = Inceptionv3()
    }
    
    @IBAction func touchButtonTakePicture(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Take a picture", style: .default, handler: { _ in
            self.takePicture()
        })
        cameraAction.setValue(#imageLiteral(resourceName: "camera"), forKey: "image")
        alert.addAction(cameraAction)
        
        let libraryAction = UIAlertAction(title: "Library", style: .default, handler: { _ in
            self.openLibrary()
        })
        libraryAction.setValue(#imageLiteral(resourceName: "directory"), forKey: "image")
        alert.addAction(libraryAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func takePicture() {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }
        
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        cameraPicker.allowsEditing = false
        
        self.present(cameraPicker, animated: true)
    }
    
    private func openLibrary() {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        self.present(picker, animated: true)
    }
    
    // MARK: ImagePickerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true)
        
        self.labelPrediction.text = "I analyse your image..."
        
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            return
        }
        
        let resizeInfo = image.resize(width: 299, height: 299)
        
        self.imageContainer.image = resizeInfo?["image"] as? UIImage
        
        guard let pixelBuffer = resizeInfo?["pixelBuffer"], let prediction = try? model.prediction(image: pixelBuffer as! CVPixelBuffer) else {
            return
        }
        
        
        self.labelPrediction.text = "I think this is a \(prediction.classLabel)."
    }
}
