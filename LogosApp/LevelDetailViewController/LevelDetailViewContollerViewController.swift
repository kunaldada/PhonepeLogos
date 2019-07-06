//
//  LevelDetailViewContollerViewController.swift
//  LogosApp
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit

class LevelDetailViewContollerViewController: UIViewController {

    private var levelModal: LevelModal?
    private var logoStatus: [LogoStatus]?
    
    @IBOutlet weak var detailTableView: UITableView!
    init(levelModal: LevelModal, logoStatus: [LogoStatus]) {
        super.init(nibName: "LevelDetailViewContollerViewController", bundle: nil)
        self.levelModal = levelModal
        self.logoStatus = logoStatus
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LevelDetailViewContollerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.levelModal?.logos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier: String = ReuseIdentifierConstants.levelDetailTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if let logoModal = self.levelModal?.logos?[indexPath.row], let logoStatus = self.logoStatus?[indexPath.row] {
            (cell as? LevelDetailTableViewCell)?.bind(logoModal: logoModal, logoStatus: logoStatus)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let logoModal = self.levelModal?.logos?[indexPath.row], let logoStatus = self.logoStatus?[indexPath.row] {
            
        }
    }
    
    
}
