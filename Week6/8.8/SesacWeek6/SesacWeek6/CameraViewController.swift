//
//  CameraViewController.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/12.
//

import UIKit

import Alamofire
import SwiftyJSON
import YPImagePicker

class CameraViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    // UIImagePickerController 1. 인스턴스 생성
    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // UIImagePickerController 2. 델리게이트 연결
        picker.delegate = self
        
    }
    
    // MARK: - Methods
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("사용불가 + 사용자에게 토스트/얼럿")
            return
        }
        picker.sourceType = .camera
        picker.allowsEditing = false
        present(picker, animated: true)
    }
    
    @IBAction func photoLibraryButtonTapped(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary)  else {
            print("사용불가 + 사용자에게 토스트/얼럿")
            return
        }
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        present(picker, animated: true)
    }
    
    @IBAction func ypImagePickerButtonTapped(_ sender: UIButton) {
        let picker = YPImagePicker()
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                self.resultImageView.image = photo.image
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
    }
    @IBAction func saveToPhotoLibraryButtonTapped(_ sender: UIButton) {
        if let image = resultImageView.image {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    // 이미지 뷰 이미지 > 네이버 > 얼굴 분석 요청 > 응답
    // 문자열이 아닌 파일, 이미지, pdf 파일 자체가 그대로 전송 되지 않음. => 텍스트 형태로 인코딩
    // 어떤 파일의 종류가 서버에게 전달이 되는 지 명시 = Content-Type
    
    @IBAction func clovaFaceButtonTapped(_ sender: UIButton) {
        let url = "https://openapi.naver.com/v1/vision/celebrity"
        let header: HTTPHeaders = [
            "X-Naver-Client-Id" : "RrD8naCcIvoWUo1n0zYD",
            "X-Naver-Client-Secret" : "sAK7mnj7Cq",
            "Content-Type" : "multipart/form-data"
        ]
        
        // UIImage를 텍스트 형태(바이너리 타입)로 변환해야 함
        guard let imageData = resultImageView.image?.jpegData(compressionQuality: 0.25) else { return }
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image")
        }, to: url, headers: header)
        .validate(statusCode: 200...500).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("\n", json)
                print(json["faces"][0]["celebrity"]["value"])
                self.resultLabel.text = json["faces"][0]["celebrity"]["value"].stringValue
            case .failure(let error):
                print(error)
            }
        }
    }
}

// UIImagePickerController 3. 네비게이션 컨트롤러를 상속받고 있음
extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // UIImagePickerController 4. 사진을 선택하거나 카메라 촬영 직후(Use Photo 버튼 눌렀을 경우)
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(#function)
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            resultImageView.image = image
            dismiss(animated: true)
        }
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            resultImageView.image = image
            dismiss(animated: true)
        }
    }
    // UIImagePickerController 5. 취소 버튼 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(#function)
        dismiss(animated: true)
    }
}
