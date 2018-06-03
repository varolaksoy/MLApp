//
//  ViewController.swift
//  MLApp
//
//  Created by Mac on 3.06.2018.
//  Copyright © 2018 Varol. All rights reserved.
//

import UIKit
import Fusuma

class ViewController: UIViewController, FusumaDelegate {

    var selectedImage : UIImage?
    let fusuma = FusumaViewController()

    @IBAction func pickPhoto(_ sender: Any) {
        
        self.present(fusuma, animated: true)
    }
    
    //her ekran açılışında çalışan fonks
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let selectedImage = selectedImage {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewStoryboardID") as! SecondViewController
            vc.selectedImage = selectedImage
            self.selectedImage = nil



            self.present(vc, animated: true, completion: nil)

        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fusuma.delegate = self
    }

    //FUSUMA DELEGATE
    
    
    
    // Return the image which is selected from camera roll or is taken via the camera.
    func fusumaImageSelected(_ image: UIImage, source: FusumaMode) {
        
        print("Image selected")
        selectedImage = image
    }
    
    // Return the image but called after is dismissed.
    func fusumaDismissedWithImage(image: UIImage, source: FusumaMode) {
        
        print("Called just after FusumaViewController is dismissed.")
    }
    
    
    // When camera roll is not authorized, this method is called.
    func fusumaCameraRollUnauthorized() {
        
        print("Camera roll unauthorized")
    }
    
    func fusumaMultipleImageSelected(_ images: [UIImage], source: FusumaMode) {
        
    }
    
    func fusumaVideoCompleted(withFileURL fileURL: URL) {
        
    }
    


}

