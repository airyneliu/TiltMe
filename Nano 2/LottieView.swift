//
//  LottieView.swift
//  Nano 2
//
//  Created by Airyne Liu on 22/05/23.
//
//
import Foundation
import Lottie
import SwiftUI
import UIKit


//extension AnimationV


struct LottieView: UIViewRepresentable {

    var name: String
    var loopMode: LottieLoopMode = .loop
    var animationView = LottieAnimationView()

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {

        let view = UIView(frame: .zero)

        

        animationView.animation = LottieAnimation.named(name)

        animationView.contentMode = .scaleAspectFit

        animationView.loopMode = loopMode

        animationView.play()

        

        animationView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(animationView)

        

        NSLayoutConstraint.activate([

            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),

            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)

        ])

        

        return view

    }

    

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}

}






//import SwiftUI
//import Lottie

//struct LottieView: UIViewRepresentable {
//
//    var name = "success"
//    var loopMode: LottieLoopMode = .loop
//
//
//    func makeUIView(context: Context) -> LottieAnimationView {
//        let view = LottieAnimationView(name: name, bundle: Bundle.main)
//        view.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
//        view.loopMode = loopMode
//        view.contentMode = .scaleAspectFit
//        view.play()
//
//
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            view.widthAnchor.constraint(equalToConstant: 50),
//            view.heightAnchor.constraint(equalToConstant: 50)
//        ])
//
//        return view
//
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//
//    }
//}
//
//struct LottieView_Previews: PreviewProvider {
//    static var previews: some View {
//        LottieView()
//    }
//}
