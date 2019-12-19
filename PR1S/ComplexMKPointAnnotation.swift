//
//  ComplexMKPointAnnotation.swift
//  PR4S
//
//  Created by David Mendaño Montoro on 15/12/2019.
//  Copyright © 2019 UOC. All rights reserved.
//

import Foundation
import MapKit

class ComplexMKPointAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String? {
        willSet{willChangeValue(forKey: "subtitle")}
        didSet{didChangeValue(forKey: "subtitle")}
    }
    var movie: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, movie:String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.movie = movie
    }
}
