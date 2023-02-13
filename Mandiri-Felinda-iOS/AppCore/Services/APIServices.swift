//
//  APIServices.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import Foundation
import Alamofire
import RxSwift

class APIServices {
    static func fetchSources(for category: String) -> Observable<NewsSource> {
        return Observable<NewsSource>.create({ observer -> Disposable in
            let request = AF
                .request(Endpoints.News.category(category: category).url, method: .get)
                .validate()
                .responseString(completionHandler: { response in
                    switch response.result {
                    case .success:
                        guard let getData = response.data else {
                            return
                        }
                        
                        do {
                            let decoded = try JSONDecoder().decode(NewsSource.self, from: getData)
                            observer.onNext(decoded)
                            observer.onCompleted()
                        } catch (let error) {
                            observer.onError(error)
                        }
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                })
            return Disposables.create(with: {
                request.cancel()
            })
            
        })
    }
    
    static func fetchNews(forCategory category: String, from source: String) -> Observable<NewsList> {
        return Observable<NewsList>.create({ observer -> Disposable in
            let request = AF
                .request(Endpoints.News.everything(category: category, source: source).url, method: .get)
                .validate()
                .responseString(completionHandler: { response in
                    switch response.result {
                    case .success:
                        guard let getData = response.data else {
                            return
                        }
                        
                        do {
                            let decoded = try JSONDecoder().decode(NewsList.self, from: getData)
                            observer.onNext(decoded)
                            observer.onCompleted()
                        } catch (let error) {
                            observer.onError(error)
                        }
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                })
            return Disposables.create(with: {
                request.cancel()
            })
            
        })
    }
}


