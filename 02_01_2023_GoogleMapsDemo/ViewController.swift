//
//  ViewController.swift
//  02_01_2023_GoogleMapsDemo
//
//  Created by Vishal Jagtap on 20/02/23.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    //var marker : GMSMarker?
    var marker = GMSMarker()
    var bitCodeCoordinates : CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()
        //marker = GMSMarker()
        mapView.delegate = self
        initializaMapSettings()
        
        let puneStationCameraPosition = GMSCameraPosition(latitude: 18.5167, longitude: 73.8562, zoom: 20.0)
        
        showMarker(position: puneStationCameraPosition.target)
        bitCodeCoordinates = CLLocationCoordinate2D(latitude: 18.5091, longitude: 73.8326)
        showMarker(position: bitCodeCoordinates!)
        //drawPolygon()
        drawPolyline()
        drawCircle()
    }
    func initializaMapSettings(){
        mapView.mapType = .normal
        mapView.settings.indoorPicker = true
        mapView.settings.myLocationButton = true
        mapView.settings.rotateGestures = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.settings.tiltGestures = true
    }
    
    func showMarker(position : CLLocationCoordinate2D){
        
        marker.position = position
        marker.title = "Bitcode"
        marker.snippet = "Bitcode"
        marker.rotation = 45.0
        marker.isDraggable = true
        marker.zIndex = 30
        marker.opacity = 0.4
        marker.map = mapView
    }
}

extension ViewController : GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("\(marker.position.latitude) -- \(marker.position.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("\(marker.position.latitude) -- \(marker.position.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker){
        print("\(marker.position.latitude) -- \(marker.position.longitude)")
    }
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
       let infoWindowView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        
        infoWindowView.backgroundColor = UIColor.blue
        infoWindowView.alpha = 0.8

        let label1 = UILabel(frame: CGRect(x: 10, y: 10, width: Int(infoWindowView.frame.width)-20, height: 30))
        
        label1.backgroundColor = UIColor(red: 0.25, green: 0.0, blue: 0.0, alpha: 0.6)
        
        label1.text = "This is Pune Station"
        label1.textColor = .white
        
        infoWindowView.addSubview(label1)
       
        return infoWindowView
    }
    
    
    func drawPolygon(){
        let pathForPolygon = GMSMutablePath()
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 18.5204, longitude: 73.8567))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 19.0948, longitude: 74.7418))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 17.6599, longitude: 75.9064))
        pathForPolygon.add(CLLocationCoordinate2D(latitude: 16.7050, longitude: 74.2433))
        
        
        let polygon = GMSPolygon(path: pathForPolygon)
        polygon.fillColor = .brown
        polygon.strokeColor = .blue
        polygon.strokeWidth = 10.0
        polygon.map = mapView
    }
    
    func drawCircle(){
        
        let circle = GMSCircle(position: CLLocationCoordinate2D(latitude: 18.5091, longitude: 73.8326), radius: 3000)
        circle.strokeWidth = 6
        circle.strokeColor = .cyan
        circle.fillColor = .green
        circle.map = mapView
    }
    
    func drawPolyline(){
        
        let pathForPolyline = GMSMutablePath()
        pathForPolyline.add(CLLocationCoordinate2D(latitude: 18.5204, longitude: 73.8567))
        pathForPolyline.add(CLLocationCoordinate2D(latitude: 19.0948, longitude: 74.7418))
        pathForPolyline.add(CLLocationCoordinate2D(latitude: 17.6599, longitude: 75.9064))
        pathForPolyline.add(CLLocationCoordinate2D(latitude: 16.7050, longitude: 74.2433))
        pathForPolyline.add(CLLocationCoordinate2D(latitude: 18.5204, longitude: 73.8567))
        
        let gmsPolyline = GMSPolyline(path: pathForPolyline)
        gmsPolyline.strokeColor = .cyan
        gmsPolyline.strokeWidth = 7
        gmsPolyline.map = mapView
    }
}

