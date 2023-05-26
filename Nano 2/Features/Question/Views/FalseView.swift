//
//  FalsePage.swift
//  Nano 2
//
//  Created by Airyne Liu on 22/05/23.
//

import SwiftUI

struct FalseView: View {
    
    @Binding var index: Int
    @Binding var pageState: String
    @Binding var lockGyroscope: Bool
    @Binding var numberCorrect: Int
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image("falseicon")
                        .resizable()
                        .frame(width: 65, height: 65)
                    Text("False")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                }
                
                Text(questions[index].desc)
                    .font(.system(size: 21))
                    .foregroundColor(.white)
                    .padding(.top, -10)
                    .padding([.leading, .trailing], 20)
                
                if index <= 8 {
                    Button {
                        index += 1
                        lockGyroscope = false
                        pageState = "default"
                    } label: {
                        Text("Next Question").font(.system(size: 20)).bold()
                    }
                    .frame(width: 150)
                    .padding()
                    .background(
                        RoundedRectangle(
                            cornerRadius: 15,
                            style: .continuous
                        )
                        .stroke(Color(red: 255 / 255, green: 210 / 255, blue: 86 / 255), lineWidth: 5)
                    )
                    .background(Color(red: 255 / 255, green: 150 / 255, blue: 1 / 255))
                    .cornerRadius(15)
                    .foregroundStyle(.white)
                } else {
                    NavigationLink {
                        ScoreRecapScreen(numberCorrect: numberCorrect)
                    } label: {
                        Text("Finish").font(.system(size: 20)).bold()
                    }
                    .frame(width: 150)
                    .padding()
                    .background(
                        RoundedRectangle(
                            cornerRadius: 15,
                            style: .continuous
                        )
                        .stroke(Color(red: 255 / 255, green: 210 / 255, blue: 86 / 255), lineWidth: 5)
                    )
                    .background(Color(red: 255 / 255, green: 150 / 255, blue: 1 / 255))
                    .cornerRadius(15)
                    .foregroundStyle(.white)
                }
            }
        }
    }
}

struct FalsePage_Previews: PreviewProvider {
    static var previews: some View {
        FalseView(index: .constant(0), pageState: .constant("false"), lockGyroscope: .constant(true), numberCorrect: .constant(0))
    }
}
