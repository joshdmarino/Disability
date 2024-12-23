import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            Image("background") // Replace with your image name
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Welcome to Credit Cove!")
                    .padding()
                    .padding()
                    .font(.custom("MarkerFelt-Wide", size: 45))
                    .foregroundColor(.white)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center) // Center the text
                                        .frame(maxWidth: .infinity) // Make it take full width
                                        .padding(.bottom, 10) // Add space below the title
                                    
                    .padding(.bottom, 1) // Add space below the title
                
                
                Text("Hey there! \n\nIf you're under 25, disabled, and credit invisible, think of credit and financial education as your compass in the vast ocean of adulthood. \n\nImagine wanting to rent a cozy island hut (an apartment) or buy your own sailboat (a car). Without a good credit score, you might face rough seas with higher costs and fewer choices. But with the right financial skills, you can navigate to better rates and opportunities. \n\nLet's set sail and learn more!")
                    .font(.custom("ArialRoundedMTBold", size: 18.2))
                    .foregroundColor(.white)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center) // Center the text
                                        .frame(maxWidth: .infinity) // Make it take full width
                                        .padding(.bottom, 10) // Add space below the title
                    .padding(.horizontal) // Add horizontal padding
                    .padding(.bottom, 20) // Add space above the button
                Spacer() // Pushes the content to the bottom
                Spacer() // Pushes the content to the bottom
                Spacer() // Pushes the content to the bottom
                Spacer() // Pushes the content to the bottom
                
                Spacer() // Add more space between text and button
                
                HStack {
                    Spacer()
                    Button(action: {
                        // Action for button (currently does nothing)
                    }) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .padding()
        }
        .navigationTitle("Credit Cove")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
