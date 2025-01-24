//
//  SoundSetting.swift
//  TimerApp
//
//  Created by 존진 on 1/24/25.
//

import Foundation
import AVKit

class SoundSetting: ObservableObject {
    static let instance = SoundSetting()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        
        guard let url = URL(string: "") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch let error {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
}
