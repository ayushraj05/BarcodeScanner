//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Ayush Rajpal on 17/08/25.
//

import UIKit
import AVFoundation

protocol ScannerVCDelegate: AnyObject{
    func didFind(barcode: String)
}

final class ScannerVC: UIViewController{
    let captureSession = AVCaptureSession()
    var previewLayer : AVCaptureVideoPreviewLayer?
    weak var scannerDelegate: ScannerVCDelegate?
    
    init(scannerDelegate: ScannerVCDelegate){
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCaptureSession(){
        guard let viedoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        let viedoInput: AVCaptureDeviceInput
        do {
            try viedoInput = AVCaptureDeviceInput(device: viedoCaptureDevice)
        } catch {
            return
        }
        
        if captureSession.canAddInput(viedoInput){
            captureSession.addInput(viedoInput)
        }
        else{
            return
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(metaDataOutput){
            captureSession.addOutput(metaDataOutput)
            
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean8]
        }
        else{
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer!.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        
        captureSession.startRunning()
    }
    
    
}

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first else{
            return
        }
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            return
        }
        
        guard let barcode = machineReadableObject.stringValue else {
            return
        }
        scannerDelegate?.didFind(barcode: barcode)
    }
}
