//
//  BaseMVVMProtocol.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation

//Here we can declarate optional funcs to all models
@objc protocol BaseMVVMProtocol: AnyObject {
    @objc optional func optional()
}
