//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Armando Francisco on 10/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var playerSelection: String = ""
    @State private var computerSelectionVar: String = ""
    @State private var scoreTitle = ""
    @State private var score = 0
    private var playerWin: Bool = false
    @State private var showReset: Bool = false
    private var selectionString = ["🪨","🧻","✂️"]
    @State private var randomNum = 0
    func computerSelection() {
        randomNum = Int.random(in: 0..<3)
        computerSelectionVar = selectionString[randomNum]
    }
    
    func winner() {
        if playerSelection == computerSelectionVar {
            
        } else if playerSelection == selectionString[0] && computerSelectionVar == selectionString[2] {
            score += 1
           
        } else if playerSelection == selectionString[1] && computerSelectionVar == selectionString[0] {
            score += 1
            
        } else if playerSelection == selectionString[2] && computerSelectionVar == selectionString[1] {
            score += 1
            
        } else {
            showReset = true
        }
    }

    func reset() {
        showReset = true
        score = 0
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Score: \(score)")
                .padding(25)
            Spacer()
            Spacer()
            Text(computerSelectionVar)
                .font(.system(size: 130))
            Spacer()
            Spacer()
            Text(playerSelection)
                .font(.system(size: 130))
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            HStack(alignment: .bottom) {
                VStack{
                    Button {
                        computerSelection()
                        playerSelection = selectionString[0]
                        winner()
                    } label: {
                        Text(selectionString[0])
                            .emojiButtonsStyle()
                    }
                    HStack{
                        Button {
                            computerSelection()
                            playerSelection = selectionString[1]
                            winner()
                        } label: {
                            Text(selectionString[1])
                                .emojiButtonsStyle()
                        }
                        Button {
                            computerSelection()
                            playerSelection = selectionString[2]
                            winner()
                        } label: {
                            Text(selectionString[2])
                                .emojiButtonsStyle()
                        }
                    }
                }
                .padding()
            }
            Spacer()
        }
        .alert(scoreTitle, isPresented: $showReset) {
            Button("Continue",action: reset)
        } message: {
            //Text("You Lose :(")
            Text("You Lose \nYour score was \(score)")
        }
    }
}

#Preview {
    ContentView()
}

struct EmojiButtons: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 80))
            .padding(10)
    }
}
extension View {
    func emojiButtonsStyle() -> some View {
        modifier(EmojiButtons())
    }
}
