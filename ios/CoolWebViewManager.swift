//
//  File.swift
//  nativelib
//
//  Created by Moises Miranda Vilas Boas on 17/12/22.
//

import Foundation

@objc(CoolWebViewManager)
class CoolWebViewManager: RCTViewManager{
  override func view() -> UIView! {
    let label = UILabel()
    
    label.text = "Hello Dude I'm native code swift and RN"
    
    label.textColor = .blue
    label.textAlignment = .center
    return label
  }
  
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

