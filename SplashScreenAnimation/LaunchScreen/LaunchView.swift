//

/*--------------------------------------------------------------------------------------------------------------------------
    File: LaunchView.swift
  Author: Kevin Messina
 Created: 3/8/24
Modified:
 
©2024 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:
--------------------------------------------------------------------------------------------------------------------------*/



import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "Loading your profile...".map { String($0) }
    @State private var showLoadingText: Bool = false
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool

    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color("AccentColor")
                .ignoresSafeArea()
            
            Image("Cat")
                .resizable()
                .frame(width:100,height:100)
            
            ZStack {
                if showLoadingText {
                    HStack(spacing:0) {
                        ForEach(loadingText.indices, id: \.self) { index in
                            Text(loadingText[index])
                                .foregroundStyle(counter == index ? .black : .black.opacity(0.5))
                                .font(.headline)
                                .fontWeight(.heavy)
                                .offset(y: counter == index ? -6.25 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y:75)
        }
        .onAppear{
            showLoadingText.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops > 1 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
            }
        })
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
