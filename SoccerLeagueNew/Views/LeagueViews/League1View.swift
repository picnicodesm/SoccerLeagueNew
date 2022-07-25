import SwiftUI

struct League1View: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0 / 255, green: 18 / 255, blue: 58 / 255), Color(red: 0 / 255, green: 78 / 255, blue: 143 / 255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 40) {
                        ScheduleCard(leagueNumber: 2)
                        
                        RankingCard(leagueNumber: 2)
                    }
                }
            }
            .navigationTitle("League1")
        }
    }
}

struct League1View_Previews: PreviewProvider {
    static var previews: some View {
        League1View()
            .environmentObject(LeagueVM())
    }
}
