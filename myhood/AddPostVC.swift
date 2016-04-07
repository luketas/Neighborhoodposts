//
//  AddPostVC.swift
//  myhood
//
//  Created by Lucas Franco on 3/22/16.
//  Copyright © 2016 Lucas Franco. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postimage: UIImageView!
    @IBOutlet weak var titlefield: UITextField!
    @IBOutlet weak var descriptionfiel: UITextField!
    
    var ImagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postimage.layer.cornerRadius = postimage.frame.size.width / 2
        postimage.clipsToBounds = true
        
        ImagePicker = UIImagePickerController()
        ImagePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func AddPicPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(ImagePicker, animated: true, completion: nil)
    }
    
    @IBAction func CancelButtonPressed(sender: UIButton) {
      dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func MakePostButtonPressed(sender: UIButton) {
        if let title = titlefield.text , let desc = descriptionfiel.text , let img =  postimage.image {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            
            let post = Post(ImagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
            
        
        
    }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        ImagePicker.dismissViewControllerAnimated(true, completion: nil)
        postimage.image = image
    
    }

}