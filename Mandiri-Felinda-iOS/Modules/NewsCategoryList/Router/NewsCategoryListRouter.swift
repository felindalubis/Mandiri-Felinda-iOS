//
//  NewsCategoryListRouter.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import UIKit

// MARK: - Protocol
protocol NewsCategoryListRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    
    func openNewsSources(withCategory category: String)
    static func assembleModule() -> UIViewController
}

// MARK: - Class
class NewsCategoryListRouter {
    weak var viewController: UIViewController?
}

// MARK: - Protocol methods
extension NewsCategoryListRouter: NewsCategoryListRouterProtocol {
    func openNewsSources(withCategory category: String) {
        let sourcesList = NewsSourcesListRouter.assembleModule(forCategory: category)
        viewController?.navigationController?.pushViewController(sourcesList, animated: true)
    }
    
    static func assembleModule() -> UIViewController {
        let storyBoard = UIStoryboard.init(name: "NewsCategory", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "NewsCategoryListViewController") as! NewsCategoryListViewController
        let presenter = NewsCategoryListPresenter()
        let router = NewsCategoryListRouter()
        let interactor = NewsCategoryListInteractor()
        
        let navigation = UINavigationController(rootViewController: view)
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        view.presenter =  presenter
        
        router.viewController = view
        
        interactor.presenter = presenter
        
        return navigation
    }
    
}
