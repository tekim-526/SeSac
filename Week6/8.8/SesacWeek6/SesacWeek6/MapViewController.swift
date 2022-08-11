//
//  MapViewController.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/11.
//

import UIKit
import MapKit

// location 1. import
import CoreLocation


/*
 MapView
 - 지도와 위치권한은 상관X
 - 만약 지도에 현재 위치등을 표현하고 싶다면 위치권한을 등록해주어야 함
 */


class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    // location 2. Location Manager 생성 - 위치에 대한 대부분을 담당
    // 인스턴스 생성될떄 delegate메서드가 바로 호출됨
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // location 3. 프로토콜 채택
        locationManager.delegate = self
        // 제거 가능한 이유 명확히 알기
//        checkUserDeviceLocationServiceAuthorization()
        let center = CLLocationCoordinate2D(latitude: 37.520870, longitude: 127.022772)
        setRegionAndAnnotation(center: center)
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        // 지도 중심 설정 : 애플맵 활용해 좌표복사
        
        
        // 지도 중심 기반으로 보여질 범위
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 300, longitudinalMeters: 300)
        mapView.setRegion(region, animated: true)
        
        // 지도에 핀 추가
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "apple store"
        mapView.addAnnotation(annotation)
        
    }

}


// MARK: - 위치와 관련된 User Defined Method
extension MapViewController {
    // location 7. iOS 버전에 따른 분기처리 및 ios 위치서비스 활성화 여부 확인
    // 위치 서비스가 켜져있다면 권한을 요청하고, 꺼져있다면 커스텀 "alert"으로 상황 알려주기
    /*
     CLAuthorizationStatus -> 열거형
     - denied : 허용안함 / 설정에서 추후 거부 / 위치 서비스 자체를 비활성화 / 비행기 모드
     - restricted : 앱 권한 자체 없는 경우 / 자녀 보호 기능등으로 제한을 해놓은 상태
     */
    func checkUserDeviceLocationServiceAuthorization() {
        
        let authorizationStatus: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            // 프로퍼티를 통해 locationManager가 가지고 있는 상태를 가져옴
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        // iOS 위치 서비스 활성화 여부 체크: locationServicesEnabled()
        if CLLocationManager.locationServicesEnabled() {
            // 위치서비스가 활성화 되어 있으므로, 위치 권한 요청 가능
            checkUserCurrentLocationAuthorization(authorizationStatus)

        } else {
            showRequestLocationServiceAlert()
            print("위치서비스 꺼져있당")
        }
        
        
    }
    
    // location 8. 사용자의 위치 권한 상태 확인
    // 사용자가 위치를 허용했는지, 거부했는지, 아직 선택하지 않았는지 등을 확인 (단, 사전에 iOS 위치 서비스 활성화 꼭 확인)
    func checkUserCurrentLocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
        switch authorizationStatus {
        case .notDetermined:
            print("NOT DETERMINED")
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization() // 앱을 사용하는 동안
            locationManager.startUpdatingLocation()
            
        case .restricted, .denied:
            showRequestLocationServiceAlert()
            print("DENIED, 아이폰 설정으로 유도")
        case .authorizedWhenInUse:
            print("앱을 사용하는 동안, WHEN IN USE")
            // 사용자가 위치를 허용해둔 상태라면, startUpdatingLocation을 통해 didUpdateLocations 메서드가 실행
            locationManager.startUpdatingLocation()
        default: print("DEFAULT")
        }
    }
    
    func showRequestLocationServiceAlert() {
      let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
      let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
          
          // 설정까지 이동하거나 설정 세부화면까지 이동하거나는 통제 불가능
          
          if let appSetting = URL(string: UIApplication.openSettingsURLString) {
              UIApplication.shared.open(appSetting)
          }
      }
      let cancel = UIAlertAction(title: "취소", style: .default)
      requestLocationServiceAlert.addAction(cancel)
      requestLocationServiceAlert.addAction(goSetting)
      
      present(requestLocationServiceAlert, animated: true, completion: nil)
    }
    
    
}



// MARK: - MKMapViewDelegate -> Extension
extension MapViewController: MKMapViewDelegate {
    
    // 지도에 커스텀 핀 추가
    // func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? { }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        locationManager.startUpdatingLocation()
    }
}



// MARK: - CLLocationManagerDelegate -> Extension
// location 4. 프로토콜 선언
extension MapViewController: CLLocationManagerDelegate {
    
    // location 5. 사용자의 위치를 성공적으로 가지고 온 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function, locations)
        // ex. 위도 경도 기반으로 날씨 정보를 조회
        // ex. 지도를 다시 세팅
        if let coordinate = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinate)
        }
        
        // 위치 업데이트 멈추는 기능 -> desiredAccuracy랑 연관이 되어있어서 어느정도 위치가 바뀌면 다시 업데이트 됨
        locationManager.stopUpdatingLocation()
    }
    
    // location 6. 사용자의 위치를 가지고 오지 못한 경우 ex 비행기 안
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    // location9. 사용자의 권한 상태가 바뀔 때를 알려줌
    // iOS 14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkUserDeviceLocationServiceAuthorization()
    }
    // iOS 14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
