//
//  NewsSourcesListPresenter.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import Foundation

// MARK: - Protocol
protocol NewsSourcesListOutputProtocol: AnyObject {
    func fetchSources(_ data: NewsSource)
    func failedFetchNews()
}

protocol NewsSourcesListPresenterProtocol: AnyObject {
    var view: NewsSourcesListViewProtocol? { get set }
    
    func viewDidLoad()
    func didSelectSources(_ source: String)
}
// MARK: - Class
class NewsSourcesListPresenter {
    weak var view: NewsSourcesListViewProtocol?
    var router: NewsSourcesListRouterProtocol!
    var interactor: NewsSourcesListInteractorProtocol!
    var category: String = ""
    
    var newsSources: NewsSource? {
        didSet {
            guard let sources = newsSources?.sources else { return }
            if sources.count > 0 {
                view?.showNewsSources(sources)
            } else {
                view?.showEmptyData()
            }
        }
    }
}

// MARK: - Protocol methods
extension NewsSourcesListPresenter: NewsSourcesListOutputProtocol {
    func fetchSources(_ data: NewsSource) {
        self.newsSources = data
    }
    
    func failedFetchNews() {
        view?.showEmptyData()
    }
}

extension NewsSourcesListPresenter: NewsSourcesListPresenterProtocol {
    func viewDidLoad() {
        interactor.fetchNews(category)
    }
    
    func didSelectSources(_ source: String) {
        router.openNewsArticles(forCategory: category, from: source)
    }
}
