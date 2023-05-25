//
//  ScoreRecapPage.swift
//  Nano 2
//
//  Created by Airyne Liu on 24/05/23.
//

import SwiftUI

struct ScoreRecapPage: View {
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
                            Text ("8/10")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                        .padding(.top, -30)
                        .padding(.trailing, 90)
                        
                        HStack {
                            Text ("Time:")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .bold()
                            Text ("60s")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                        .padding(.top, -10)
                        .padding(.trailing, 145)
                    }
                }
                Image ("buttonleaderboard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330, height: 46)
                    .padding(.top, 10)
                    .onTapGesture {
                        print("Go to leaderboard")
                    }
            }
            .padding(.bottom, 80)
           
        }
    }
    
    struct ScoreRecapPage_Previews: PreviewProvider {
        static var previews: some View {
            ScoreRecapPage()
        }
    }
}
