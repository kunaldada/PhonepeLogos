//
//  ViewController.swift
//  LogosApp
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var levelsTableView: UITableView!
    
    var levelModals: [LevelModal]?
    let allLevelStatus: [LevelStatus] = UserStatusKeeper.shared.getAllLevelStatus()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.levelModals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier: String = ReuseIdentifierConstants.levelsTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        (cell as? LevelsTableViewCell)?.bind(levelTitle: String(format: "Level - %d", indexPath.row), levelStatus: allLevelStatus[indexPath.row].levelStatusType.associatedString)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let levelModals = self.levelModals,
            levelModals.count > indexPath.row else {
                return
        }
        let levelModal: LevelModal = levelModals[indexPath.row]
        let detailViewController: LevelDetailViewContollerViewController = LevelDetailViewContollerViewController(levelModal: levelModal, logoStatus: allLevelStatus[indexPath.row].logoStatus)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
}
