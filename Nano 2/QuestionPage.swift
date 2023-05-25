//
//  ContentView.swift
//  Nano 2
//
//  Created by Airyne Liu on 22/05/23.
//

import SwiftUI

struct DefaultPage: View {
    
    var body: some View {
        VStack {
            Text ("True or False?")
                .font(.system(size: 28))
                .foregroundColor(.white)
                .italic()
                .padding(.trailing,10)
            
            VStack {
                HStack {
                    Image ("tilt_kiri")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 72, height: 72)
                        .padding(.leading,-20)
                    
                    Text("Tilt left for")
                        .foregroundColor(.white)
                        .padding(.leading,8)
                    
                    Text("false")
                        .foregroundColor(Color(red: 255/255, green: 210/255, blue: 87/255))
                        .padding(.leading,-3)
                }
                .padding(.bottom,25)
                
                HStack {
                    Image ("tilt kanan")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 72, height: 72)
                        .padding(.leading,-20)
                    
                    Text("Tilt right for")
                        .foregroundColor(.white)
                        .padding(.leading,8)
                    
                    Text("true")
                        .foregroundColor(Color(red: 255/255, green: 210/255, blue: 87/255))
                        .padding(.leading,-3)
                }
            }
            .offset(y: 15)
            .padding(.trailing,10)
            
        }
        .frame(alignment: .top)
        .offset(y: -170)
    }
    
    
}

struct QuestionPage: View {
    //UTK BACK KE MAINPAGE (tp hrs ada nav link)
    @Environment(\.dismiss) private var closed_
    @State var index = 0
    @StateObject private var accelerometerManager = AccelerometerManager()
    
    //    func nextQuestion() -> Void {
    //        while index <= 9 {
    //            DispatchQueue.global(qos: .default).async {
    //                usleep(10000000)
    //                self.index = self.index + 1
    //            }
    //        }
    //    }
    
    // default, false, true
    //UTK NGUBAH2 VIEW PAGE
    var pageState: String = "default"
    var body: some View {
        ZStack{
            Image("BG")
                .resizable()
                .scaledToFill()
            VStack{
                
                if accelerometerManager.movementDirection == "right" {
                    Text("")
                        .onAppear {
                            nextQuestion()
                        }
                }
                
                if accelerometerManager.movementDirection == "left" {
                    Text("")
                        .onAppear {
                            nextQuestion()
                        }
                }
                
                HStack {
                    if pageState == "default" {
                        Image ("closebutton")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .padding([.leading],20)
                            .onTapGesture {
                                closed_()
                            }
                    }
                    
                    Spacer()
                    
//                    if pageState == "default" {
//                            LottieView(name: "timer.json")
//                                .frame(width: 70, height: 70)
//                                .padding([.trailing],25)
//                    }
                    
                    
                }.padding(10)
                    .padding([.bottom],20)
                
                HStack {
                    Spacer()
                    Text("\(index)/10")
                        .font(.system(size: 24))
                        .foregroundColor(Color(red: 255/255, green: 210/255, blue: 87/255))
                        .padding(.trailing,35)
                    
                    
                    Text ("Question \(index)")
                        .font(.system(size: 28))
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
                        Image(ArrayofImages[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 167, height: 106)
                            .offset(y: 0)
                            .padding(.trailing,15)
                        
                        Text(ArrayOfQuestions[index])
                            .font(.system(size: 21))
                            .frame(width: 290)
                            .padding(.trailing,10)
                    }
                }
                .padding([.bottom], pageState == "default" ? 181 : 0)
                
                // default page
                if pageState == "default" {
                    DefaultPage()
                } else if pageState == "true" {
                    TruePage()
                } else {
                    FalsePage()
                }
                Spacer()
            }
            .padding(.top,70)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            nextQuestion()
        }
    }
    
    func nextQuestion() {
//        resetLottie = false
        if index < 9 {
            self.index += 1
//            DispatchQueue.global(qos: .default).async {
//                usleep(10000000)
//                nextQuestion()
//            }
        }
    }
}

struct QuestionPage_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPage()
    }
}
