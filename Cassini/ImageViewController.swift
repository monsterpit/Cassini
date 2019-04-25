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
            
            if let imageData = urlContents{
                
                imageView.image = UIImage(data: imageData)
                
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

//image appear to be smashed . So we need to fix that and how do we fix that of course with scrollView
//We can put a scrollView  in there it can be its normal size and we can scroll around it zoom in and out


// btw when you are interacting with subviews of scrollViews in Interface Builder , it's talking about contentArea
//Interface Builder doesn't even know anything about scrollView except from that they are in the content area
// So for e.g. we are gonna create some constraints here between the imageView and the scrollView that's gonna be constraints between imageview and the contentArea that big white area of the scrollView
//that's important to understand when you are working in interface builder


//select imageView and embed in scrollView
//it comes with 20 points border
// so we will adjust it to fit phone

// It really doesn't matter actually where we put the imageview in terms of size and angle
//What's important here is that imageView be tied to the edges of the contentArea
//And why is that important not so that the imageView is the right size
//but so that the contentArea is the right size
//If I tie the imageView edges to the contentArea and the imageView changes size the content area will change size
//And I have to have that contentArea always matching the size of the imageView if i want to be able to scroll over the entire image
// So when you do this in Interface Builder as opposed to be in code
// You do this by constraints by hooking  the imageView to be tied to the scrollView


//Which infact it already is because when i did embed in scrollView the imageview was lready tied to it's superview
// So it kept it just that it got these little extra 20 points in there which I don't like
// Now the thing is scrollView itself is not tied to its edges
// we have resized it but there's no constraint
// So I am gonna tie it to the edges to the edges in the same way that I did the other one
//How do I choose the scrollView though 
