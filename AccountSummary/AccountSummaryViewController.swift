//
//  AccountSummaryViewController.swift
//  Bankey App
//
//  Created by Mustafa Nour on 11/01/2026.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    // ViewModel
    var viewModel = MainAccountSummaryViewModel()
    
    var headerView = AccountSummaryHeaderView(frame: .zero)
    var tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    lazy var logoutBarButton: UIBarButtonItem  = {
        let barButtonItem =  UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
        //binding viewModel
        bindViewModel()
        setupRefreshControl()
        viewModel.fetchData()
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButton
    }
    
    private func bindViewModel() {
        viewModel.reloadView = { [weak self] in
            self?.ConfigureHeader()
            self?.tableView.reloadData()
        }
        
        viewModel.showError = { error in
            print("Error: \(error)")
            // Future: Show alert to user
        }
    }
    
    private func ConfigureHeader() {
        headerView.configure(viewModel: viewModel.headerViewModel)
    }
    func setupRefreshControl() {
        refreshControl.tintColor = appColor
        refreshControl.addTarget(self , action: #selector(refreshContent), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
}

extension AccountSummaryViewController {
    
    
    private func setup() {
        setupTableView()
        setupTableViewHeader()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = appColor
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AccountSummryCell.self, forCellReuseIdentifier: AccountSummryCell.reuseID)
        tableView.rowHeight =  AccountSummryCell.rowHeight
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupTableViewHeader() {
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size
        tableView.tableHeaderView = headerView
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !viewModel.accountSummaryCellViewModels.isEmpty else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummryCell.reuseID, for: indexPath) as! AccountSummryCell
        
        let vm = viewModel.accountSummaryCellViewModels[indexPath.row]
        cell.configure(with: vm)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.accountSummaryCellViewModels.count
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}

// MARK: - Actions
extension AccountSummaryViewController {
    @objc func logoutTapped(sender: UIBarButtonItem) {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
    
    @objc func refreshContent() {
        viewModel.fetchData()
        self.tableView.refreshControl?.endRefreshing() 
    }
}


