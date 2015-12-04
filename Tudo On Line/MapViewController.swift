//
//  MapViewController.swift
//  Tudo On Line
//
//  Created by Douglas Taquary on 14/11/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var restauranteAnnotation: RestauranteAnnotation!
    
    var locationManager: CLLocationManager = CLLocationManager()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Permissão do usuario durante o uso
        self.locationManager.requestWhenInUseAuthorization()
       
        //criando coordenada
        
        //cria uma regiao ao redor da coordenada do restaurante
        let restLocation:CLLocationCoordinate2D  = CLLocationCoordinate2DMake(-5.0846649,-42.7986866)
        self.mapView.region = MKCoordinateRegionMakeWithDistance(restLocation, 8000, 8000)
        //self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        
        self.mapView.delegate = self
        
        //Configurando uma annotation customizada do local do restaurante
        self.restauranteAnnotation = RestauranteAnnotation(coordinate: restLocation,
            title: "Savori Pizzaria",
            subtitle: "Pode ser um site... :P")
        
        self.mapView.addAnnotation(restauranteAnnotation)
        
     
        //-----------------------------------------------
        
    }
    
    func viewForRestauranteAnnotation(annotation: MKAnnotation, reuseIdentifier: String) -> MKAnnotationView
    {
        let anView:MKAnnotationView = MKAnnotationView(annotation: annotation,
            reuseIdentifier: reuseIdentifier)
        
        //Altera a imagem static para logo restaurante
        anView.image = UIImage(named:"logo2")
        
        anView.canShowCallout = true
        
        //adiciona um butao para o callout para implementar no toc
        anView.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure) as UIButton
        
        return anView
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is RestauranteAnnotation{
            
            let reuseId = "restAnnot"
            var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
            if anView == nil {
                anView = self.viewForRestauranteAnnotation(annotation, reuseIdentifier: reuseId)
            }
            else {
                //Reutiliza a view, atualiza a referenca da annotation
                anView!.annotation = annotation
            }
            return anView
        }
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
