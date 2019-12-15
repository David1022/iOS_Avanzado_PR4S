//
//  ViewControllerComplex.swift
//  PR4S
//
//  Created by Javier Salvador Calvo on 12/12/16.
//  Copyright © 2016 UOC. All rights reserved.
//

import UIKit
import Foundation
import MapKit

import AVFoundation
import AVKit

import MobileCoreServices

class ViewControllerComplex: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    var m_item:CItemData?
    var m_locationManager:CLLocationManager?
    var m_map:MKMapView?
    
    var player:AVPlayer?
    var m_AVPlayerLayer:AVPlayerLayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // BEGIN-CODE-UOC-2
        self.m_map = MKMapView()
        self.m_map?.delegate = self
        initViews()
        AddMarkers()
        
        // END-CODE-UOC-2
        
        
        
        
        // BEGIN-CODE-UOC-5
        
        self.m_locationManager = CLLocationManager()
        self.m_locationManager?.delegate = self
        self.m_locationManager?.allowsBackgroundLocationUpdates = true
        self.m_locationManager?.distanceFilter = 50

        // END-CODE-UOC-5
        
        
        // BEGIN-CODE-UOC-6
        
        // END-CODE-UOC-6
        
    }
    
    func initViews() {
        let videoView = UIImageView()
        let controlsView = UIView()
        let playView = UIButton(type: .custom)
        let pauseView = UIButton(type: .custom)

        self.view.backgroundColor = .black

        videoView.image = #imageLiteral(resourceName: "tv")
        let playImage = UIImage(named: "play.png")
        playView.setImage(playImage, for: .normal)
        let pauseImage = UIImage(named: "pause.png")
        pauseView.setImage(pauseImage, for: .normal)

        guard let map = m_map else {return}
        self.view.addSubview(map)
        self.view.addSubview(videoView)
        self.view.addSubview(controlsView)
        controlsView.addSubview(playView)
        controlsView.addSubview(pauseView)

        map.translatesAutoresizingMaskIntoConstraints = false
        videoView.translatesAutoresizingMaskIntoConstraints = false
        controlsView.translatesAutoresizingMaskIntoConstraints = false
        playView.translatesAutoresizingMaskIntoConstraints = false
        pauseView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            map.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            map.topAnchor.constraint(equalTo: self.view.topAnchor),
            map.bottomAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            controlsView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            controlsView.heightAnchor.constraint(equalToConstant: 80),
            controlsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            videoView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            videoView.topAnchor.constraint(equalTo: self.view.centerYAnchor),
            videoView.bottomAnchor.constraint(equalTo: controlsView.topAnchor),
            
            playView.heightAnchor.constraint(equalTo: controlsView.heightAnchor),
            playView.widthAnchor.constraint(equalTo: controlsView.heightAnchor, multiplier: 1),
            playView.leadingAnchor.constraint(equalTo: controlsView.leadingAnchor, constant: 10),

            pauseView.heightAnchor.constraint(equalTo: controlsView.heightAnchor),
            pauseView.widthAnchor.constraint(equalTo: controlsView.heightAnchor, multiplier: 1),
            pauseView.leadingAnchor.constraint(equalTo: playView.trailingAnchor, constant: 10)
        ])
        
        playView.addTarget(self, action: #selector(self.Play(sender:)), for: .touchUpInside)
        pauseView.addTarget(self, action: #selector(self.Pause(sender:)), for: .touchUpInside)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let location = userLocation.coordinate
        
        let region = MKCoordinateRegion(center: location ,span: span)
        
        self.m_map?.setRegion(region,animated: true)
        
    }

    // BEGIN-CODE-UOC-8
    @objc func Play(sender:UIButton)
    {
      print("Play")
    }

    
    @objc func Pause(sender:UIButton)
    {
        print("Pause")
    }
    // END-CODE-UOC-8
    
    func AddMarkers()
    {
    
    // BEGIN-CODE-UOC-3
    
        guard let data = m_item?.m_data.data(using: .utf8) else { return }
        do {
            let markersList = try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as! NSMutableArray
                        
            for marker in markersList {
                guard let dataMarker = marker as? NSMutableDictionary else {return}
                let  annotation:ComplexMKPointAnnotation = ComplexMKPointAnnotation(coordinate: CLLocationCoordinate2D(latitude: dataMarker["lat"] as? Double ?? 0, longitude: dataMarker["lon"] as? Double ?? 0), title: dataMarker["title"] as? String ?? "",
                    subtitle: dataMarker["movie"] as? String ?? "",
                    movie: dataMarker["movie"] as? String ?? "")
                
                self.m_map?.addAnnotation(annotation)
            }
        } catch let error as NSError {
            print(error)
        }

//        let  annotation:ComplexMKPointAnnotation = ComplexMKPointAnnotation(coordinate: CLLocationCoordinate2D(latitude: 41.4196222,longitude: 2.1844287),title: "Custom title text",subtitle: "Custom subtitle text",movie: "0001")
        
//        self.m_map?.addAnnotation(annotation)

    // END-CODE-UOC-3
    
    }
    
    // BEGIN-CODE-UOC-7
    
    // END-CODE-UOC-7
    
    
    
    
    // BEGIN-CODE-UOC-4
    
    // END-CODE-UOC-4
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
