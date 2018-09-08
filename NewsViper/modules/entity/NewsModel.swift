//
//  NewsModel.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import Foundation

class NewsModel {
    internal var title: String?
    internal var description: String?
    internal var link: NSURL?
    internal var pubDate: NSDate?
    internal var imageURL: NSURL?
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
