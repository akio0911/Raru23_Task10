//
//  ViewController.swift
//  Task10App
//
//  Created by 山崎喜代志 on 2021/04/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    private let prefectures = Prefectures()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefectures.prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = prefectures.prefectures[indexPath.row]
        cell.detailTextLabel?.text = "\(indexPath.row + 1)番目の都道府県です"
        cell.backgroundColor = changeCellBackgroundColor(index: indexPath.row)

        return cell
    }

    private func changeCellBackgroundColor(index: Int) -> UIColor {

        let num = index % 3

        switch num {
        case 0:
            return .red
        case 1:
            return .blue
        case 2:
            return .green
        default:
            return .white
        }
    }
}
