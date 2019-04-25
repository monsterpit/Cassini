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

        //Instead we are going to use   try?
        if let url = imageURL{
            
//            do{
//                let urlContents = try Data(contentsOf: <#T##URL#>)
//             //  urlContents will be of type Data
//            }
//            catch let error {
//
//
//            }
            
            // has we currently care about what error it is we will do try?
            let urlContents = try? Data(contentsOf: <#T##URL#>)
             // try? say's try this thing and if it fails just return nil so now this make urlContents of type Data?  because it might fail 
        }
    }
    
    
    
}
