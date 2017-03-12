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

public let SWIFT_WIDTH = UIScreen.main.bounds.size.width
public let SWIFT_HEIGHT = UIScreen.main.bounds.size.height
public let color_0a090e = UIColor.init(rgba: "#0a090e")

class WCLLoadingViewDemoVC: CRProductionBaseVC {

    @IBOutlet weak var loadingView: WCLLoadingView!
    let controlViewHeight = 40
    let offY: CGFloat = 30
    let gapX: CGFloat = 10
    
    //MARK: Public Methods
    
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingView.startAnimation()
        view.backgroundColor = color_0a090e
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
        
        let sizeControlView = UIView.init(frame: CGRect.init(x: Int(CR_OFF_STARTX), y: 0, width: Int(SWIFT_WIDTH) - Int(CR_OFF_STARTX + CR_OFF_ENDX), height: controlViewHeight))
        view.addSubview(sizeControlView)
        
        let sizeLabel = UILabel.init()
        sizeLabel.text = "Size"
        sizeLabel.textColor = UIColor.white
        sizeLabel.sizeToFit()
        sizeControlView.addSubview(sizeLabel)
        sizeLabel.bearSetRelativeLayout(with: .DIR_LEFT, destinationView: nil, parentRelation: true, distance: 0, center: true)
        
        let sizeControlSlider = CRSlider.init(frame: CGRect.init(x: sizeLabel.maxX() + gapX, y: 0, width: sizeControlView.width() - sizeLabel.maxX() - gapX, height: sizeControlView.height()))
        sizeControlSlider.sliderType = kCRSliderType_Normal
        sizeControlSlider.minimumValue = 1
        sizeControlSlider.maximumValue = 2
        sizeControlSlider.value = 1
        sizeControlSlider.addTarget(self, action: #selector(WCLLoadingViewDemoVC.sizeSliderValueChange(_:)), for: UIControlEvents.valueChanged)
        sizeControlView.addSubview(sizeControlSlider)
        sizeControlView.setMaxY(SWIFT_HEIGHT - CGFloat(controlViewHeight) - offY)
    }
    
    func createDurationControlView() {
        
        let durationControlView = UIView.init(frame: CGRect.init(x: Int(CR_OFF_STARTX), y: 0, width: Int(SWIFT_WIDTH) - Int(CR_OFF_STARTX + CR_OFF_ENDX), height: controlViewHeight))
        view.addSubview(durationControlView)
        
        let durationLabel = UILabel.init()
        durationLabel.text = "Duration"
        durationLabel.textColor = UIColor.white
        durationLabel.sizeToFit()
        durationControlView.addSubview(durationLabel)
        durationLabel.bearSetRelativeLayout(with: .DIR_LEFT, destinationView: nil, parentRelation: true, distance: 0, center: true)
        
        let durationControlSlider = CRSlider.init(frame: CGRect.init(x: durationLabel.maxX() + gapX, y: 0, width: durationControlView.width() - durationLabel.maxX() - gapX, height: durationControlView.height()))
        durationControlSlider.sliderType = kCRSliderType_Normal
        durationControlSlider.minimumValue = 1
        durationControlSlider.maximumValue = 2
        durationControlSlider.value = 1
        durationControlSlider.addTarget(self, action: #selector(WCLLoadingViewDemoVC.durationSliderValueChange(_:)), for: UIControlEvents.valueChanged)
        durationControlView.addSubview(durationControlSlider)
        durationControlView.setMaxY(SWIFT_HEIGHT - offY)
    }
}
