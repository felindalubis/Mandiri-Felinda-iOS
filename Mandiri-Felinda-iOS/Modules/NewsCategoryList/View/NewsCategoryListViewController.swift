//
//  NewsCategoryListViewController.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import UIKit

// MARK: - Protocol
protocol NewsCategoryListViewProtocol: AnyObject {
    var presenter: NewsCategoryListPresenterProtocol! { get set }
}

// MARK: - Class
class NewsCategoryListViewController: UIViewController, NewsCategoryListViewProtocol {
    static let identifier = "NewsCategoryListViewController"
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: NewsCategoryListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = Constants.PAGE_TITLE_CATEGORY
    }
}

// MARK: - Setups
extension NewsCategoryListViewController {
    func setupSubviews() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self        
    }
}
// MARK: - UITableView Delegate & Data Source
extension NewsCategoryListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsCategoryList.category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = NewsCategoryList.category[indexPath.row].capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCategory(category: NewsCategoryList.category[indexPath.row])
    }
}
