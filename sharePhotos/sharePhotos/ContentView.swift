//
//  ContentView.swift
//  sharePhotos
//
//  Created by Kyohei Morinaka on 2022/01/03.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State var captureImage: UIImage? = nil
    @State var isShowSheet = false
    @State var isPhotolibrary = false
    @State var isShowAction = false
    var body: some View {
        VStack{
            Spacer()
            Button(action: {
                isShowAction = true
                isShowAction = true
            }) {
                Text("start-up Camera")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }
            .sheet(isPresented: $isShowSheet) {
                if let unwrapCaptureImage = captureImage {
                    EffectView(isShowSheet: $isShowSheet, captureImage: unwrapCaptureImage)
                } else {
                    if isPhotolibrary {
                        PHPickerView(isShowSheet:
                                        $isShowSheet, captureImage: $captureImage)
                    } else {
                        ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                    }
                }
 //                  .actionSheet(isPresented: $isShowAction) {
   //                     ActionSheet(title: Text("CHECK"),
     //                               message: Text("SELECT"),
       //                             buttons: [
         //                               .default(Text("Camera"), action: {
           //                                 isPhotolibrary = false
             //                               if UIImagePickerController.isSourceTypeAvailable(.camera) {
               //                                 print("camera is available")
                 //                               isShowSheet = true
                   //                         } else {
                     //                           print("camera is not available")
                       //                     }
                         //               }),
                           //             .default(Text("Photo Library"), action: {
                             //               isPhotolibrary = true
                               //             isShowSheet = true
                                 //       }),
                                   //     .cancel(),
 //                                   ])
                    }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
