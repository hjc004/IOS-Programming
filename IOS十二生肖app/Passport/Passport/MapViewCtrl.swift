//
//  MapViewCtrl.swift
//  Passport
//
//  Created by HHH on 2020/10/7.
//  Copyright © 2020 HHH. All rights reserved.
//

import UIKit
import MapKit

class MapViewCtrl: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var country : String!
    var geoC :CLGeocoder?
    var latitude :Double = 0.0
    var longitude :Double = 0.0
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        
        if self.country == "Italy" {
            self.latitude = 41.8947400
            self.longitude = 12.4839000
        }else if (self.country == "England"){
            self.latitude = 51.5085300
            self.longitude = -0.1257400
        }else if (self.country == "Norway"){
            self.latitude = 59.914225
            self.longitude = 10.75256
        }else if (self.country == "Spain"){
            self.latitude = 40.41694
            self.longitude = -3.70081
        }
        
//        myLatitude  = (currLocation?.coordinate.latitude)!;
//        myLongitude = (currLocation?.coordinate.longitude)!;
        
        //重置定位
        var theCoordinate = CLLocationCoordinate2D()
        
        //latitude纬度
        theCoordinate.latitude = self.latitude;
        //longitude经度
        theCoordinate.longitude = self.longitude;
        
        //定义显示的范围span范围
        var theSpan = MKCoordinateSpan()
        
        theSpan.latitudeDelta = 0.01;
        theSpan.longitudeDelta = 0.01;
        
        //定义显示的区域 region区域范围
        var theRegion =  MKCoordinateRegion()
        theRegion.center = theCoordinate
        theRegion.span = theSpan
        
        //设置地图显示
        mapView.region = theRegion
        
        createGeoC1()
        
    }
    
    func createGeoC1() -> Void {
        geoC = CLGeocoder.init()
        
        self.addAnnoWithPT(pt: CLLocationCoordinate2DMake(self.latitude, self.longitude))
    }
    
    
    func addAnnoWithPT(pt:CLLocationCoordinate2D) -> Void {
        
        
        //创建一个大头针对象
        let objectAnnotation = MKPointAnnotation()
        
        //设置大头针的显示位置
        objectAnnotation.coordinate = CLLocation(latitude: pt.latitude,
                                                 longitude: pt.longitude).coordinate
        //设置点击大头针之后显示的标题
        objectAnnotation.title = "哈哈"
        //设置点击大头针之后显示的描述
        objectAnnotation.subtitle = "张江药谷大厦"
        
        
        //添加大头针
        self.mapView.addAnnotation(objectAnnotation)
        
        //        let anno = myAnnotation.init()
        //
        //        anno.coordinate = pt
        //        anno.title = self.str!
        //        anno.subtitle = "张江药谷大厦"
        //
        //        self.mapView.addAnnotation(anno as! MKAnnotation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // 判断大头针位置是否在原点,如果是则不加大头针
        if annotation is MKUserLocation  {

            return nil
        }
        
        let inden = "pappap"
        var pin = mapView.dequeueReusableAnnotationView(withIdentifier: inden)
        
        if pin == nil {
            pin = MKAnnotationView.init(annotation: annotation, reuseIdentifier: inden)
            pin?.annotation = annotation
            //            pin?.canShowCallout = true
            //            pin?.isDraggable = true
            
        }
        
        pin?.image = UIImage(named: "map")
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 25))
        imageView.image = UIImage(named: "map1")
        pin?.detailCalloutAccessoryView = imageView
        return pin
        
    }

    @IBAction func detailAction(_ sender: Any) {
        performSegue(withIdentifier: "detail", sender: self.country)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewCtrl
        detailVC.country = sender as? String
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


