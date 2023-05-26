//
//  NotifPopOut.swift
//  Nano 2
//
//  Created by Airyne Liu on 23/05/23.
//

import SwiftUI

struct QuitConfirmationView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var showQuitConfirmation: Bool
    @State private var fadeInOut = false
    
    var body: some View {
        ZStack {
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
                            .onTapGesture {
                                withAnimation(Animation.easeInOut(duration: 0.5)) {
                                    showQuitConfirmation.toggle()
                                }
                            }
                        
                        Image ("exit_yes")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 97, height: 46)
                            .offset(x: -20)
                            .padding(.top, 65)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }
                
                Spacer()
                    .frame(height: 100)
            }
        }
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                fadeInOut.toggle()
            }
        }
        .opacity(fadeInOut ? 1 : 0)
    }
}

struct NotifPopOut_Previews: PreviewProvider {
    static var previews: some View {
        QuitConfirmationView(showQuitConfirmation: .constant(true))
    }
}
