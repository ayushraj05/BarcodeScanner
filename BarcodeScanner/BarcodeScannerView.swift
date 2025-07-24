//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Ayush Rajpal on 24/07/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                Spacer()
                    .frame(height: 60)
                Label("Scanned Barcode:", systemImage:"barcode.viewfinder")
                    .font(.title)
                Text("Not Yet Scanned")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
                
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
