//
//  WCLLoadingViewDemoVC.swift
//  CRAnimation
//
// **************************************************
// *                                  _____         *
// *         __  _  __     ___        \   /         *
// *         \ \/ \/ /    / __\       /  /          *
// *          \  _  /    | (__       /  /           *
// *           \/ \/      \___/     /  /__          *
// *                               /_____/          *
// *                                                *
// **************************************************
//  Github  :https://github.com/631106979
//  HomePage:https://imwcl.com
//  CSDN    :http://blog.csdn.net/wang631106979
//
//  Created by 王崇磊 on 16/9/14.
//  Copyright © 2016年 王崇磊. All rights reserved.
//
// @class WCLLoadingViewDemoVC
// @abstract WCLLoadingView的DemoVC
// @discussion WCLLoadingView的DemoVC
//

import UIKit

class WCLLoadingViewDemoVC: CRProductionBaseVC {

    @IBOutlet weak var loadingView: WCLLoadingView!
    let controlViewHeight = 30
    //MARK: Public Methods
    
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingView.startAnimation()
        view.backgroundColor = UIColor.init(rgba: "#0a090e")
        addTopBar(withTitle: "WCLLoadingView")
//        createSliderView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Target Methods
    @IBAction func tapLoadingView(_ sender: UITapGestureRecognizer) {
        switch loadingView.status {
        case .animating:
            loadingView.pauseAnimation()
        case .pause:
            loadingView.resumeAnimation()
        case .normal:
            loadingView.startAnimation()
        }
    }
    
    @IBAction func sizeSliderValueChange(_ sender: UISlider) {
        loadingView.transform = CGAffineTransform.identity.scaledBy(x: CGFloat(sender.value) , y: CGFloat(sender.value))
    }
    
    @IBAction func durationSliderValueChange(_ sender: UISlider) {
        loadingView.duration = Double(sender.value)
    }
    
    func createSizeControlView() {
        
        let sizeControlView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Int(view.width()) - 2*Int(CR_OFF_X), height: controlViewHeight))
        view.addSubview(sizeControlView)
        
        let sizeLabel = UILabel.init()
        sizeLabel.text = "Size"
        sizeLabel.textColor = UIColor.white
        sizeLabel.sizeToFit()
        sizeControlView.addSubview(sizeLabel)
//        kSDIR_LEFT
//        kDIRECTION.kDIR_LEFT
//        kSDIRECTION.SDIR_LEFT
//        kDIRECTION(kDIR_LEFT)
//        sizeLabel.bearSetRelativeLayout(with: kDIRECTION, destinationView: nil, parentRelation: YES, distance: 0, center: YES)
//        sizeLabel.bearSetRelativeLayout(with: kDIRECTION.DIR_LEFT, destinationView: nil, parentRelation: YES, distance: 0, center: YES)
        
        let testSlider = CRSlider.init(frame: CGRect.init(x: 50, y: 300, width: 200, height: 30))
        testSlider.sliderType = kCRSliderType_Normal
        view.addSubview(testSlider)
    }
    
    func createDurationControlView() {
        let durationControlView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Int(view.width()) - 2*Int(CR_OFF_X), height: controlViewHeight))
        view.addSubview(durationControlView)
    }
}
