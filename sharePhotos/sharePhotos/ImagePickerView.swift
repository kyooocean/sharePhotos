//
//  ImagePickerView.swift
//  sharePhotos
//
//  Created by Kyohei Morinaka on 2022/01/03.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var isShowSheet: Bool
    @Binding var captureImage: UIImage?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerView
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        //call delegate method after take photo
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            //save photo in caputureImage
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.captureImage = originalImage
            }
            //close sheet
            parent.isShowSheet = false
        }
        //call deligate if push
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isShowSheet = true
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    //execution when make view
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let myImagePickerController = UIImagePickerController()
        myImagePickerController.sourceType = .camera
        myImagePickerController.delegate = context.coordinator
        return myImagePickerController
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
}


