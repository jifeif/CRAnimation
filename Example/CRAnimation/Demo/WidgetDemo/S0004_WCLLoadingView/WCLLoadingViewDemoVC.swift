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
    let controlViewHeight = 40
    let offY = 20
    let SWIFT_WIDTH = UIScreen.main.bounds.size.width
    let SWIFT_HEIGHT = UIScreen.main.bounds.size.height
    
    //MARK: Public Methods
    
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingView.startAnimation()
        view.backgroundColor = UIColor.init(rgba: "#0a090e")
        addTopBar(withTitle: "WCLLoadingView")
        createSizeControlView()
        createDurationControlView()
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
    
    func createControlView() -> Void {
        createSizeControlView()
        createDurationControlView()
    }
    
    func createSizeControlView() {
        
        let sizeControlView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Int(SWIFT_WIDTH) - 2*Int(CR_OFF_X), height: controlViewHeight))
        view.addSubview(sizeControlView)
        
        let sizeLabel = UILabel.init()
        sizeLabel.text = "Size"
        sizeLabel.textColor = UIColor.white
        sizeLabel.sizeToFit()
        sizeControlView.addSubview(sizeLabel)
//        sizeLabel.bearSetCenterToParentView(with: kAXIS.kAXIS_Y)
//        sizeLabel.bearSetRelativeLayout(with: kDIRECTION.DIR_LEFT, destinationView: nil, parentRelation: YES, distance: 0, center: YES)
        
        let sizeControlSlider = CRSlider.init(frame: CGRect.init(x: sizeLabel.maxX(), y: 0, width: sizeControlView.width() - sizeLabel.maxX(), height: sizeControlView.height()))
        sizeControlSlider.sliderType = kCRSliderType_Normal
        sizeControlSlider.minimumValue = 1
        sizeControlSlider.maximumValue = 2
        sizeControlSlider.value = 1
        sizeControlSlider.addTarget(self, action: #selector(WCLLoadingViewDemoVC.sizeSliderValueChange(_:)), for: UIControlEvents.valueChanged)
        sizeControlView.addSubview(sizeControlSlider)
//        sizeControlView.setMaxY(view.height() - 2*controlViewHeight - offY)
        sizeControlView.setMaxY(SWIFT_HEIGHT - 40 - 20)
    }
    
    func createDurationControlView() {
        
        let durationControlView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Int(SWIFT_WIDTH) - 2*Int(CR_OFF_X), height: controlViewHeight))
        view.addSubview(durationControlView)
        
        let durationLabel = UILabel.init()
        durationLabel.text = "Duration"
        durationLabel.textColor = UIColor.white
        durationLabel.sizeToFit()
        durationControlView.addSubview(durationLabel)
        
        let durationControlSlider = CRSlider.init(frame: CGRect.init(x: durationLabel.maxX(), y: 0, width: durationControlView.width() - durationLabel.maxX(), height: durationControlView.height()))
        durationControlSlider.sliderType = kCRSliderType_Normal
        durationControlSlider.minimumValue = 1
        durationControlSlider.maximumValue = 2
        durationControlSlider.value = 1
        durationControlSlider.addTarget(self, action: #selector(WCLLoadingViewDemoVC.durationSliderValueChange(_:)), for: UIControlEvents.valueChanged)
        durationControlView.addSubview(durationControlSlider)
        durationControlView.setMaxY(SWIFT_HEIGHT - 20)
    }
}
