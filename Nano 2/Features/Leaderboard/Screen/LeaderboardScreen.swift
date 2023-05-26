//
//  LeaderboardScreen.swift
//  Nano 2
//
//  Created by Nyoman Adiwinanda on 25/05/23.
//

import SwiftUI

struct LeaderboardScreen: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State var showMe: Bool = false
    @State var array: [Player] = []
    var data: Player
    
    var body: some View {
        ZStack {
            Image ("finalBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            HStack {
                NavigationLink {
                    ContentView()
                } label: {
                    Image ("closebutton")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding([.leading],20)
                }
                Spacer()
            }
            .offset(y: -320)
            
            VStack{
                Text ("CONGRATULATIONS!")
                    .foregroundColor(Color(red: 64/255, green: 62/255, blue: 163/255))
                    .bold()
                    .font(.system(size: 28))
                    .padding(.top,10)
                
                Text ("You have completed all questions!")
                    .foregroundColor(Color(red: 64/255, green: 62/255, blue: 163/255))
                    .fontWeight(.light)
                    .font(.system(size: 21))
            }
            .offset(y: -180)
            
            VStack {
                Spacer()
                
                ScrollView {
                    Text("Leaderboard")
                        .font(.system(size: 28))
                        .padding(.top, 24)
                        .padding(.bottom, 1)
                        .foregroundColor(.black)
                    
                    ForEach(Array(array.enumerated()), id: \.offset) { index, element in
                        HStack {
                            Text("\(index + 1).")
                                .padding(.leading, 50)
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                            
                            
                            Text(element.name)
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            VStack {
                                Text("true")
                                    .foregroundColor(.black)
                                Text("\(element.correct)/10")
                                    .foregroundColor(.black)
                            }
                            .padding(.trailing, 50)
                        }
                        Divider()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 550, alignment: .top)
                .background(Color(red: 254 / 255, green: 191 / 255, blue: 19 / 255))
                .cornerRadius(40, corners: [.topLeft, .topRight])
                .shadow(radius: 8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            for player in vm.savedEntities {
                array.append(Player(correct: player.correct, name: player.name ?? ""))
            }
            array.append(data)
            let sortedArray = array.sorted { $0.correct > $1.correct }
            
            array = sortedArray
        }
    }
}

struct LeaderboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardScreen(array: [], data: Player(correct: 1, name: "test"))
    }
}
