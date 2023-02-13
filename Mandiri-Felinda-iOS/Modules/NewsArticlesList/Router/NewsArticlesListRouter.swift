//
//  NewsArticlesListRouter.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import UIKit

// MARK: - Protocol
protocol NewsArticlesListRouterProtocol: AnyObject {
    static func assembleModule() -> UIViewController
}

// MARK: - Class
class NewsArticlesListRouter {
    static func assembleModule(forCategory category: String, from source: String) -> UIViewController {
        let storyBoard = UIStoryboard.init(name: "NewsArticleList", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "NewsArticlesListViewController") as! NewsArticlesListViewController
        let presenter = NewsArticlesListPresenter()
        let interactor = NewsArticlesListInteractor()

        view.presenter =  presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.category = category
        presenter.source = source
        
        interactor.output = presenter
        
        return view
    }
}
