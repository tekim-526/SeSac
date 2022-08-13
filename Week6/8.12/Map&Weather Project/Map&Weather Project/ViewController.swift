//
//  ViewController.swift
//  Map&Weather Project
//
//  Created by Kim TaeSoo on 2022/08/13.
//

import UIKit
import MapKit

import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var weatherImageView: UIImageView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        checkDeviceLocationAuth()
    }
    
    func mapViewSetUp(center: CLLocationCoordinate2D) {

        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "내 위치"
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
    }
    func checkDeviceLocationAuth() {
        let authStatus: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            authStatus = locationManager.authorizationStatus
        } else {
            authStatus = CLLocationManager.authorizationStatus()
        }
        
        if CLLocationManager.locationServicesEnabled() {
            // 기기 위치설정이 되어 있으므로 앱 설정 체크
            checkAppLocationAuth(authStatus: authStatus)
        } else {
            // 기기 위치설정 안되있는 경우 -> Alert 띄우고 설정으로 유도
            showAlert()
        }
    }
    func checkAppLocationAuth(authStatus: CLAuthorizationStatus) {
        switch authStatus {
        case .notDetermined:
            print("notDetermined")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        case .restricted, .denied:
            // 아이폰 설정으로 유도
            showAlert()
            print("denied")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation()
        default: print("DEFAULT")
        }
    }
    func showAlert() {
        let alert = UIAlertController(title: "권한 주세요", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "설정으로 가기", style: .destructive) {_ in
            let url = UIApplication.openSettingsURLString
            if let goSetting = URL(string: url) {
                UIApplication.shared.open(goSetting)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    // 현재 위치
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            mapViewSetUp(center: coordinate)
            print("DID_UPDATE_LOCATIONS_FUNCTION_EXCUTED", #function)
            WeatherAPIManager(latitude: coordinate.latitude, longitude: coordinate.longitude).getWeather { info  in
                guard let url = URL(string: "\(info.iconURL)") else { return }
                self.weatherImageView.kf.setImage(with: url)
                self.weatherImageView.contentMode = .scaleAspectFill
                self.weatherImageView.reloadInputViews()
                self.weatherLabel.text = "현재온도 \(info.temp.rounded())\n오늘 최고기온\(info.temp_max.rounded())\n오늘 최저기온\(info.temp_min.rounded())"
                
            }
        }
        locationManager.stopUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        showAlert()
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkDeviceLocationAuth()
    }
}
