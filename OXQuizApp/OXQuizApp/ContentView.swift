//
//  ContentView.swift
//  OXQuizApp
//
//  Created by 존진 on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var number1: Int = 4
    @State var number2: Int = 2
    @State var resultNumber: Int = 9
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    @State private var isPresented = false
    
    var body: some View {
        // UI 구성 및 로직 작성 부분
        VStack {
            Text("현재  \(countCorrect)개 맞음 / \(countWrong)개 틀림")
                .font(.system(size: 19, weight: .semibold))
                .padding(.leading, 190)
            
            Text("다음 수식을 맞춰보세요!")
                .font(.system(size: 27, weight: .bold))
                .padding()
            
            // 수식 연산 부분
            Text("\(number1) x \(number2) = \(resultNumber)")
                .font(.system(size: 35, weight: .semibold))
                .padding([.top,.bottom], 120)
            
            // 맞음/틀림 버튼
            HStack {
                Spacer()
                Button("🙆🏻‍♀️ 맞음", action: {
                    selectCorrect()
                })
                .foregroundStyle(.green)
                .font(.system(size: 28, weight: .bold))
                .frame(width: 130, height: 55)
                .background(Color.green.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Button("🙅🏻‍♀️ 틀림", action: {
                    selectWrong()
                })
                .foregroundStyle(.red)
                .font(.system(size: 28, weight: .bold))
                .frame(width: 130, height: 55)
                .background(Color.red.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
            }
            .padding(.bottom, 80)
            
            // 게임 초기화 버튼
            Button("게임 초기화", action:{
                isPresented = true
            })
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(.blue)
            .frame(width: 120, height: 40)
            .background(Color.blue.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding([.top, .bottom], 80)
            .alert("게임 초기화", isPresented: $isPresented) {
                Button("OK", role: .destructive) {
                    reloadGame() // 초기화 수행
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("게임을 정말 초기화하시겠습니까?")
            }
        }
    }
    
    // 새로운 문제 생성 함수
    func newQuesiont() {
        number1 = Int.random(in: 0...10)
        number2 = Int.random(in: 0...10)
        resultNumber = Bool.random() ? number1 * number2 : Int.random(in: 0...100)
    }
    
    // 게임 재시작 함수
    func reloadGame() {
        countCorrect = 0
        countWrong = 0
        newQuesiont()
    }
    
    // 맞음 버튼 클릭 함수
    func selectCorrect() {
        if((number1 * number2) == resultNumber) {
            countCorrect += 1
        } else {
            countWrong += 1
        }
        newQuesiont()
    }
    
    // 틀림 버튼 클릭 함수
    func selectWrong() {
        if((number1 * number2) != resultNumber) {
            countCorrect += 1
        } else {
            countWrong += 1
        }
        newQuesiont()
    }
}

#Preview {
    ContentView()
}
