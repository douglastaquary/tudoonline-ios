//
//  RestauranteAnnotation.swift
//  Tudo On Line
//
//  Created by Douglas Taquary on 14/11/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import Foundation
import MapKit

class RestauranteAnnotation: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle

    }
    
}