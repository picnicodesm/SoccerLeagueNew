import SwiftUI

struct LaligaView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 9 / 255, green: 28 / 255, blue: 61 / 255), Color(red: 44 / 255, green: 133 / 255, blue: 188 / 255), Color(red: 207 / 255, green: 251 / 255, blue: 9 / 255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 40) {
                        ScheduleCard(leagueNumber: 4)
                        
                        RankingCard(leagueNumber: 4)
                    }
                }
            }
            .navigationTitle("Laliga")
        }
    }
}

struct LaligaView_Previews: PreviewProvider {
    static var previews: some View {
        LaligaView()
            .environmentObject(LeagueVM())
    }
}
