import SwiftUI

struct BundesView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 44 / 255, green: 6 / 255, blue: 9 / 255), Color(red: 193 / 255, green: 7 / 255, blue: 31 / 255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 40) {
                        ScheduleCard(leagueNumber: 3)
                        
                        RankingCard(leagueNumber: 3)
                    }
                }
            }
            .navigationTitle("Bundes Leauge")
        }
    }
}

struct BundesView_Previews: PreviewProvider {
    static var previews: some View {
        BundesView()
            .environmentObject(LeagueVM())
    }
}
