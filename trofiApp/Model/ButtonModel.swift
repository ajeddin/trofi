//
//  Model.swift
//  ContinuityTransition
//
//  Created by Abdulaziz Jamaleddin on 23/03/2024.
//

import Foundation
import SwiftUI

struct ExpandSection: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    let backgroundColor: Color
}

class HomeViewModel: ObservableObject {
    @Published var moveItems: Bool = false
    @Published var showItems: Bool = false
    @Published var showNextView: Bool = false
    @Published var selectedExpandIndex: Int? = nil
}
