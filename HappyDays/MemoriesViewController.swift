//
//  MemoriesViewController.swift
//  HappyDays
//
//  Created by Charles Findlay on 9/10/16.
//  Copyright © 2016 Charles Findlay. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import Speech


class MemoriesViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func checkPermissions() {
        
        // Check permission status of the 3 items needed by the app
        
        let photoAuthorized = PHPhotoLibrary.authorizationStatus() == .authorized
        let recordingAuthorized = AVAudioSession.sharedInstance().recordPermission() == .granted
        let transcribeAuthorized = SFSpeechRecognizer.authorizationStatus() == .authorized
        
        // Combine 3 permissions into a single boolean
        
        let authorized = photoAuthorized && recordingAuthorized && transcribeAuthorized
        
        // If any permissions are missing then show the first run screen
        
        if authorized == false {
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "FirstRun") {
                
                navigationController?.present(vc, animated: true)
            }
            
        }
        
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

}
