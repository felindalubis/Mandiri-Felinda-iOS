//
//  NewsArticlesListViewController.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import UIKit

// MARK: - Protocol
protocol NewsArticlesListViewProtocol: AnyObject {
    var presenter: NewsArticlesListPresenterProtocol! { get set }
    func showEmptyData()
    func showNewsSources(_ data: [Article])
}

// MARK: - Class
class NewsArticlesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    var presenter: NewsArticlesListPresenterProtocol!
    var articles: [Article] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Articles"
    }
}

// MARK: - Setups
extension NewsArticlesListViewController {
    private func setupSubviews() {
        setupTableView()
        setupSpinner()
    }
    
    private func setupSpinner() {
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        // setup custom cells
    }
}

// MARK: - Protocol Methods
extension NewsArticlesListViewController: NewsArticlesListViewProtocol {
    func showEmptyData() {
        spinner.stopAnimating()
        let label = UILabel(frame: CGRect(origin: tableView.center, size: CGSize(width: tableView.frame.width, height: 200)))
        label.center = tableView.center
        label.textAlignment = .center
        label.text = "There's no articles for this sources"

        self.view.addSubview(label)
    }
    
    func showNewsSources(_ data: [Article]) {
        spinner.stopAnimating()
        self.articles = data
    }
}

// MARK: - UITableView Delegate & Data Source
extension NewsArticlesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectArticle(withUrl: articles[indexPath.row].url ?? "")
    }
}
