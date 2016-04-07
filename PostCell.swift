//
//  PostCell.swift
//  myhood
//
//  Created by Lucas Franco on 3/21/16.
//  Copyright © 2016 Lucas Franco. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var posttitle: UILabel!
    @IBOutlet weak var postdescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
    }
  

    func configurecell (post: Post ) {
            posttitle.text = post.title
            postdescription.text = post.PostDesc
            postImg.image = DataService.instance.imageforPath(post.ImagePath)

    }
    

   }

