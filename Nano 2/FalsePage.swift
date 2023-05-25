//
//  FalsePage.swift
//  Nano 2
//
//  Created by Airyne Liu on 22/05/23.
//

import SwiftUI

struct FalsePage: View {
    
    let descriptiontext = """
    We have Belgium to thank for
    the crispy fried goodness.
    """
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
                
                Text(descriptiontext)
                    .font(.system(size: 21))
                    .foregroundColor(.white)
                    .padding(.top, -10)
                
                Image ("ButtonTrueFalse")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 230, height: 46)
                    .padding(.top, 40)
            }
        }
    }
}

struct FalsePage_Previews: PreviewProvider {
    static var previews: some View {
        FalsePage()
    }
}
