//
//  ContentView.swift
//  ListNavDemo
//
//  Created by 존진 on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    @State var carStore = CarStore(cars: carData)
    @State var stackPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach(carStore.cars) { car in
                    NavigationLink(value: car) {
                        ListCell(car: car)
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationTitle(Text("EV Cars"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    NavigationLink(value: "Add Car") {
                        Text("Add")
                            .foregroundStyle(.blue)
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    EditButton()
                })
            }
            .navigationDestination(for: String.self) { menuString in
                if menuString == "Add Car" {
                    AddNewCar(carStore: carStore, path: $stackPath)
                }
            }
            .navigationDestination(for: Car.self) { car in
                CarDetail(selectedCar: car)
            }
        }
    }
    func deleteItems(offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    func moveItems(form source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
        }
    }
}
