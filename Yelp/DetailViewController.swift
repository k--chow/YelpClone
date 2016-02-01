//
//  DetailViewController.swift
//  Yelp
//
//  Created by Kevin Chow on 1/31/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking
import MapKit
class DetailViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var detailPhone: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var navTitle: UINavigationItem!
    @IBOutlet weak var detailType: UILabel!
    @IBOutlet weak var detailAddress: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var infoView: UIView!
    var business: Business!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        detailType.text = business.categories
        detailAddress.text = business.address
        detailPhone.text = business.phone
        navTitle.title = business.name
        ratingImageView.setImageWithURL(business.ratingImageURL!)
        detailImageView.setImageWithURL(business.imageURL!)
        var latitude = business.location!["coordinate"]!["latitude"]! as! Double
        var longitude = business.location!["coordinate"]!["longitude"]! as! Double
        let centerLocation = CLLocation(latitude: latitude, longitude: longitude)
        goToLocation(centerLocation)
        var coordinates = centerLocation.coordinate
        addAnnotationAtCoordinate(coordinates)
    }
    
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(0.005, 0.005)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
    }
    
    func addAnnotationAtCoordinate(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "An annotation"
        mapView.addAnnotation(annotation)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "customAnnotationView"
        
        
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        if (annotationView == nil) {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        else {
            annotationView!.annotation = annotation
        }
        if #available(iOS 9.0, *) {
            annotationView!.pinTintColor = UIColor.redColor()
        } else {
            
        }
        
        return annotationView
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
