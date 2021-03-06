//
//  NewsListViewController.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import UIKit
import SDWebImage
import EZLoadingActivity

class NewsListViewController: UIViewController {
    @IBOutlet fileprivate  weak var tableView: UITableView!
    static fileprivate let cellIdentifier:String = "NewsListCell_Identifier"
    
    var presenter: NewsListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "BBC News"
        
        let newsImage = UIImage(named: "news")
        let newsImageView = UIImageView(image: newsImage)
        newsImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        newsImageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = newsImageView
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search(sender:)))
        
        presenter?.viewNeedsUpdated()
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
        // TODO: Not implemented
    }
}

extension NewsListViewController: NewsListViewProtocol {
    func showLoading() {
        EZLoadingActivity.show("Loading...", disableUI: false)
    }
    
    func hideLoading() {
        EZLoadingActivity.hide()
    }
    
    func refreshNews() {
        tableView.reloadData()
    }
    
    func showError() {
        let alertController = UIAlertController.init(title: ":(", message: "You are not connection to Internet", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter!.newsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsListViewController.cellIdentifier, for: indexPath) as! NewsListCell
        
        let newsModel = self.presenter!.newsAt(index:indexPath.row)
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

extension NewsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showNewsDetailAt(index: indexPath.row)
    }
    
}



