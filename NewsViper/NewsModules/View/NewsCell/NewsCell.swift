//
//  NewsCell.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionTextView: UITextView!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    
    override func awakeFromNib() {
        
        newsDescriptionTextView.textContainer.lineFragmentPadding = 0;
        newsDescriptionTextView.textContainerInset = UIEdgeInsets.zero;
        
        newsImageView.layer.cornerRadius = 3.0
        
    }
}
