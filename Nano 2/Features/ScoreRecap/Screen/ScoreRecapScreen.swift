//
//  ScoreRecapPage.swift
//  Nano 2
//
//  Created by Airyne Liu on 24/05/23.
//

import SwiftUI

struct ScoreRecapScreen: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State var textInput: String = ""
    @State var navigate: Bool = true
    let numberCorrect: Int
    
    var body: some View {
        ZStack {
            Image ("finalBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                Image ("trophy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                
                Text ("CONGRATULATIONS!")
                    .foregroundColor(Color(red: 64/255, green: 62/255, blue: 163/255))
                    .bold()
                    .font(.system(size: 28))
                    .padding(.top,10)
                
                Text ("You have completed all questions!")
                    .foregroundColor(Color(red: 64/255, green: 62/255, blue: 163/255))
                    .fontWeight(.light)
                    .font(.system(size: 21))
                
                ZStack {
                    Image ("recapbox")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 301, height: 151)
                        .padding(.top)
                    
                    VStack {
                        HStack {
                            Text ("Total true:")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .bold()
                            Text ("\(numberCorrect)/10")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                VStack {
                    Text("Type your name")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.black)
                    
                    HStack {
                        NeumorphicStyleTextField(textInput: $textInput, textField: TextField("", text: $textInput))
                            .padding([.leading, .trailing], 55)
                    }
                }
                .padding(.top, 10)
                
                NavigationLink {
                    LeaderboardScreen(data: Player(correct: Int16(numberCorrect), name: textInput))
                } label: {
                    Image ("buttonleaderboard")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 330, height: 46)
                        .padding(.top, 10)
                        .brightness(textInput.count == 0 ? 0.4 : 0)
                }
                .disabled(textInput.count == 0 ? true : false)
            }
            .padding(.bottom, 80)
        }
        .navigationBarBackButtonHidden(true)
        .onDisappear() {
            vm.addLeaderboard(player: Player(correct: Int16(numberCorrect), name: textInput))
        }
    }
    
    struct ScoreRecapPage_Previews: PreviewProvider {
        static var previews: some View {
            ScoreRecapScreen(numberCorrect: 0)
        }
    }
}
