import SwiftUI

struct ContentView: View {
    // Array of island names
    let islandNames = [
        "Credit Cove",
        "Interest Isle",
        "Healing Harbor",
        "Debt Dunes",
        "Asset Atoll",
        "Security Shore",
        "Prosperity Point"
    ]
    
    var body: some View {
        NavigationView { // Wrap in NavigationView
            GeometryReader { geometry in
                ZStack {
                    // Blue background
                    Color.blue
                        .edgesIgnoringSafeArea(.all)
                    
                    // Islands and Curvy Dashed Lines in Zig-Zag Pattern
                    ForEach(0..<islandNames.count, id: \.self) { index in
                        let islandX = index % 2 == 0 ? geometry.size.width / 4 : 3 * geometry.size.width / 4
                        let islandY = geometry.size.height / 8 * CGFloat(index + 1)
                        
                        VStack {
                            if islandNames[index] == "Credit Cove" { // Make Island A a button
                                NavigationLink(destination: DetailView()) {
                                    Island()
                                        .frame(width: 60, height: 60) // 10 pts bigger
                                }
                            } else {
                                ZStack { // Overlay lock on other islands
                                    Island()
                                        .frame(width: 60, height: 60) // 10 pts bigger
                                    
                                    Image("lock") // Replace with your lock image name
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40) // 10 pts bigger
                                }
                            }
                            
                            Text(islandNames[index]) // Using strings for island names
                                .font(.custom("MarkerFelt-Wide", size: 20))
                                .foregroundColor(.white)
                        }
                        .position(x: islandX, y: islandY)
                        
                        if index < islandNames.count - 1 {
                            let nextIslandX = (index + 1) % 2 == 0 ? geometry.size.width / 4 : 3 * geometry.size.width / 4
                            let nextIslandY = geometry.size.height / 8 * CGFloat(index + 2)
                            
                            CurvyDashedLine(startPoint: CGPoint(x: islandX, y: islandY),
                                            endPoint: CGPoint(x: nextIslandX, y: nextIslandY))
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [10, 5]))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}

struct Island: View {
    var body: some View {
        Image("island") // Replace with your island image name
            .resizable()
            .scaledToFit()
    }
}

struct CurvyDashedLine: Shape {
    var startPoint: CGPoint
    var endPoint: CGPoint
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, control: CGPoint(x: (startPoint.x + endPoint.x) / 2, y: startPoint.y - 50))
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
