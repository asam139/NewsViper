//
//  NewsModel.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation

private let KEY_TITLE = "title";
private let KEY_DESCRIPTION = "description";
private let KEY_LINK = "link";
private let KEY_PUB_DATE = "pubDate";
private let KEY_ATT_IMAGE_URL = "url";

class NewsModel: CustomStringConvertible {
    var title: String?
    var descriptionText: String?
    var link: String?
    var pubDate: String?
    var imageURL: String?
    
    
    var description: String {
        return  "Title: \(title)" +
                "Description: \(descriptionText)" +
                "Link: \(link)" +
                "PubDate: \(pubDate)" +
                "Image: \(imageURL)"
    }
    
    
}



/*
 <item>
 <title><![CDATA[George Papadopoulos: Ex-Trump adviser jailed in Russia inquiry]]></title>
 <description><![CDATA[Ex-Trump aide George Papadopoulos is jailed for 14 days for lying to the FBI in the Russia inquiry.]]></description>
 <link>https://www.bbc.co.uk/news/world-us-canada-45455050</link>
 <guid isPermaLink="true">https://www.bbc.co.uk/news/world-us-canada-45455050</guid>
 <pubDate>Sat, 08 Sep 2018 06:02:44 GMT</pubDate>
 <media:thumbnail width="2048" height="1152" url="http://c.files.bbci.co.uk/EF8C/production/_103342316_hi049122992.jpg"/>
 </item>
 */
