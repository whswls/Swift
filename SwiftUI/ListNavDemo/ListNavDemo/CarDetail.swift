//
//  CarDetail.swift
//  ListNavDemo
//
//  Created by 존진 on 1/14/25.
//  메인 -> 해당 차의 상세 뷰

import SwiftUI

struct CarDetail: View {
    let selectedCar: Car
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")) {
                Image(selectedCar.imageName)
                    .resizable()
                    .clipShape(.rect(cornerRadius: 12))
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                Text(selectedCar.description)
                    .font(.body)
                
                HStack {
                    Text("Hybrid").font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
            }
        }
    }
}

#Preview {
    CarDetail(selectedCar: carData[0])
}
