//
//  TheaterViewController.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/11.
//

import UIKit
import MapKit
import CoreLocation

class TheaterViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mapKitView: MKMapView!
    
    let locationManager = CLLocationManager()
    var annotationList: [MKPointAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        
        theaterAnnotation()
        setupCenter(center: center, title: "청년취업사관학교")
        
    }
    
    // MARK: - Methods
    
    func theaterAnnotation() {
        for theaterModel in TheaterList().mapAnnotations {
            let point = MKPointAnnotation()
            let location = CLLocationCoordinate2D(latitude: theaterModel.latitude, longitude: theaterModel.longitude)
            point.title = theaterModel.location
            point.coordinate = location
            annotationList.append(point)
        }
        mapKitView.addAnnotations(annotationList)
        
    }
    
    // MapKitView Default Setting
    func setupCenter(center : CLLocationCoordinate2D, title: String) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 23000, longitudinalMeters: 23000)
        mapKitView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = title

        
        mapKitView.addAnnotation(annotation)
        
    }
    
    
    // Device Location Auth Check
    func deviceLocationAuthorizationCheck() {
        let auth: CLAuthorizationStatus
        if #available(iOS 14.0, *) {
            auth = locationManager.authorizationStatus
        } else {
            auth = CLLocationManager.authorizationStatus()
        }
        
        if CLLocationManager.locationServicesEnabled() {
            appLocationAuthorizationCheck(deviceAuth: auth)
        } else {
            
            print("앱을 사용하려면 설정에서 위치 권한을 켜주어야 합니다")
        }
        
    }
    
    // App Location Auth Check
    func appLocationAuthorizationCheck(deviceAuth: CLAuthorizationStatus) {
        switch deviceAuth {
        case .notDetermined:
            print("NOT DETERMINED")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        case .restricted, .denied:
            showRequestLocationServiceAlert()
            print("DENIED")
        case .authorizedWhenInUse:
            print("WHEN IN USE")
            locationManager.startUpdatingLocation()
        default: print("DEFAULT")
        }
    }
    
    
    // NO Auth Alert
    func showRequestLocationServiceAlert() {
      let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
      let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
          if let url = URL(string: UIApplication.openSettingsURLString) {
              UIApplication.shared.open(url)
          }
      }
      let cancel = UIAlertAction(title: "취소", style: .default)
      requestLocationServiceAlert.addAction(cancel)
      requestLocationServiceAlert.addAction(goSetting)
      
      present(requestLocationServiceAlert, animated: true, completion: nil)
    }

    func showActionSheet() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        
        alert.addAction(alertActions(title: "롯데시네마"))
        alert.addAction(alertActions(title: "메가박스"))
        alert.addAction(alertActions(title: "CGV"))
        alert.addAction(alertActions(title: "전체보기"))
        alert.addAction(cancel)
        present(alert, animated: true) {
            self.mapKitView.reloadInputViews()
        }
        
    }

    func alertActions(title: String) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: .default) { _ in
            let annotationsWillRemoved = self.annotationList.filter { annotation in
                return title == "전체보기" ? annotation.title!.contains(title) : !annotation.title!.contains(title)
            }
            let annotaionsWillShowed = self.annotationList.filter{ annotation in
                return title == "전체보기" ? !annotation.title!.contains(title) : annotation.title!.contains(title)
            }
            self.mapKitView.addAnnotations(annotaionsWillShowed)
            self.mapKitView.removeAnnotations(annotationsWillRemoved)
        }
        return action
    }
  
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        showActionSheet()
    }
    
}

// MARK: - Theater ViewController Extensions

extension TheaterViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locationLabel.text = "현재위치\n" +
        "위도 \(locations.last?.coordinate.latitude ?? CLLocationCoordinate2D().latitude)\n" +
        "경도 \(locations.last?.coordinate.longitude ?? CLLocationCoordinate2D().longitude)"
        if let coordinate = locations.last?.coordinate {
            setupCenter(center: coordinate, title: "내 위치")
        }
        locationManager.stopUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        deviceLocationAuthorizationCheck()
    }
}

extension TheaterViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        locationManager.startUpdatingLocation()
    }
}
