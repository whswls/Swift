//
//  DataManager.swift
//  TabDemo
//
//  Created by 존진 on 3/19/25.
//

import Foundation

class DataManager {
    // 싱글톤 인스턴스
    static let shared = DataManager()
    private init() {}
    
    // 데이터 저장을 위한 속성
    var data: String = ""
    
    // 알림을 통한 데이터 변경 알림
    static let dataChangedNotification = Notification.Name("DataChangedNotification")
    
    func updateData(_ newData: String) {
        data = newData
        
        // 알림 발송
        NotificationCenter.default.post(name: DataManager.dataChangedNotification, object: nil)
        
    }
}
