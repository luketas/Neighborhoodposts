 //
//  DataService.swift
//  myhood
//
//  Created by Lucas Franco on 3/23/16.
//  Copyright © 2016 Lucas Franco. All rights reserved.
//

import Foundation
import UIKit

 class DataService {
    
    static let instance = DataService()
    
    
    private var _loadedPosts = [Post]()
    
    
    var loadedPosts : [Post]{
        return _loadedPosts
    }
 
 
 func savePosts(){
    let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
    NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: "posts")
    NSUserDefaults.standardUserDefaults().synchronize()
 }
 
 func loadPosts(){
    if let postsData = NSUserDefaults.standardUserDefaults().objectForKey("posts") as? NSData {
        
        if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post]{
            _loadedPosts = postsArray
        }
        
    }
    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
    
 }
 
 func saveImageAndCreatePath(image: UIImage) -> String {
    
    let imagedata = UIImagePNGRepresentation(image)
    let imagePath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
    let fullPath = DocumentsPathforfilename(imagePath)
    imagedata?.writeToFile(fullPath, atomically: true)
    return imagePath
    
 }
    
 func imageforPath(path: String)-> UIImage? {
    let fullPath = DocumentsPathforfilename(path)
    let image = UIImage(named: fullPath)
    return image
    
 }
 
 func addPost (post: Post){
    _loadedPosts.append(post)
    savePosts()
    loadPosts()
 }
    
    func DocumentsPathforfilename(name: String) -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
        
        
    }
 
 }
 