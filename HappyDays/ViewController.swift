//
//  ViewController.swift
//  HappyDays
//
//  Created by Charles Findlay on 9/10/16.
//  Copyright © 2016 Charles Findlay. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import Speech


class ViewController: UIViewController {

    @IBOutlet weak var helpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestPermissions(_ sender: AnyObject) {
        
        requestPhotoPermissions()
        
    }
    
    func requestPhotoPermissions() {
        
        PHPhotoLibrary.requestAuthorization { [unowned self] authStatus in
            
            DispatchQueue.main.async {
                
                if authStatus == .authorized {
                    
                    self.requestRecordPermissions()
                } else {
                    
                    self.helpLabel.text="Photo permission was declined. Please enable it in settings then tap Continue again."
                }
            }
        }
    } // End requestPhotoPermissions
    
    
    func requestRecordPermissions() {
        
        AVAudioSession.sharedInstance().requestRecordPermission() { [unowned self] allowed in
            
            DispatchQueue.main.async {
                if allowed {
                    
                    self.requestTranscribePermissions()
                } else {
                    
                    self.helpLabel.text="Recording permission was declined. Please enable it in settings then tap Continue again."
                }
            }
        }
    } // End requestRecordPermissions
    
    
    func requestTranscribePermissions() {
        
        SFSpeechRecognizer.requestAuthorization { [unowned self] authStatus in
            
            DispatchQueue.main.async {
                
                if authStatus == .authorized {
                    
                    self.authorizationComplete()
                } else {
                    
                    self.helpLabel.text="Transcribe permission was declined. Please enable it in settings then tap Continue again."
                }
            }
        }
    } // End requestTranscribePermissions
    
    func authorizationComplete() {
        
        dismiss(animated: true)
    }
    
    
    

}

