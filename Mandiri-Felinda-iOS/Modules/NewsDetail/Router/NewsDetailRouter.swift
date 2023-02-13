//
//  NewsDetailRouter.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 14/02/23.
//

import UIKit

class NewsDetailRouter {
    static func assembleModule(url: String) -> UIViewController {
        let storyBoard = UIStoryboard.init(name: Constants.STORYBOARD_NEWS_ARTICLE_DETAIL, bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: NewsDetailViewController.identifier) as! NewsDetailViewController
        
        view.url = url
        
        return view
    }
}
