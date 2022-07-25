import SwiftUI

struct KLView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0 / 255, green: 18 / 255, blue: 58 / 255), Color(red: 0 / 255, green: 78 / 255, blue: 143 / 255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 40) {
                        ScheduleCard(leagueNumber: 1)
                        
                        RankingCard(leagueNumber: 1)
                    }
                }
            }
            .navigationTitle("K League")
        }
    }
}

struct KLView_Previews: PreviewProvider {
    static var previews: some View {
        KLView()
            .environmentObject(LeagueVM())
    }
}
