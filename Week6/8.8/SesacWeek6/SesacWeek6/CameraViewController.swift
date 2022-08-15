//
//  CameraViewController.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/12.
//

import UIKit

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
    
    @IBAction func clovaFaceButtonTapped(_ sender: UIButton) {
        ClovaAPIManager.getCelebrityInfo(sourceImage: resultImageView) { value in
            self.resultLabel.text = value
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
