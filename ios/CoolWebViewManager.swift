//
//  File.swift
//  nativelib
//
//  Created by Moises Miranda Vilas Boas on 17/12/22.
//

import SwiftUI
import Foundation

struct ContentView: View {
  var body: some View {

    Text("It's workinng with SWIFTUI BRO!!! ")
  }
}

struct ContentViewWrapper: UIViewControllerRepresentable {
  func makeUIViewController(context: UIViewControllerRepresentableContext<ContentViewWrapper>) -> UIViewController {
    let hostingController = UIHostingController(rootView: ContentView())
    return hostingController
  }
  
  func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ContentViewWrapper>) {
    
  }
}

@objc(CoolWebViewManager)
class CoolWebViewManager: RCTViewManager {
  override func view() -> UIView! {
    let contentViewWrapper = ContentViewWrapper()
    
    let hostingController = UIHostingController(rootView: ContentView())
    return hostingController.view
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
