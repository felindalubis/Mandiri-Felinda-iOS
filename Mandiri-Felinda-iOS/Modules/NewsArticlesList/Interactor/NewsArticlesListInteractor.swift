//
//  NewsArticlesListInteractor.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import RxSwift

// MARK: - Protocol
protocol NewsArticlesListInteractorProtocol: AnyObject {
    var output: NewsArticlesListOutputProtocol! { get set }
    
    func fetchNews(_ category: String, from: String)
}

// MARK: - Class
class NewsArticlesListInteractor {
    weak var output: NewsArticlesListOutputProtocol!
    private var disposeBag = DisposeBag()
}

extension NewsArticlesListInteractor: NewsArticlesListInteractorProtocol {
    func fetchNews(_ category: String, from: String) {
        APIServices.fetchNews(forCategory: category, from: from).subscribe(onNext: { sources in
            self.output.fetchNews(sources)
        }, onError: { error in
            self.output.failedFetchNews()
        }).disposed(by: disposeBag)
    }
}
