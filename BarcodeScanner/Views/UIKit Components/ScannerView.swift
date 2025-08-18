//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Ayush Rajpal on 17/08/25.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        private var scannedView: ScannerView
        
        init(scannerView: ScannerView){
            self.scannedView = scannerView
        }
        
        func didFind(barcode: String) {
            scannedView.scannedCode = barcode
//            print(barcode)
            
        }
        
        func didSurfaceError(error: CameraError) {
            scannedView.scannedCode = ""
            switch error {
            case .invalidDeviceInput:
                scannedView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannedView.alertItem = AlertContext.invalidScannedType
            }
          
        }
        
        
    }
    
}

//#Preview {
//    ScannerView(scannedCode: .constant("1234554321"), alertItem: .constant())
//}
