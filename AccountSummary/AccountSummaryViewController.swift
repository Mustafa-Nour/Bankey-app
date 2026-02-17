//
//  AccountSummaryViewController.swift
//  Bankey App
//
//  Created by Mustafa Nour on 11/01/2026.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    //model
    var profile: Profile?
    //viewmodel
    var headerViewmodel = headerViewModel(welcomeMessage: "welcome", name: "", date: Date())
    
    
    var headerView = AccountSummaryHeaderView(frame: .zero)
    
    var accountSummaryCellViewModel: [AccountSummryCell.ViewModel] = []
    var accounts: [AccountSummryCell.ViewModel] = []
    
    var tableView = UITableView()
    
    // MARK: -  lazy var means that he will instantiated as soon as the vc is created
    
   lazy var logoutBarButton: UIBarButtonItem  = {
        let barButtonItem =  UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButton
    }
}

extension AccountSummaryViewController {
    private func setup() {
        setupTableView()
        setupTableViewHeader()
        fetchDataAndLoadViews()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = appColor
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
        
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size
        tableView.tableHeaderView = headerView
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
    
    private func fetchDataAndLoadViews() {
        fetchProfile(forUserId: "1") { result in
            switch result {
            case .success(let profile) :
                self.profile = profile
                self.ConfigureHeader(with: profile)
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func ConfigureHeader(with profile : Profile) {
        let vm = headerViewModel(welcomeMessage: "GoodMorning",
                                                    name: profile.firstName,
                                                    date: Date())
        headerView.configure(viewModel: vm)
    }
}

// MARK: -  Actions

extension AccountSummaryViewController {
    @objc func logoutTapped(sender: UIButton) {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
}
