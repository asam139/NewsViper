//
//  NewsViewController.swift
//  NewsViper
//
//  Created by Saul Moreno Abril on 08/09/2018.
//  Copyright © 2018 Saul Moreno Abril. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    var presenter: NewsViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        presenter?.updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension NewsViewController: NewsPresenterToViewProtocol {
    func showNews(news: [NewsModel]) {
        for oneNew in news {
            print("Title: \(oneNew.title ?? "No name"))")
            print("Description: \(oneNew.description ?? "No description"))")
        }
    }
    
    func showError() {
        let alertController = UIAlertController.init(title: "Error", message: "You are not connection to Internet", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

