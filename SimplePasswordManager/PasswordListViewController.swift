import UIKit

class PasswordListViewController: UIViewController {

    private var tableView: UITableView!

    // Array to display tableview
    private var items: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let rightNavBtn =  UIBarButtonItem(barButtonSystemItem:  .add, target: self, action: #selector(rightBarBtnClicked))
        navigationItem.rightBarButtonItem = rightNavBtn

        items = ["Apple", "Water melon", "Peach", "Cherry", "Grapes", "pear"]

        // initialize tableview
        tableView = UITableView()

        // set delegate
        tableView.delegate = self
        tableView.dataSource = self

        // set tableview size
        tableView.frame = view.frame

        // set tableview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
        
        
    }

    @objc func rightBarBtnClicked(sender: UIButton){
        print("rightBarBtnClicked")
        let navigationController = UINavigationController(rootViewController: AddPasswordViewController())
        present(navigationController, animated: true)
    }


}


extension PasswordListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))! as UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) cell was selected")
        navigationController?.pushViewController(PasswordDetailViewController(), animated: true)
    }
}
