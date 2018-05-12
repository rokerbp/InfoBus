//
//  BarcodeViewController.swift
//  InfoBus
//
//  Created by roker on 5/9/18.
//  Copyright © 2018 roker. All rights reserved.
//

import UIKit
import AVFoundation

protocol BarcodeViewControllerDelegate {
    func foundBarcode(barcode:String)
}

class BarcodeViewController: UIViewController {
    
    var delegate:BarcodeViewControllerDelegate?
    var captureSession: AVCaptureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    
    @IBAction func touchCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let cameraDevice = AVCaptureDevice.default(for: AVMediaType.video)
        if cameraDevice == nil{
            return
        }
        guard let videoInput =
            try? AVCaptureDeviceInput(device: cameraDevice!)
            else {
                failed()
                return
        }
        //add video camera input to capture session
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {failed();return}
        
        //Bar code detector
        let metadataOutput = AVCaptureMetadataOutput()
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
        } else {failed();return}
        // Customize metadata output
        metadataOutput.metadataObjectTypes =
            [AVMetadataObject.ObjectType.ean13]
        metadataOutput.setMetadataObjectsDelegate(self, queue:
            DispatchQueue.main)
        captureSession.startRunning()
        //Add preview
        previewLayer = AVCaptureVideoPreviewLayer(session:
            captureSession)
        previewLayer.frame = view.layer.frame
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(previewLayer)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func failed() {
        let ac = UIAlertController(title: "Barcode detection not supported",
                                   message: "Your device doesn't support barcode detection.",
                                   preferredStyle: .alert)
        let alert = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        ac.addAction(alert)
        present(ac, animated: true, completion: nil)
    }

}
extension BarcodeViewController:
AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput
        metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection){
        if let metadataObject = metadataObjects.first as?
            AVMetadataMachineReadableCodeObject {
            captureSession.stopRunning()
            delegate?.foundBarcode(barcode:
                metadataObject.stringValue!)
            dismiss(animated: true, completion: nil)
        }
    }
}
