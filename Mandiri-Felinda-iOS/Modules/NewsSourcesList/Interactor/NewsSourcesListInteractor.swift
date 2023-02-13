//
//  NewsListInteractor.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import RxSwift

// MARK: - Protocol
protocol NewsSourcesListInteractorProtocol: AnyObject {
    var output: NewsSourcesListOutputProtocol! { get set }
    
    func fetchNews(_ category: String)
}

// MARK: - Class
class NewsSourcesListInteractor {
    weak var output: NewsSourcesListOutputProtocol!
    private var disposeBag = DisposeBag()
}

extension NewsSourcesListInteractor: NewsSourcesListInteractorProtocol {
    func fetchNews(_ category: String) {
        APIServices.fetchSources(for: category).subscribe(onNext: { sources in
            self.output.fetchSources(sources)
        }, onError: { error in
            self.output.failedFetchNews()
        }).disposed(by: disposeBag)
    }
}
