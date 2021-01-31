//
//  ContentView.swift
//  AutoSheetViewer
//
//  Created by Shahan Nedadahandeh on 2021-01-30.
//  Copyright © 2021 Shahan Nedadahandeh. All rights reserved.
//

import SwiftUI
import Beethoven
import Pitchy
import AVFoundation

struct ContentView: View {
    var body: some View {
        HStack{
            Button(action: SetupPitch) {
                Text("Detect Pitch")
            }
        }
    }
    
    func SetupPitch(){
        print("Setting Up Pitch")
        // Creates a configuration for the input signal tracking (by default).
        let config = Config(
          bufferSize: 4096,
          estimationStrategy: .yin
        )

        switch AVAudioSession.sharedInstance().recordPermission {
        case AVAudioSessionRecordPermission.granted:
            print("Permission granted")
        case AVAudioSessionRecordPermission.denied:
            print("Pemission denied")
        case AVAudioSessionRecordPermission.undetermined:
            print("Request permission here")
            AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
                // Handle granted
            })
        }

        let delagate = PitchEngineDelegateImplementor();
        let pitchEngine = PitchEngine(config: config, delegate: delagate)
        pitchEngine.start()



    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class PitchEngineDelegateImplementor: PitchEngineDelegate {
  func pitchEngine(_ pitchEngine: PitchEngine, didReceivePitch pitch: Pitch) {
        print(pitch.note.string)
  }

  func pitchEngine(_ pitchEngine: PitchEngine, didReceiveError error: Error) {
    print(error)
  }

  public func pitchEngineWentBelowLevelThreshold(_ pitchEngine: PitchEngine) {
    print("Below level threshold")
  }
}
