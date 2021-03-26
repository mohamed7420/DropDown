//
//  ViewController.swift
//  DropDown
//
//  Created by Mohamed osama on 26/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var dataSource = [String]()
    private var tableViewHeight: NSLayoutConstraint?
    private var isOpen: Bool = false
    
    private let customButton: CustomButton = {
        let button = CustomButton(type: .system)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 5
        button.tintColor = .white
        button.setTitle("Select", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleDropDown(sender:)), for: .touchUpInside)
        return button
    }()

    private let tableView: UITableView = {
       let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func didMove(toParent parent: UIViewController?) {
    
    }

    
    private func configureUI(){
        view.backgroundColor = .darkGray
        self.setupTableView()
        self.setupDataSource()

        view.addSubview(customButton)
        customButton.translatesAutoresizingMaskIntoConstraints = false
        customButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        customButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: customButton.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: customButton.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: customButton.bottomAnchor).isActive = true
    }
    
    private func setupDataSource(){
        self.dataSource = ["Mohamed" , "Osama" , "Ahmed", "Yousef"]
    }
    
//    MARK:- Selectors
    
    @objc func handleDropDown(sender: UIButton){
        if isOpen == false{
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
                self.tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
                self.tableView.layoutIfNeeded()
            }, completion: nil)
            isOpen = true
        }else{
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
                self.tableView.heightAnchor.constraint(equalToConstant: 0).isActive = true
                self.tableView.layoutIfNeeded()
            }, completion: nil)
            isOpen = false
        }
    
    }
    

}


extension ViewController: UITableViewDelegate , UITableViewDataSource{

    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        self.tableView.reloadData()
        self.tableView.layoutIfNeeded()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = UITableViewCell()
        tableViewCell.textLabel?.text = self.dataSource[indexPath.row]
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.customButton.setTitle(dataSource[indexPath.row], for: .normal)
    }
    
}
