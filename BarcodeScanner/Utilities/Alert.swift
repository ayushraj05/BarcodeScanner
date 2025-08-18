//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Ayush Rajpal on 18/08/25.
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
