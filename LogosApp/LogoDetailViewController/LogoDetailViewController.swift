//
//  LogoDetailViewController.swift
//  LogosApp
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit

class LogoDetailViewController: UIViewController {

    private var logoModal: LogoModal?
    private var logoStatus: LogoStatus?
    private var levelPoints: LevelPoints?
    @IBOutlet weak var aboveSequenceStack: UIStackView!
    @IBOutlet weak var belowSequenceStack: UIStackView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var timerValueLabel: UILabel!
    
    @IBOutlet weak var showNextLetterButton: UIButton!
    @IBOutlet weak var storedResponseLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayAllSequenceLetter()
        // Do any additional setup after loading the view.
    }


    init(logoModal: LogoModal, logoStatus: LogoStatus, levelPoints: LevelPoints) {
        super.init(nibName: "LogoDetailViewController", bundle: nil)
        self.logoModal = logoModal
        self.logoStatus = logoStatus
        self.levelPoints = levelPoints
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func displayAllSequenceLetter() {
        let randomSequence: [Character] = RandomSequenceGenerator.getRandomSequence(originalName: self.logoModal?.name ?? "")
        
        var sequenceIndex: Int = 0
        
        for view in aboveSequenceStack.subviews {
            if let button = view as? UIButton {
                button.setTitle(String(randomSequence[sequenceIndex]), for: .normal)
                button.setTitle(String(randomSequence[sequenceIndex]), for: .highlighted)
            }
        }
        
        for view in belowSequenceStack.subviews {
            if let button = view as? UIButton {
                button.setTitle(String(randomSequence[sequenceIndex]), for: .normal)
                button.setTitle(String(randomSequence[sequenceIndex]), for: .highlighted)
            }
        }
        
    }
    
    @IBAction func letterTapped(_ sender: Any) {
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
