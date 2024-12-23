import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Tide")
                    .font(.custom("MarkerFelt-Wide", size: 70)) // Using Marker Felt font
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                HStack(spacing: 4) {
                    Text("powered by")
                        .font(.custom("ArialRoundedMTBold-Thin", size: 20)) // Using Marker Felt font
                        .foregroundColor(.white)
                    
                    Image("experianLogo") // Replace with the name of your trademark logo image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40) // Adjust height as needed
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
