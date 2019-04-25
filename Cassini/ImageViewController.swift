//
//  ImageViewController.swift
//  Cassini
//
//  Created by Boppo on 25/04/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    //this is my model
    //It's gonna be a type this class in iOS called URl
    //URl can be local file URl or Internet URL
    // take this model and turn it into an image and present in my view which is imageView
    var imageURL : URL?{
        didSet{
            //will clear out of image if any if some1 sets a imageURL
            imageView.image = nil
            
            // to only load image if its on screen
            //if view is on screen will have a window var
            //which is the window that it's in which is usually just this one window
            //so this is just simple cool little way to check if am i on screen and if I am on screen then I am gonna go ahead and fetch this image

            if view.window != nil{
            // fetchImage() because this can be over the network
            fetchImage()
            }
        }
    }
    
    // but what if I am not on screen eventually I need to fetch the image so when is a good time to do that ?? yeah viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            //At this point I know I am on screen So now inside of my viewDidAppear I can check to see if my imageView image is still nil then lets fetch it
        if imageView.image == nil{
            fetchImage()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    func fetchImage(){}
    
    
    
}
