//
//  ContentView.swift
//  Homework1
//
//  Created by Dominik Maric on 29.09.2021..
//  note: ctrl + i - align
// how to automatically apply changes

import SwiftUI

struct ContentView: View {
    
    @State private var counter = 0
    @State private var isAlertPresented = false
    @State private var userInput = ""
    @State private var isAnimated = false
    @State private var name: String = ""
    
    
    var changeColor: Color {
        if counter > 0 {
            return .green
        } else if counter < 0{
            return .red
        } else {
            return .gray
        }
    }
    
    private var count: String {
        return "\(counter)"
    }
    
    private var addMessage: String {
        if counter > 10 {
            return "Lower the count!"
        } else if counter < -10 {
            return "Increase the count!"
        } else {
            return ""
        }
    }
    
    
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    self.counter -= 1
                }, label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.red)
                            .offset(x: 0, y:3)
                        Text("-")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding()
                    }
                }).frame(width: 80, height: 65)
                Button(action: {
                    self.counter += 1
                }, label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.green)
                            .offset(x: 0, y: 3)
                        Text("+")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding()
                    }
                }).frame(width: 80, height: 65)
            }
            .padding(.bottom, 30)
            .padding([.leading, .trailing], 100)
            
            ZStack {
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(changeColor)
                    .frame(width: 220, height: 120)
                Text(count)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                if (counter > 10 || counter < -10) {
                    Text(addMessage)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .offset(x: 0, y: 50)
                }
            }.padding(.bottom, 10)
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            HStack {
                Button(action: { self.isAlertPresented = true }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black)
                            .frame(width: 100, height: 50)
                            .padding(20)
                        Text("Submit")
                            .foregroundColor(.white)
                    }
                })
            }.padding(40)
            Button(action: {self.isAnimated.toggle() }, label: {
                Image(systemName: "bell.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 50, height: 50)
                    .scaleEffect(self.isAnimated ? 2.5 : 1)
                    .offset(y: self.isAnimated ? -100 : 0)
                    .animation(.spring())
            })
            Spacer()
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(title: Text("Something"),
                  message: Text("Hello \(name)! Value is \(counter)"),
                  dismissButton: .default(Text("Close"),
                                          action: { self.userInput = ""}))
        }
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
