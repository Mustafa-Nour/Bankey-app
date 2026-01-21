//
//  AccountSummaryViewController.swift
//  Bankey App
//
//  Created by Mustafa Nour on 11/01/2026.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    var accounts: [AccountSummryCell.ViewModel] = []
    
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

extension AccountSummaryViewController {
    private func setup() {
        setupTableView()
        setupTableViewHeader()
        fetchData()

    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // MARK: - registering our tableView cell into the view controller
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
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        tableView.tableHeaderView = header
    }
    
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // MARK: - Guard to avoid force unwrap the reusable cell
        guard !accounts.isEmpty else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummryCell.reuseID, for: indexPath) as! AccountSummryCell
        
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AccountSummaryViewController {
    private func fetchData() {
        let savings = AccountSummryCell.ViewModel(accountType: .Banking, accountName: "Basic Savings")
        
        let visa   = AccountSummryCell.ViewModel(accountType: .CredintCard , accountName: "Visa Avion Card")
        
        let investment = AccountSummryCell.ViewModel(accountType: .Investment, accountName: "Tax-Free Saver")
        
        accounts.append(savings)
        accounts.append(visa)
        accounts.append(investment)
    }
}
