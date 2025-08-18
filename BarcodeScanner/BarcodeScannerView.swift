//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Ayush Rajpal on 24/07/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    @State private var scannedCode = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                ScannerView(scannedCode: $scannedCode)
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
        }
    }
}

#Preview {
    BarcodeScannerView()
}
