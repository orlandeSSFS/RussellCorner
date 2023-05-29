/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI
import Subsonic

struct LandmarkDetail: View {
    @StateObject private var song = SubsonicPlayer(sound: "song.mp3")
    @StateObject private var rush = SubsonicPlayer(sound: "rush.mp3")
    @StateObject private var nerd = SubsonicPlayer(sound: "nerd.mp3")
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate
                )
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
                

            VStack(alignment: .center) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                HStack {
                    Text(landmark.city)
//                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

//                Text("About \(landmark.name)")
//                    .font(.title2)
                Text(landmark.description)
                    .frame(maxWidth:350)
                
                Divider()
                
                Text("Current Owner:")
                    .font(.headline)

                Text(landmark.currentOwner)
                
                Divider()
                
                VStack {
                    Button("Play Audio") {
                        song.play()
                    }

                    Button("Stop") {
                        song.stop()
                    }

                    Slider(value: $song.volume)
                }
                
                    
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
