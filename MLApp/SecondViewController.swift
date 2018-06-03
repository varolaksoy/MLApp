//
//  SecondViewController.swift
//  MLApp
//
//  Created by Mac on 3.06.2018.
//  Copyright © 2018 Varol. All rights reserved.
//

import UIKit
import Vision

class SecondViewController: UIViewController {
    var selectedImage : UIImage?
    var resnetModel = Resnet50()
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var accuracyLabel: UILabel!
    
    
    
    @IBAction func geriDon(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        if let selectedImage = selectedImage {
            imageView.image = selectedImage
            
            recognizeImage(image: selectedImage)
        }


    }

    func recognizeImage(image: UIImage){
        
        if let model = try? VNCoreMLModel(for: self.resnetModel.model){
            let request = VNCoreMLRequest(model: model) { (request, error) in
                if let results = request.results as? [VNClassificationObservation]{
                    
                    
                    self.nameLabel.text = results.first?.identifier
                    if let confidence = results.first?.confidence {
                        self.accuracyLabel.text = "% " + String(describing: confidence)

                    }
                    
                    
                    for classification in results {
                        print("tanınan: \(classification.identifier) oran: \(classification.confidence) ")
                    }
                    
                    
                }
                
                
            }
            
            if let imageData = UIImagePNGRepresentation(image) {
                let handler = VNImageRequestHandler(data: imageData, options: [:])
                try? handler.perform([request])
            }
        }
        
        
        
    }

   

}
