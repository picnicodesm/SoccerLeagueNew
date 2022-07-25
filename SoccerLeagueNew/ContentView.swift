import SwiftUI

struct ContentView: View {
    @EnvironmentObject var leagueVM: LeagueVM
    var body: some View {
        
        TabView {
            
            EPLView()
                .tabItem {
                    Label("EPL", systemImage: "folder.circle")
                }
            
            KLView()
                .tabItem {
                    Label("K League", systemImage: "paperplane.circle")
                }
            
            League1View()
                .tabItem {
                    Label("League1", systemImage: "book.circle")
                }
            
            BundesView()
                .tabItem {
                    Label("Bundes League", systemImage: "newspaper.circle")
                }
            
            LaligaView()
                .tabItem {
                    Label("LaLiga", systemImage: "calendar.circle")
                }
        }
        .onAppear {
            leagueVM.getSchedule(leagueNumber: 0)
            leagueVM.getRanking(leagueNumber: 0)
            leagueVM.getSchedule(leagueNumber: 1)
            leagueVM.getRanking(leagueNumber: 1)
            leagueVM.getSchedule(leagueNumber: 2)
            leagueVM.getRanking(leagueNumber: 2)
            leagueVM.getSchedule(leagueNumber: 3)
            leagueVM.getRanking(leagueNumber: 3)
            leagueVM.getSchedule(leagueNumber: 4)
            leagueVM.getRanking(leagueNumber: 4)
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LeagueVM())
    }
}
