//
//  ProfileViewModel.swift
//  SwiftMessenger
//
//  Created by Javier Bonilla on 12/13/23.
//

import Foundation
import SwiftUI
import PhotosUI

//this viewModel allows us to pick an Image and then return the image to the profile view to display
class ProfileViewModel: ObservableObject{
    @Published var selectedItem: PhotosPickerItem?{
        didSet{ Task {try await loadImage()}}
    }
    
    @Published var profileImage: Image?
    
    func loadImage() async throws{
        guard let item = selectedItem else {return}
        guard let imageData = try await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: imageData) else {return}
        self.profileImage = Image(uiImage: uiImage)
    }
}
