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


//Done constraint by selecting scrollview from document Outline and then from bottom icon setting constraint
//ScrollView is hooked up to its superView
//imageView is also hooked up to its superView which in interface builder means contentArea of the scrollView
//See how imageview is subview of scrollView it's intended right there
//that means the imageView when the scrollView is your superview you are talking about the contentArea
//Now why is it still red?

// It seems to me I have specified all my constraints between these views why is this red?
// well lets look up warning
//scrollable content size is ambiguous for "Scroll View"
//So its talking about that contentArea it's saying how big is that thing
// well the answer is it's as big as the image View because the edges of those two things are tied together
//but interface builder does not know how big the imageView is
//Why? because it has no image
//This imageview is empty so this interface builder is like I don't know how big that thing is
//So i dnt know how big the scrollable contentArea is for a scrollView
//Now this is an unsolvable problem because we don't set the image until our code runs
//So how do we deal with this in interface builder

//Well interface builder has a really cool little feature if you inspect image view right here and go down to the bottom you see this thing intrinsic Size
//Intrinsic size of something is the size that it wants to be to fit it's content
//So for a label intrinsic size of a label is how small it can be and still fit all the text in there
// but for an imageView the intrinsic size how it can be with the natural aspect ratio and size of the image so that's it's intrisic size
//Well it's intrisic size it set to be default but you can actually set it be a placeholder
//This placeholder Which I am going to set is just any random size you want and it will only use this in interface builder
//It's just holding this place in interface builder and in code we are gonna set it
//So it will get rid of red complaints because now the imageView has a size and so the contentArea is going to be 414 by 896 for iphone X device selected for IB but only in interface builder
//but once it runs it's going to be whatever size the imageView is which is going to depend on what image we set

//when we are setting contraints between imageView and Scrollview we are talaking about contentArea and it's controlling the size of the contentArea
//So that's all we have to do here we dont need anything in code here because we have set all these constraints

//ScrollView is smart about SafeArea
//Even if we tied it to its superviews edges it still knows there's a safe area and it goes all the way
