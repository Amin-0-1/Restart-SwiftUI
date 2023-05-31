//
//  AudioPlayer.swift
//  Restart
//
//  Created by Amin on 31/05/2023.
//

import Foundation
import AVFoundation

var audioPlayer:AVAudioPlayer?

func playSound(sound:String,type:String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        }catch{
            print("couldn't play this sound.")
        }
    }
}
