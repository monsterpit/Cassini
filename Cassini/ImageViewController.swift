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
            
            image = nil
            
            if view.window != nil{
                
                fetchImage()
            }
        }
    }
    
    private var image : UIImage?{
        get
        {
           return imageView.image
        }
        set
        {
            imageView.image = newValue
            
            imageView.sizeToFit()
            
            scrollView.contentSize = imageView.frame.size
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if imageView.image == nil{
            fetchImage()
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!{

        didSet{
            scrollView.addSubview(imageView)

        }
    }
    
    //this create a imageView of size zero
    var imageView = UIImageView()
    
    func fetchImage(){
        
        if let url = imageURL{
            
            let urlContents = try? Data(contentsOf: url)
            
            if let imageData = urlContents{
                
                image = UIImage(data: imageData)

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
