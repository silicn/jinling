//
//  AudioViewController.swift
//  SwiftDemo
//
//  Created by silicn on 2019/8/19.
//  Copyright © 2019 Shiguanghui. All rights reserved.
//

import UIKit

import AVFoundation

class AudioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let session = AVAudioSession.sharedInstance()
        
        do{
            try session.setActive(true, options: [])
        }catch let error as NSError{
            print("Unable to active audio")
        }
        
        func setupNotifications(){
            NotificationCenter.default.addObserver(self, selector: #selector(handleAudio(not:)), name:.AVAudioEngineConfigurationChange, object: AVAudioSession.sharedInstance())
        }

        

        // Do any additional setup after loading the view.
    }
    @objc func handleAudio(not:Notification){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
