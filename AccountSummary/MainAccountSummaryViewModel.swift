//
//  MainAccountSummaryViewModel.swift
//  Bankey App
//
//  Created by Mustafa Nour on 19/02/2026.
//

import Foundation

class MainAccountSummaryViewModel {
    
    // Model Data
    var profile: Profile?
    var accounts: [Account] = []
    // ViewModel Data for UI
    var accountSummaryCellViewModels: [Accounts] = []
    var headerViewModel = AccountsModel(welcomeMessage: "welcome", name: "", date: Date())

    // Binding
    var reloadView: (() -> Void)?
    var showError: ((String) -> Void)?

    func fetchData() {
        //creating a group
        let group = DispatchGroup()
        // the signal of starting some action
        group.enter()
        fetchProfile(forUserId: "1") { [weak self] result in
            switch result {
            case .success(let profile):
                self?.profile = profile
                self?.configureHeader(with: profile)
            case .failure(let error):
                self?.showError?(error.localizedDescription)
            }
            // action is done
            group.leave()
        }
        
        group.enter()
        fetchAccounts(forUserId: "1") { [weak self] result in
            switch result {
            case .success(let accounts):
                self?.accounts = accounts
                self?.configureTableViewCells(with: accounts)
            case .failure(let error):
                self?.showError?(error.localizedDescription)
            }
            group.leave()
        }
        // this will be performed after the other two is done 
        group.notify(queue: .main) { [weak self] in
            self?.reloadView?()
        }
    }
    
    private func configureHeader(with profile: Profile) {
        headerViewModel = AccountsModel(welcomeMessage: "GoodMorning",
                                        name: profile.firstName,
                                        date: Date())
    }
    
    private func configureTableViewCells(with accounts: [Account]) {
        accountSummaryCellViewModels = accounts.map {
            Accounts(accountType: $0.type, accountName: $0.name, balance: $0.amount)
        }
    }
}
