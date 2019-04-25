//
//  ImageViewController.swift
//  Cassini
//
//  Created by Boppo on 25/04/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL : URL?{
        didSet{

            imageView.image = nil
            
            if view.window != nil{

                fetchImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if imageView.image == nil{
            fetchImage()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    func fetchImage(){

        if let url = imageURL{

            let urlContents = try? Data(contentsOf: url)
            
            //If let my image data that I got from that urlContent then I can create my image from that data
            // the image Data is probably a jpeg data or something like that
            if let imageData = urlContents{
                
                // imageView.image = UIImage(named: <#T##String#>)
                // for loading image with name that is stored locally
                
                imageView.image = UIImage(data: imageData)
                // It will look in there in that bag of bits and see if it recognizes anything that looks like an image like a jpg file or something like that so that's kind of cool
            }

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // by the time I load if my imageURl is nil then load up a sample image
        if imageURL == nil {
            
            imageURL = DemoURLs.standford
        }
    }
    
    
}

//when added a image tick target membership if not selected to include image when app is installed
