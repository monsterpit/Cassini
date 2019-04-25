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
            
            imageView.sizeToFit()
            
            scrollView.contentSize = imageView.frame.size
            
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
    
    @IBOutlet weak var scrollView: UIScrollView!{
        //here we just want imageView to be in the contentArea  of the scrollView .
        //So as soon as the scrollView gets hooked up by interface builder I am going to ask the scrollView to add ScrollView to add as a subview my imageView
        didSet{
            scrollView.addSubview(imageView)
            //again the content area is size zero so is my imageView at this point so it's gonna be completely blank
        }
    }
    
    //this create a imageView of size zero
    var imageView = UIImageView()
    
    func fetchImage(){
        
        if let url = imageURL{
            
            let urlContents = try? Data(contentsOf: url)
            
            if let imageData = urlContents{
                
                imageView.image = UIImage(data: imageData)
                //anytime I set image I have to do
                //sizeToFit() which means make yourself intrinsic size
                //The size that will fit this image the best
                imageView.sizeToFit()
               
                scrollView.contentSize = imageView.frame.size
                 //and now the UIImageView frame has been set  but If we dont do this then it wont scroll at all
                //otherwise the contentArea will be of 0,0 size and we got this big image and I am trying to scroll in this zero zero size rect does nothing
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


//easier in code than IB
