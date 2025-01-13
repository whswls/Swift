//
//  TimerData.swift
//  ObservableDemo
//
//  Created by 존진 on 1/13/25.
//

import Foundation
import Combine

// 최신 SwiftUI 에서는 @Observable 로 데이터 스트림 처리가 가능
@Observable
class TimerData: ObservableObject {
    var timeCount = 0
    var timer: Timer?
    
    // [weak self]는 변수 캡쳐 시 메모리 관리 ARC 카운트가 증가하지 않도록 해서, 메모리 누수를 막는다.
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.timerDidFire()
        }
    }
    
    func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}
