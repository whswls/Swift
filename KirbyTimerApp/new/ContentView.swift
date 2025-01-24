//
//  ContentView.swift
//  new
//
//  Created by 존진 on 1/24/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var timeRemaining: Int = 60      // 초 단위
    @State private var isRunning: Bool = false
    @State private var selectedTime: Int = 60
    private var currentKirbyImage: String = "kirby"
    
    @State var player: AVAudioPlayer?
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ZStack {
                Image("cherry")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .offset(x: 120, y: 60)
                Image("hamburger")
                    .resizable()
                    .frame(width: 50, height: 45)
                    .offset(x: -110, y: 55)
                Image("tomato")
                    .resizable()
                    .frame(width: 50, height: 45)
                    .offset(x: 10, y: 30)
                Image("pudding")
                    .resizable()
                    .frame(width: 50, height: 45)
                    .offset(x: -60, y: 15)
                Image("milk")
                    .resizable()
                    .frame(width: 50, height: 45)
                    .offset(x: 78, y: 15)
            }
            
            // ZStack을 사용하여 이미지 위에 원형 타이머 배경과 진행 표시
            ZStack {
                // Kirby 이미지
                Image(currentKirbyImage)
                    .resizable()
                    .frame(width: 270, height: 265)
                    .padding(.top, 10)
                    .animation(.easeInOut(duration: 0.5), value: currentKirbyImage)
                
                Text("\(String(format: "%02d", timeRemaining / 60)):\(String(format: "%02d", timeRemaining % 60))")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 110, height: 50)
                    .offset(x: 9)
                
                // 원형 타이머 배경
                Circle()
                    .stroke(lineWidth: 12)
                    .foregroundColor(.white.opacity(0.8))  // 배경 색상
                    .frame(width: 155, height: 155)
                    .offset(x: 9)
                
                // 타이머 진행을 원형으로 표시
                Circle()
                    .trim(from: 0, to: CGFloat(timeRemaining) / CGFloat(selectedTime))
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .foregroundColor(.pink.opacity(0.8))
                    .rotationEffect(.degrees(-90))  // 시작 위치 조정
                    .animation(.easeInOut(duration: 1), value: timeRemaining) // 애니메이션
                    .frame(width: 155, height: 155)
                    .offset(x: 9)
            }
            .padding()
            
            Picker("Set Timer", selection: $selectedTime) {
                ForEach([60, 180, 300, 360, 420, 480, 540, 600], id: \.self) { time in
                    Text("\(time / 60) min")
                        .tag(time)
                }
            }
            .font(.system(size: 15, weight: .medium))
            
            .frame(width: 145, height: 20)
            .onChange(of: selectedTime) { newValue in
                timeRemaining = newValue
            }
            .padding()
            
            HStack {
                Button(action: {
                    isRunning.toggle()
                }, label: {
                    Image(systemName: isRunning ? "pause.fill" : "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height:20)
                        .padding()
                        .foregroundStyle(Color.kirbyColor)
                })
                
                Button(action: {
                    resetTimer()
                }, label: {
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding()
                        .foregroundStyle(Color.kirbyColor)
                })
            }
            .font(.system(size: 40))
            .padding()
        }
        .padding()
        .frame(width: 300, height: 500)
        .background(Color.pink.opacity(0.4))
        
        
        .onReceive(timer) { t in
            if isRunning && timeRemaining > 0 {
                timeRemaining -= 1
            } else if timeRemaining == 0 {
                // 타이머 멈춤
                isRunning = false
                playSound()
            } else {
                // ignore
            }
        }
    }
    
    // 상태 초기화
    private func resetTimer() {
        timeRemaining = selectedTime
        isRunning = false
        stopMusic()
    }
    
    // 소리 재생
    func playSound() {
        
        guard let url = Bundle.main.url(forResource: "chillguy", withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    // 음악 중지
    func stopMusic() {
        player?.stop()
        player = nil // 객체 초기화 (옵션)
    }
}

#Preview {
    ContentView()
}
