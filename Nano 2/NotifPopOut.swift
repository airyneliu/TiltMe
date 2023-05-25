//
//  NotifPopOut.swift
//  Nano 2
//
//  Created by Airyne Liu on 23/05/23.
//

import SwiftUI

struct NotifPopOut: View {
    var body: some View {
        
        ZStack {
            Image ("notif_BG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            
            VStack {
                ZStack {
                    Image ("notif")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 304, height: 157)
                    HStack{
                        Image ("exit_no")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 97, height: 46)
                            .padding(.trailing, 60)
                            .padding(.top, 65)
                        
                        Image ("exit_yes")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 97, height: 46)
                            .offset(x: -20)
                            .padding(.top, 65)
                    }
                }
                
                Spacer()
                    .frame(height: 100)
            }
            
            
            
            
            
        }
    }
}

struct NotifPopOut_Previews: PreviewProvider {
    static var previews: some View {
        NotifPopOut()
    }
}
