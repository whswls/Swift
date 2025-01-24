//
//  ContentView.swift
//  TimerApp
//
//  Created by 존진 on 1/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timeRemaining: Int = 60      // 초 단위
    @State private var isRunning: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(String(format: "%02d", timeRemaining / 60)):\(String(format: "%02d", timeRemaining % 60))")
                .font(.system(size: 40, weight: .bold))
                .onTapGesture {
                    if timeRemaining < 60 {
                        timeRemaining = 60
                    } else if timeRemaining < 300 {
                        timeRemaining = 300
                    } else if timeRemaining < 600 {
                        timeRemaining = 600
                    } else {
                        timeRemaining = 60
                    }
                }
            HStack {
                Button(action: {
                    isRunning.toggle()
                }, label: {
                    Image(systemName: isRunning ? "pause.fill" : "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding()
                })
                
                Button(action: {
                    timeRemaining = 60
                }, label: {
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:40, height: 40)
                        .padding()
                })
            }
            .font(.system(size: 30))
        }
        .padding()
        .onReceive(timer) { t in
            print("timer tick \(t)")
            if isRunning && timeRemaining > 0 {
                timeRemaining -= 1
            } else if timeRemaining == 0 {
                // 타이머 멈춤
                isRunning = false
            } else {
                // ignore
            }
        }
    }
}

#Preview {
    ContentView()
}
