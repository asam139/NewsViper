//
//  NewsModel.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation
import SWXMLHash

private let KEY_TITLE = "title";
private let KEY_DESCRIPTION = "description";
private let KEY_LINK = "link";
private let KEY_PUB_DATE = "pubDate";
private let KEY_MEDIA_THUMBNAIL = "media:thumbnail";
private let KEY_ATT_IMAGE_URL = "url";

class NewsModel: CustomStringConvertible {
    var title: String?
    var descriptionText: String?
    var link: String?
    var pubDate: String?
    var imageURL: String?
    
    
    convenience init(indexer:XMLIndexer) {
        self.init()
    
        title = indexer[KEY_TITLE].element?.text
        descriptionText = indexer[KEY_DESCRIPTION].element?.text
        link = indexer[KEY_LINK].element?.text
        pubDate = indexer[KEY_PUB_DATE].element?.text
        imageURL = indexer[KEY_MEDIA_THUMBNAIL].element?.attribute(by: KEY_ATT_IMAGE_URL)?.text
    
    }
    
    var description: String {
        return  "Title: \(title ?? "No name")" +
                "Description: \(descriptionText ?? "No description")" +
                "Link: \(link ?? "No link")" +
                "PubDate: \(pubDate ?? "No pub date")" +
                "Image: \(imageURL ?? "No image"))"
    }
}


extension NewsModel {
    
    static func mapArrayFrom(indexers: [XMLIndexer]) -> [NewsModel] {
        var news: [NewsModel] = []
        for item in indexers {
            let model = NewsModel(indexer: item)
            news.append(model)
        }
        
        return news
    }
    
}
