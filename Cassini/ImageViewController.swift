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
    
    //If my fetchimage truely work in background i have to do more work here which is I have to get some indication to the user I am working on it because otherwise they are gonna say where's my image
    // went to this view controller I don't see any image up here so I have to give it some feedback but since right now it's gonna block the User interface until it get's the image because we are not doing the mutli-threading , we  will just leave it like it but you are gonna see it when we do it we are gonna put something in there to do that
    func fetchImage(){
        // that imageURl is nil we just leave it blank nothing in our imageView but if I have it then I need to go out on the internet and get the data at that URl and turn it into an image
        //So how do we go out on the internett and get data from URL we do that with data object
        //data object is just a bag of bits
        // well data object has a initializer which give me a URL and I will go get the bag of bits from that URL
        if let url = imageURL{
            //data has lot of init's because it's a bag of bits so we can convert it to lot of different datatypes like bag of bytes and all kinds of things
            //But one of there has contents of URL so why does it throws it's going out to the network maybe lots of reason it can throw network connection bad , the server rejected the request , there's probably 20 different things that could throw here
            //Now turns out we don't care about any of them if we did lets put Data(contentsOf: <#T##URL#>) in here
            //since this throws what do we have to say in front of it try
            // and wrap it with do and catch i.e. do this thing and catch the error
            do{
                let urlContents = try Data(contentsOf: <#T##URL#>)
            }
            catch let error {
                // catch the error , and process the error
                //oh it was the server timeout ,network unavailable , all this things
                // but we don't really don't care about any of that stuff we are just lonely imageViewController , we just want to put our imageView up or not
                //So don't care about error
                // So we are not going to do it with a  do try catch
                //Instead we are going to use   try?
                
            }
        }
    }
    
    
    
}
