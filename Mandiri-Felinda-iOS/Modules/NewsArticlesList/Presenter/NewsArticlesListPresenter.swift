//
//  NewsArticlesListPresenter.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import Foundation

// MARK: - Protocol
protocol NewsArticlesListOutputProtocol: AnyObject {
    func fetchNews(_ data: NewsList)
    func failedFetchNews()
}

protocol NewsArticlesListPresenterProtocol: AnyObject {
    var view: NewsArticlesListViewProtocol? { get set }
    
    func viewDidLoad()
    func didSelectArticle(withUrl url: String)
}
// MARK: - Class
class NewsArticlesListPresenter {
    weak var view: NewsArticlesListViewProtocol?
    var router: NewsArticlesListRouterProtocol!
    var interactor: NewsArticlesListInteractorProtocol!
    var category: String = ""
    var source: String = ""

    var newsList: NewsList? {
        didSet {
            guard let articles = newsList?.articles else { return }
            if articles.count > 0 {
                view?.showNewsSources(articles)
            } else {
                view?.showEmptyData()
            }
        }
    }
}

// MARK: - Protocol methods
extension NewsArticlesListPresenter: NewsArticlesListOutputProtocol {
    func fetchNews(_ data: NewsList) {
        self.newsList = data
    }
    
    func failedFetchNews() {
        print("Error fetch news")
    }
}

extension NewsArticlesListPresenter: NewsArticlesListPresenterProtocol {
    func viewDidLoad() {
        interactor.fetchNews(category, from: source)
    }
    
    func didSelectArticle(withUrl url: String) {
        router.openNews(withUrl: url)
    }
}
