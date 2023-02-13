//
//  NewsListViewController.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 13/02/23.
//

import UIKit

// MARK: - Protocol
protocol NewsSourcesListViewProtocol: AnyObject {
    var presenter: NewsSourcesListPresenterProtocol! { get set }
    func showEmptyData()
    func showNewsSources(_ data: [Source])
}

// MARK: - Class
class NewsSourcesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var presenter: NewsSourcesListPresenterProtocol!
    var sources: [Source] = [] {
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
        self.navigationItem.title = "Sources"
    }
}

// MARK: - Setups
extension NewsSourcesListViewController {
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
extension NewsSourcesListViewController: NewsSourcesListViewProtocol {
    func showEmptyData() {
        spinner.stopAnimating()
        let label = UILabel(frame: CGRect(origin: tableView.center, size: CGSize(width: tableView.frame.width, height: 200)))
        label.center = tableView.center
        label.textAlignment = .center
        label.text = "There's no sources for this category"

        self.view.addSubview(label)
    }
    
    func showNewsSources(_ data: [Source]) {
        spinner.stopAnimating()
        self.sources = data
    }
}

// MARK: - UITableView Delegate & Data Source
extension NewsSourcesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = sources[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectSources(sources[indexPath.row].id ?? "")
    }
}
