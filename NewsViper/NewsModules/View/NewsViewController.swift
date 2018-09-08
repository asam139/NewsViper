//
//  NewsViewController.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import UIKit
import SDWebImage


class NewsViewController: UIViewController {
    var presenter: NewsViewToPresenterProtocol?
    
    static fileprivate let cellIdentifier:String = "NewsCell_Identifier"
    @IBOutlet fileprivate  weak var tableView: UITableView!
    
    fileprivate var news: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "BBC News"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search(sender:)))
        
        presenter?.updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc
    func search(sender: UIBarButtonItem) {
        
    }
}

extension NewsViewController: NewsPresenterToViewProtocol {
    func showNews(news: [NewsModel]) {
        self.news = news
        
        tableView.reloadData()
    }
    
    func showError() {
        let alertController = UIAlertController.init(title: "Error", message: "You are not connection to Internet", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsViewController.cellIdentifier, for: indexPath) as! NewsCell
        
        let newsModel = news[indexPath.row]
        cell.newsTitleLabel.text = newsModel.title
        cell.newsDescriptionTextView.text = newsModel.descriptionText
        cell.newsDateLabel.text = newsModel.pubDate
    
        if let imageString = newsModel.imageURL {
            if let imageURL = URL(string: imageString) {
                cell.newsImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "news"))
            }
        }
        
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let newsModel = news[indexPath.row]

    }
    
}



