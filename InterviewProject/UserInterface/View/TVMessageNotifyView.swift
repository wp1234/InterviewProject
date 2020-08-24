//
//  TVMessageNotifyView.swift
//  InterviewProject
//
//  Created by Eric on 2020/8/24.
//  Copyright © 2020 Tortuga Ventures. All rights reserved.
//

import UIKit

class TVMessageNotifyView: UIView, CAAnimationDelegate {

    var showView: UIView?
    var mainView: UIView?
    var label: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setViews()
        self.bindDataInfo()
    }
    
    
    func setViews() {
        self.backgroundColor = .red
        
        let mainViewX: CGFloat = 10
        let mainViewW: CGFloat = UIScreen.main.bounds.width - mainViewX * 2
        let mainViewY: CGFloat = -40
        let mainViewH: CGFloat = 40
        
        self.mainView = UIView.init(frame: CGRect.init(x: mainViewX, y: mainViewY, width: mainViewW, height: mainViewH))
        self.mainView!.layer.cornerRadius = 6
        self.mainView!.layer.masksToBounds = true
        self.mainView?.backgroundColor = .orange
        
        self.addSubview(self.mainView!)
        
        let titleLW: CGFloat = mainViewW - 30
        let titleLH: CGFloat = 20
        let titleLY: CGFloat = 10
        let titleLX: CGFloat = mainViewW * 0.5 - titleLW * 0.5
        
        self.label = UILabel.init(frame: CGRect.init(x: titleLX, y: titleLY, width: titleLW, height: titleLH))
        self.label?.textAlignment = .center
        self.label?.textColor = .black
        self.label?.font = UIFont.boldSystemFont(ofSize: 13.0)
        self.label?.text = "有一条新消息"
        self.mainView?.addSubview(self.label!)
        self.mainView?.isHidden = true
        
    }
    
    
    func bindDataInfo() {
        TVMessageManager.sharedInstance.newDataSig.observe(Signal<(date: String?, messageModel: TVMessageModel?), Error>.Observer() { (messageInfo) in
            if messageInfo.value != nil {
                self.showNotifyView()
            }
        })
    }
    
    func showNotifyView() {
        
        self.mainView?.isHidden = false
        
        let fromPoint = self.mainView!.center
        var oldPoint = self.mainView!.center
        oldPoint.y += self.mainView!.frame.size.height
        
        var settlingDuratoin: CFTimeInterval = 0
        
        let springAnim: CASpringAnimation = CASpringAnimation.init(keyPath: "position")
        
        springAnim.fromValue = NSValue.init(cgPoint: fromPoint)
        springAnim.toValue = NSValue.init(cgPoint: oldPoint)
        springAnim.isRemovedOnCompletion = false
        springAnim.fillMode = CAMediaTimingFillMode.forwards
        springAnim.stiffness = 60
        springAnim.duration = springAnim.settlingDuration
        self.mainView?.layer.add(springAnim, forKey: nil)
        
        settlingDuratoin = springAnim.settlingDuration;
        
        let basicAnim = CABasicAnimation.init(keyPath: "position")
        basicAnim.duration = 0.25
        
        basicAnim.beginTime = CACurrentMediaTime() + settlingDuratoin + 1.5

        basicAnim.fromValue = NSValue.init(cgPoint: oldPoint)
        basicAnim.toValue = NSValue.init(cgPoint: fromPoint)
        basicAnim.isRemovedOnCompletion = false
        basicAnim.fillMode = CAMediaTimingFillMode.forwards
        basicAnim.delegate = self
        self.mainView?.layer.add(basicAnim, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.mainView?.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
