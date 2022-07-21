import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            EPLView()
                .tabItem {
                    Label("EPL", systemImage: "folder.circle")
                }
            
            Text("Second Screen")
                .tabItem {
                    Label("K League", systemImage: "paperplane.circle")
                }
            
            Text("Third Screen")
                .tabItem {
                    Label("League1", systemImage: "book.circle")
                }
            
            Text("Fourth Screen")
                .tabItem {
                    Label("Bundes League", systemImage: "newspaper.circle")
                }
            
            Text("Fifth Screen")
                .tabItem {
                    Label("LaLiga", systemImage: "calendar.circle")
                }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LeagueVM())
    }
}
