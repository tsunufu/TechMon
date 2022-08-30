//
//  BattleViewController.swift
//  TechMon
//
//  Created by ryo on 2022/08/30.
//

import UIKit

class BattleViewController: UIViewController {
    
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var playerImageView: UIImageView!
    @IBOutlet var playerHPLabel: UILabel!
    @IBOutlet var playerMPLabel: UILabel!
    
    @IBOutlet var enemyNameLabel: UILabel!
    @IBOutlet var enemyImageView: UIImageView!
    @IBOutlet var enemyHPLabel: UILabel!
    @IBOutlet var enemyMPLabel: UILabel!
    
    let techMonManager = TechMonManager.shared
    
    var playerHP = 100
    var playerMP = 0
    var enemyHP = 200
    var enemyMP = 0
    
    var gameTimer: Timer!
    var isPlayerAttackAvailable: Bool = true


    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNameLabel.text = "勇者"
        playerImageView.image = UIImage(named: "yusya.png")
        playerHPLabel.text = "\(playerHP) / 100"
        playerMPLabel.text = "\(playerMP) / 20"
        
        playerNameLabel.text = "龍"
        playerImageView.image = UIImage(named: "monster.png")
        playerHPLabel.text = "\(enemyHP) / 200"
        playerMPLabel.text = "\(enemyMP) / 35"
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateGame), userInfo: nil, repeats: true)
        
        gameTimer.fire()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        techMonManager.playBGM(fileName: "BGM_battle001")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        techMonManager.stopBGM()
    }
    
    @objc func updateGame() {
        
        playerMP += 1
        if playerMP >= 20 {
            isPlayerAttackAvailable = true
            playerMP = 20
        }
        else {
            isPlayerAttackAvailable = false
        }
        
        playerMPLabel.text = "\(playerMP) / 20"
        enemyMPLabel.text = "\(enemyMP) / 35"
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
