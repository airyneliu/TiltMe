//
//  Mainpage.swift
//  Nano 2
//
//  Created by Airyne Liu on 23/05/23.
//

import SwiftUI

struct Mainpage: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("BG")
                    .resizable()
                .ignoresSafeArea()
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 251, height: 228)
                        .offset(x:15)
                        .padding(.bottom,70)
                    
                    .padding(.bottom, -50)
                    
                    NavigationLink(destination: QuestionPage()) {
                        Image("Buttonstart")
                            .resizable()
                            .frame(width: 277, height: 92)
                    }
                    .padding(.bottom,70)
                }
            }
        }
    }
}

struct Mainpage_Previews: PreviewProvider {
    static var previews: some View {
        Mainpage()
    }
}
