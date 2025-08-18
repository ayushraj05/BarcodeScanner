//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Ayush Rajpal on 24/07/25.
//

import SwiftUI

struct AlertItem : Identifiable{
    var id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(
        title: "Invalid Device Input",
        message: "Something is wrong with camera input.",
        dismissButton: .default(Text("OK"))
    )
    static let invalidScannedType = AlertItem(
        title: "Invalid Scan Type",
        message: "The value is not valid, only EAN-8 and EAN-13 is accepted.",
        dismissButton: .default(Text("OK"))
    )
}

struct BarcodeScannerView: View {
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationStack{
            VStack{
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                Spacer()
                    .frame(height: 60)
                Label("Scanned Barcode:", systemImage:"barcode.viewfinder")
                    .font(.title)
                Text(scannedCode.isEmpty ? "No barcode scanned" : scannedCode)
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red:.green)
                    .padding()
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem){ alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
