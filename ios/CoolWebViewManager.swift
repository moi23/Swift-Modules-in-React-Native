//
//  File.swift
//
//  Created by Moises Miranda Vilas Boas on 17/12/22.
//

import SwiftUI
import Foundation
import Mantis

struct ContentView: View {
  @State var ourImage = UIImage(named:"Harley")
  @State var isShowing = false
  
  var body: some View {
    VStack {
      Image(uiImage: ourImage!).resizable()
      Button(action: { //Start editing the image
        isShowing = true
      }){
        Text("Edit")
      }.sheet(isPresented: $isShowing){
        ImageEditor(theimage: $ourImage, isShowing: $isShowing)
      }
    }
  }
}


struct ImageEditor: UIViewControllerRepresentable{
  typealias Coordinator = ImageEditorCoordinator
  @Binding var theimage: UIImage?
  @Binding var isShowing: Bool
  
  func makeCoordinator() -> ImageEditorCoordinator {
    return ImageEditorCoordinator(image: $theimage, isShowing: $isShowing)
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ImageEditor>) -> Mantis.CropViewController {
    let Editor = Mantis.cropViewController(image: UIImage(imageLiteralResourceName: "Harley"))
    Editor.delegate = context.coordinator
    return Editor
  }
}

class ImageEditorCoordinator: NSObject, CropViewControllerDelegate{
  @Binding var theimage: UIImage?
  @Binding var isShowing: Bool
  init(image: Binding<UIImage?>, isShowing: Binding<Bool>){
    _theimage = image
    _isShowing = isShowing
  }
  
  func cropViewControllerDidCrop(_ cropViewController: Mantis.CropViewController, cropped: UIImage, transformation: Mantis.Transformation, cropInfo: Mantis.CropInfo) {
    theimage = cropped
    isShowing = false
  }
  
  func cropViewControllerDidFailToCrop(_ cropViewController: Mantis.CropViewController, original: UIImage) {
    
  }
  
  func cropViewControllerDidCancel(_ cropViewController: Mantis.CropViewController, original: UIImage) {
    isShowing = false
  }
  
  func cropViewControllerDidBeginResize(_ cropViewController: Mantis.CropViewController) {
    
  }
  
  func cropViewControllerDidEndResize(_ cropViewController: Mantis.CropViewController, original: UIImage, cropInfo: Mantis.CropInfo) {
    
  }
  
  func cropViewControllerDidImageTransformed(_ cropViewController: Mantis.CropViewController) {
    
  }
  
}


// aqui






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
