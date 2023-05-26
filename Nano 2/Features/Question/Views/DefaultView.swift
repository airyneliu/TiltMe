//
//  DefaultView.swift
//  Nano 2
//
//  Created by Nyoman Adiwinanda on 25/05/23.
//

import SwiftUI

struct DefaultView: View {
    
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

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView()
    }
}
