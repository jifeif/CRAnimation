//
//  CRRollerCoasterLayer.swift
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
//  HomePage:http://imwcl.com
//  CSDN    :http://blog.csdn.net/wang631106979
//
//  Created by 王崇磊 on 16/9/14.
//  Copyright © 2016年 王崇磊. All rights reserved.
//
// @class CRRollerCoasterLayerVC
// @abstract CRRollerCoasterLayerVC
// @discussion CRRollerCoasterLayerVC
//

import UIKit
import CRAnimation

class CRRollerCoasterLayerVC: CRProductionBaseVC {

    //MARK: Public Methods
    
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let frame = UIApplication.shared.keyWindow?.bounds {
            let rollerLayer = RollerCoasterLayer(frame: .init(origin: .zero, size: .init(width: frame.height, height: frame.width)))
            view.layer.addSublayer(rollerLayer)
            
            var transform = CGAffineTransform.identity
            transform  = transform.rotated(by: CGFloat(M_PI_2))
            let offset = (frame.height - frame.width)/2
            transform  = transform.translatedBy(x: offset, y: offset)
            rollerLayer.setAffineTransform(transform)
        }
        addTopBar(withTitle: "RollerCoasterLayer")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
