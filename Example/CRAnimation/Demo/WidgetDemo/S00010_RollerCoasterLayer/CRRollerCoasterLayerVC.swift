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
        addTopBar(withTitle: "RollerCoasterLayer")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let rollerLayer = RollerCoasterLayer(frame: view.bounds)
//        view.layer.addSublayer(rollerLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
