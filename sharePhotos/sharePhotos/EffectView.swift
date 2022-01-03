//
//  EffectView.swift
//  sharePhotos
//
//  Created by Kyohei Morinaka on 2022/01/04.
//

import SwiftUI

struct EffectView: View {
    @Binding var isShowSheet: Bool
    let captureImage: UIImage
    @State var showImage: UIImage?
    @State var isShowActivity = false
    var body: some View {
        VStack {
            Spacer()
            if let unwrapShowImage = showImage {
                Image(uiImage: unwrapShowImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            Button(action: {
                let filterName = "CIPhotoEffectMono"
                let rotate = captureImage.imageOrientation
                let inputImage = CIImage(image: captureImage)
                guard let effectFilter =
                        CIFilter(name: filterName) else {
                        return
                }
                effectFilter.setDefaults()
                effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
                
                guard let outputImage =
                        effectFilter.outputImage else {
                        return
                }
                let ciContext = CIContext(options: nil)
                guard let cgImage =
                    ciContext.createCGImage(outputImage, from: outputImage.extent)
                    else {
                    return
                }
                showImage = UIImage(cgImage: cgImage,scale: 1.0, orientation:  rotate)
                
            }) {
                Text("Effect")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            Button(action: {
                isShowActivity = true
            }) {
                Text("Share")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .sheet(isPresented: $isShowActivity) {
                actiView(shareItems: [showImage!])
            }
            .padding()
            Button(action: {
                isShowSheet = false
            }) {
                Text("Close")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
        }
        .onAppear {
            showImage = captureImage
        }
    }
}

struct EffectView_Previews: PreviewProvider {
    static var previews: some View {
        EffectView(
            isShowSheet: Binding.constant(true),
            captureImage: UIImage(named: "preview_use")!)
    }
}
