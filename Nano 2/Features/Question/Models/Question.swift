//
//  Data.swift
//  Nano 2
//
//  Created by Airyne Liu on 25/05/23.
//

import Foundation
import SwiftUI

struct Question {
    let question: String
    let answer: Bool
    let desc: String
    let image: String
}

let questions: [Question] = [
    Question(
        question: "French fries originated from French.",
        answer: false,
        desc: "We have Belgium to thank for the crispy fried goodness.",
        image: "gambar1"
    ),
    Question(
        question: "The two longest rivers in the world are the Mississippi and the Nile.",
        answer: false,
        desc: "The two longest rivers are the Nile and the Amazon.",
        image: "gambar2"
    ),
    Question(
        question: "The human body is about 60% water.",
        answer: true,
        desc: "Water is essential for every cell to function.",
        image: "gambar3"
    ),
    Question(
        question: "The capital city of Australia is Sydney.",
        answer: false,
        desc: "The capital city of Australia is Canberra.",
        image: "gambar4"
    ),
    Question(
        question: "Pepperoni is the most popular pizza topping in the US.",
        answer: true,
        desc: "Mushrooms come in second.",
        image: "gambar5"
    ),
    Question(
        question: "Aladdin’s character was based on Brad Pitt.",
        answer: false,
        desc: "Tom Cruise was the inspiration for the character.",
        image: "gambar6"
    ),
    Question(
        question: "Spaghetto is the singular form of the word spaghetti.",
        answer: true,
        desc: "In general, Italian nouns that end in “o” are single in nature, whereas those that finish in “i” are plural.",
        image: "gambar7"
    ),
    Question(
        question: "Coffee is a berry based beverage.",
        answer: true,
        desc: "When coffee berries were riped, they are harvested, processed, and dried before being roasted and ground into coffee.",
        image: "gambar8"
    ),
    Question(
        question: "The skull is the strongest bone in the human body.",
        answer: false,
        desc: "It is the femur or the thighbone.",
        image: "gambar9"
    ),
    Question(
        question: "Fortune cookies were invented in China.",
        answer: false,
        desc: "They were invented in the United States.",
        image: "gambar10"
    )
]
