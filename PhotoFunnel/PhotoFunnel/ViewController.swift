//
//  ViewController.swift
//  PhotoFunnel
//
//  Created by Zhikai Wang on 1/26/15.
//  Copyright (c) 2015 Zhikai Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picImageView: UIImageView!
    
    // Create some room to display the pixels of the funnelled pic
    let context = CIContext(options: nil)
    
    @IBAction func ApplyFunnel(sender: AnyObject) {
        
        // Create a pic to funnel
        let userImage = CIImage( image:picImageView.image)
        
        // Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey:(Double(arc4random_uniform(314)) /
            100)]
        
        // Apply a funnel to the image
        let funnelledImage = userImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        // Display the pixels fo the funnelled pic or image
        let displayedImage = context.createCGImage(funnelledImage,fromRect:funnelledImage.extent())
        
        // Reflect the change back in the interface
        picImageView.image = UIImage(CGImage: displayedImage)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

