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
        
        initViews()
        
        // END-CODE-UOC-2
        
        
        
        
        // BEGIN-CODE-UOC-5
        
        
        
        // END-CODE-UOC-5
        
        
        // BEGIN-CODE-UOC-6
        
        // END-CODE-UOC-6
        
    }
    
    func initViews() {
        let mapView = UIView()
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

        self.view.addSubview(mapView)
        self.view.addSubview(videoView)
        self.view.addSubview(controlsView)
        controlsView.addSubview(playView)
        controlsView.addSubview(pauseView)

        mapView.translatesAutoresizingMaskIntoConstraints = false
        videoView.translatesAutoresizingMaskIntoConstraints = false
        controlsView.translatesAutoresizingMaskIntoConstraints = false
        playView.translatesAutoresizingMaskIntoConstraints = false
        pauseView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mapView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor),
            
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
    
    @objc func playTapped() {
        print("Play")
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
