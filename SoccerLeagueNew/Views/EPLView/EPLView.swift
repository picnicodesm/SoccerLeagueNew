import SwiftUI

struct EPLView: View {
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = UIColor(.black.opacity(0.4))
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
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0 / 255, green: 18 / 255, blue: 58 / 255), Color(red: 0 / 255, green: 78 / 255, blue: 143 / 255)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 40) {
                        ScheduleCard()
                        
                        RankingCard()
                        
                        VStack {
                            Text("경기 일정")
                        }
                        .frame(width: 350, height: 360)
                        .background(.gray)
                        .cornerRadius(10)
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

