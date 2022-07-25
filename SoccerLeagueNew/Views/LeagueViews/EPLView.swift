import SwiftUI

struct EPLView: View {
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundEffect = UIBlurEffect(style: .dark)
        //        coloredAppearance.backgroundColor = UIColor(.black)
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        //        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
    }
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [ Color(red: 255 / 255, green: 40 / 255, blue: 130 / 255), Color(red: 55 / 255, green: 0 / 255, blue: 60 / 255),]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 40) {
                        ScheduleCard(leagueNumber: 0)
                        
                        RankingCard(leagueNumber: 0)
                    }
                }
            }
            .navigationTitle("Premier League")
        }
    }
}


struct EPLView_Previews: PreviewProvider {
    static var previews: some View {
        EPLView()
            .environmentObject(LeagueVM())
    }
}

