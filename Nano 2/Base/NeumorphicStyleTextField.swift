//
//  NeumorphicStyleTextField.swift
//  Nano 2
//
//  Created by Nyoman Adiwinanda on 25/05/23.
//

import SwiftUI

extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
}

struct NeumorphicStyleTextField: View {
    @Binding var textInput: String
    
    var textField: TextField<Text>
    var body: some View {
        HStack {
            textField
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.background)
        .cornerRadius(6)
        .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
        .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
        .onChange(of: textInput) { newValue in
            if !(textInput.last?.isLetter ?? true || textInput.last?.isWhitespace ?? true) {
                textInput.removeLast()
            }
        }
    }
}
