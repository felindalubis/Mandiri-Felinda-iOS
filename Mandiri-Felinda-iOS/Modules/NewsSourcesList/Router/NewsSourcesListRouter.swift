//
//  NewsSourcesListRouter.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import UIKit

// MARK: - Protocol
protocol NewsSourcesListRouterProtocol: AnyObject {
    static func assembleModule(forCategory category: String) -> UIViewController
    func openNewsArticles(forCategory category: String, from source: String)
}

// MARK: - Class
class NewsSourcesListRouter {
    weak var viewController: UIViewController?
}

extension NewsSourcesListRouter: NewsSourcesListRouterProtocol {
    func openNewsArticles(forCategory category: String, from source: String) {
        let searchNews = NewsArticlesListRouter.assembleModule(forCategory: category, from: source)
        viewController?.navigationController?.pushViewController(searchNews, animated: true)
    }
    
    static func assembleModule(forCategory category: String) -> UIViewController {
        let storyBoard = UIStoryboard.init(name: "NewsList", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "NewsSourcesListViewController") as! NewsSourcesListViewController
        let presenter = NewsSourcesListPresenter()
        let router = NewsSourcesListRouter()
        let interactor = NewsSourcesListInteractor()

        view.presenter =  presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.category = category
        
        router.viewController = view

        interactor.output = presenter
        
        return view
    }
}
