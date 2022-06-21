//
//  ContentView.swift
//  WineMemory
//
//  Created by Gerd Faedtke on 20.06.22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    @State private var whoGives = ""
    @State private var selectedDate = Date()
    @State private var additionalInfomation = ""
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center) {
                HStack {
                    Text("Who gives me the wine?")
                        .font(.headline)
                        .padding()
                    Image(systemName: "giftcard")
                        .font(.title)
                }
                .padding(.horizontal)
                
                if let image = vm.image {
                    ZoomableScrollView {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.6)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.horizontal)
                }
                
                HStack {
                    Button {
                        vm.source = .camera
                        vm.showPhotoPicker()
                    } label: {
                        VStack(alignment: .center) {
                            Image(systemName: "camera.fill")
                            Text("Take")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                    Button {
                        vm.source = .library
                        vm.showPhotoPicker()
                    } label: {
                        VStack(alignment: .center) {
                            Image(systemName: "photo.fill")
                            Text("Select")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        print("Save")
                    }) {
                        VStack(alignment: .center) {
                            Image(systemName: "camera.fill")
                            Text("Save")
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                    }
                    
                }
                HStack {
                    
                    DatePicker(selection: $selectedDate, displayedComponents: [.date]) {
                        Text("Date")
                    }
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding()
                    
                    
                    
                }
                
                TextField("Who was the nice person", text: $whoGives)
                    .textFieldStyle(.roundedBorder)
                    .frame(maxWidth: 300, maxHeight: 35)
                    .border(Color.gray, width: 1)
                    .padding(.vertical)
                
                
                Text("More Information about the Present")
                    .font(.headline)
                TextEditor(text: $additionalInfomation)
                    .frame(maxWidth: 300, maxHeight: 100)
                    .border(Color.gray, width: 1)
                
            }
            
            .sheet(isPresented: $vm.showPicker) {
                ImagePicker(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
                    .ignoresSafeArea()
            }
            .alert("Error", isPresented: $vm.showCameraAlert, presenting: vm.cameraError, actions: {
                cameraError in
                cameraError.button
            }, message: { cameraError in
                Text(cameraError.message)
            })
            .navigationTitle("Wine Bottle Memory")
            .padding()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
