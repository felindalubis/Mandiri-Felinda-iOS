//
//  NewsCategoryListInteractor.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import RxSwift

// MARK: - Protocol
protocol NewsCategoryListInteractorProtocol: AnyObject {
    var presenter: NewsCategoryListPresenterProtocol! { get set }
}

// MARK: - Class
class NewsCategoryListInteractor: NewsCategoryListInteractorProtocol {
    weak var presenter: NewsCategoryListPresenterProtocol!
}
