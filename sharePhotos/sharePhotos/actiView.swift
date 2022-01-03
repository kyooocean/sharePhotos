//
//  actiView.swift
//  sharePhotos
//
//  Created by Kyohei Morinaka on 2022/01/03.
//

import SwiftUI

struct actiView: UIViewControllerRepresentable {
    let shareItems: [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        return controller
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<actiView>) {
        
    }
    
}
