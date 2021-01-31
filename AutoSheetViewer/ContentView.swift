//
//  ContentView.swift
//  AutoSheetViewer
//
//  Created by Shahan Nedadahandeh on 2021-01-30.
//  Copyright © 2021 Shahan Nedadahandeh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Button(action: {
            }) {
                Text("Detect Pitch")
            }
        }
    }
    
    func SetupPitch(){
        print("Setting Up Pitch")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
