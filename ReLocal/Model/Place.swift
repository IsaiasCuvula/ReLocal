//
//  Place.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 27.03.22.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    var id = UUID().uuidString
    var place: CLPlacemark
}
