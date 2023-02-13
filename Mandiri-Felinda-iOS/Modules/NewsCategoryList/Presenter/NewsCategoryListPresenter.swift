//
//  NewsCategoryListPresenter.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import Foundation

// MARK: - Protocol
protocol NewsCategoryListPresenterProtocol: AnyObject {
    var view: NewsCategoryListViewProtocol? { get set }
    var interactor: NewsCategoryListInteractorProtocol! { get set }
    var router: NewsCategoryListRouterProtocol! { get set }
    
    func didSelectCategory(category: String)
}

// MARK: - Class
class NewsCategoryListPresenter {
    weak var view: NewsCategoryListViewProtocol?
    var router: NewsCategoryListRouterProtocol!
    var interactor: NewsCategoryListInteractorProtocol!
}

// MARK: - Protocol methods
extension NewsCategoryListPresenter: NewsCategoryListPresenterProtocol {
    func didSelectCategory(category: String) {
        router.openNewsSources(withCategory: category)
    }
}

