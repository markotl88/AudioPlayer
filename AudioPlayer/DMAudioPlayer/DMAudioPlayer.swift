//
//  DMAudioPlayer.swift
//  AudioPlayer iOS
//
//  Created by Marko Stajic on 2/7/19.
//  Copyright © 2019 Kevin Delannoy. All rights reserved.
//

import UIKit

public class DMAudioPlayer: AudioPlayer {
    
    override func remoteControlReceived(with event: UIEvent) {
        guard event.type == .remoteControl else {
            return
        }
        
        switch event.subtype {
        case .remoteControlNextTrack:
            if let currentTime = currentItemProgression {
                seek(to: currentTime + 30)
            }
            break
        case .remoteControlPause,
             .remoteControlTogglePlayPause where state.isPlaying:
            pause()
        case .remoteControlPlay,
             .remoteControlTogglePlayPause where state.isPaused:
            resume()
        case .remoteControlPreviousTrack:
            if let currentTime = currentItemProgression {
                seek(to: currentTime - 30)
            }
            break
        case .remoteControlStop:
            stop()
        default:
            break
        }
    }
}
