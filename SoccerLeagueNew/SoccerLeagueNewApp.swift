import SwiftUI

@main
struct SoccerLeagueNewApp: App {
    @StateObject var leagueVM = LeagueVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(leagueVM)
        }
    }
}
