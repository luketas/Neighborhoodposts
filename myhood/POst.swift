//
//  POst.swift
//  myhood
//
//  Created by Lucas Franco on 3/21/16.
//  Copyright © 2016 Lucas Franco. All rights reserved.
//

import Foundation


class Post: NSObject, NSCoding {
    
    private var _ImagePath: String!
    private var _Title: String!
    private var _PostDesc: String!
 

    
    init(ImagePath: String, title: String, description: String){
        self._ImagePath = ImagePath
        self._Title = title
        self._PostDesc = description
    }
    
    var ImagePath: String {
        return _ImagePath
    }
    
    var title: String{
        return _Title
    }
    
    var PostDesc: String{
        return _PostDesc
    }
    
    override init(){
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._ImagePath = aDecoder.decodeObjectForKey("ImagePath") as? String
        self._Title = aDecoder.decodeObjectForKey("title") as? String
        self._PostDesc = aDecoder.decodeObjectForKey("description") as? String
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._ImagePath, forKey: "ImagePath")
        aCoder.encodeObject(self._PostDesc, forKey: "description")
        aCoder.encodeObject(self._Title, forKey: "title")
        
        
        
    }
    
}