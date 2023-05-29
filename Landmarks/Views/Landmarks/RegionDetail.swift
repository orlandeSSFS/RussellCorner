////
////  RegionDetail.swift
////  Landmarks
////
////  Created by orlande on 5/28/23.
////  Copyright © 2023 Apple. All rights reserved.
////
//
//import Foundation
//
//import MapKit
//
//struct MapContentView: View {
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
//
//    var body: some View {
//        Map(coordinateRegion: $region)
//            .frame(width: 400, height: 300)
//    }
//}


import SwiftUI
import AVKit
struct AVContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
            VStack {
                    Text("Play").font(.system(size: 45)).font(.largeTitle)
                HStack {
                    Spacer()
                    Button(action: {
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "play.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    Button(action: {
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "pause.circle.fill").resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                }
            }
        .onAppear {
            let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}
struct AVContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
