//
//  ViewController.swift
//  HyAlbum
//
//  Created by 장혜준 on 2018. 5. 15..
//  Copyright © 2018년 장혜준. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    // MARK: - Properties
    var timer: Timer?
    var timeInterval: TimeInterval = 1
    var imageIndex: Int = 0
    var isStart: Bool = false
    var imageArray: [String] = [String]()
    
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    // MARK: - Methods
    
    // MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setInterval()
        self.getImage()
    }
    
    
    // MARK: IBActions
    @IBAction func touchedPlusBtn(_ sender: UIButton) {
        self.timeInterval = self.timeInterval < 10 ? self.timeInterval + 1 : self.timeInterval
        self.setInterval()
        
        self.applyBtn.isHidden = self.isStart ? false : true
    }
    
    @IBAction func touchedMinusBtn(_ sender: UIButton) {
        self.timeInterval = self.timeInterval > 1 ? self.timeInterval - 1 : self.timeInterval
        self.setInterval()
        
        self.applyBtn.isHidden = self.isStart ? false : true
    }
    
    @IBAction func touchedApplyBtn(_ sender: UIButton) {
        self.applyBtn.isHidden = true
        self.stopTimer()
        self.nextImage()
        self.setTimer()
    }
    
    @IBAction func touchedStartButton(_ sender: UIButton) {
        let title: String?
        
        // 정지버튼 눌리고 난 후 정지할 때
        if self.isStart {
            title = "시작"
            self.isStart = false
            self.stopTimer()
        }
        
        // 시작버튼 눌리고 난 후 시작할 때
        else {
            title = "정지"
            self.isStart = true
            self.nextImage()
            self.setTimer()
        }
        
        self.startBtn.setTitle(title, for: .normal)
    }
    
    // MARK: Custom Methods
    func setInterval() {
        self.intervalLabel.text = String(Int(timeInterval))
        
        self.plusBtn.isEnabled = self.timeInterval == 10 ? false : true
        self.minusBtn.isEnabled = self.timeInterval == 1 ? false : true
    }
    
    func setTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: self.timeInterval + 1, target: self, selector: #selector(self.nextImage), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        if self.timer != nil {
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    
    func getImage() {
        API.getPhotos { feed in
            self.imageArray += feed.imageURLArray
        }
    }
    
    @objc func nextImage() {
        self.imageIndex += 1
        
        if imageIndex > self.imageArray.count - 5 {
            self.getImage()
        }
        
        UIView.transition(with: self.view, duration: 1, options: [.transitionCrossDissolve, .allowUserInteraction], animations: {
            self.imageView.kf.setImage(with:URL(string: self.imageArray[self.imageIndex]))
        }, completion: nil)
    }

}

