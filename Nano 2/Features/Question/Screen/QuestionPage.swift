//
//  ContentView.swift
//  Nano 2
//
//  Created by Airyne Liu on 22/05/23.
//

import SwiftUI
import AudioToolbox

struct QuestionPage: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var accelerometerManager = AccelerometerManager(movementDirection: "")
    @State var pageState: String = "default"
    @State var index: Int = 0
    @State var lockGyroscope: Bool = false
    @State var showQuitConfirmation: Bool = false
    @State var numberCorrect: Int = 0
    
    var body: some View {
        ZStack {
            ZStack{
                Image("BG")
                    .resizable()
                    .scaledToFill()
                
                VStack{
                    HStack {
                        Image ("closebutton")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .padding([.leading],20)
                            .onTapGesture {
                                withAnimation(Animation.easeInOut(duration: 0.5)) {
                                    showQuitConfirmation.toggle()
                                }
                            }
                        Spacer()
                    }
                    .padding(10)
                    .padding([.bottom],20)
                    
                    HStack {
                        Spacer()
                        Text("\(index + 1)/10")
                            .font(.system(size: 24))
                            .foregroundColor(Color(red: 255/255, green: 210/255, blue: 87/255))
                            .padding(.trailing,35)
                        Text ("Question \(index + 1)")
                            .font(.system(size: 26))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.trailing,135)
                    }
                    
                    ZStack {
                        Image("question box")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 301, height: 211)
                            .padding(.trailing,10)
                        
                        VStack {
                            Image(questions[index].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 167, height: 106)
                                .offset(y: 0)
                                .padding(.trailing,15)
                            
                            Text(String(questions[index].question))
                                .font(.system(size: 21))
                                .frame(width: 290)
                                .padding(.trailing,10)
                        }
                    }
                    .padding([.bottom], pageState == "default" ? 181 : 0)
                    
                    if pageState == "default" {
                        DefaultView()
                    } else if pageState == "true" {
                        TrueView(
                            index: $index,
                            pageState: $pageState,
                            lockGyroscope: $lockGyroscope,
                            numberCorrect: $numberCorrect
                        )
                    } else {
                        FalseView(
                            index: $index,
                            pageState: $pageState,
                            lockGyroscope: $lockGyroscope,
                            numberCorrect: $numberCorrect
                        )
                    }
                    Spacer()
                }
                .padding(.top,70)
            }
            .brightness(showQuitConfirmation ? -0.5 : 0)
            .blur(radius: showQuitConfirmation ? 2 : 0)
            
            if showQuitConfirmation {
                QuitConfirmationView(showQuitConfirmation: $showQuitConfirmation)
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .onReceive(accelerometerManager.$movementDirection) { _ in
            if accelerometerManager.movementDirection == "right" && questions[index].answer {
                if !lockGyroscope {
                    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
                    lockGyroscope = true
                    pageState = "true"
                    numberCorrect += 1
                }
            }
            
            if accelerometerManager.movementDirection == "right" && !questions[index].answer {
                if !lockGyroscope {
                    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
                    lockGyroscope = true
                    pageState = "false"
                }
            }
            
            if accelerometerManager.movementDirection == "left" && questions[index].answer {
                if !lockGyroscope {
                    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
                    lockGyroscope = true
                    pageState = "false"
                }
            }
            
            if accelerometerManager.movementDirection == "left" && !questions[index].answer {
                if !lockGyroscope {
                    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
                    lockGyroscope = true
                    pageState = "true"
                    numberCorrect += 1
                }
            }
        }
    }
}

struct QuestionPage_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPage()
    }
}
