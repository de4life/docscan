//
//  ViewController.swift
//  firstapp
//
//  Created by Артур on 4/15/19.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit
import VisionKit
class ViewController: UIViewController, VNDocumentCameraViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpInsideCameraButton(_ sender: Any) {
        configureDocumentView()
    }
    
    private func configureDocumentView(){
        let scanningDocumentVC = VNDocumentCameraViewController()
        scanningDocumentVC.delegate = self
        self.present(scanningDocumentVC, animated: true,completion: nil)

    }
}


extension ViewController:VNDocumentCameraViewControllerDelegate{
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        for pageNumber in 0..<scan.pageCount{
            
            let image = scan.imageOfPage(at: pageNumber)
            
            print(image)
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
}
