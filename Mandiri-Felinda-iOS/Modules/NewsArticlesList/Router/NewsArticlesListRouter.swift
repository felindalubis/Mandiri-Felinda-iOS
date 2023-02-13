//
//  NewsArticlesListRouter.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import UIKit

// MARK: - Protocol
protocol NewsArticlesListRouterProtocol: AnyObject {
    static func assembleModule(forCategory category: String, from source: String) -> UIViewController
    func openNews(withUrl url: String)
}

// MARK: - Class
class NewsArticlesListRouter {
    weak var viewController: UIViewController?
}

extension NewsArticlesListRouter: NewsArticlesListRouterProtocol {
    func openNews(withUrl url: String) {
        let newsDetail = NewsDetailRouter.assembleModule(url: url)
        viewController?.navigationController?.pushViewController(newsDetail, animated: true)
    }
    
    static func assembleModule(forCategory category: String, from source: String) -> UIViewController {
        let storyBoard = UIStoryboard.init(name: "NewsArticleList", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "NewsArticlesListViewController") as! NewsArticlesListViewController
        let presenter = NewsArticlesListPresenter()
        let interactor = NewsArticlesListInteractor()
        let router = NewsArticlesListRouter()

        view.presenter =  presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.category = category
        presenter.source = source
        
        router.viewController = view
        
        interactor.output = presenter
        
        return view
    }
}
