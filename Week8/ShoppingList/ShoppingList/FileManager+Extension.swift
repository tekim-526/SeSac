//
//  FileManager+Extension.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/24.
//

import UIKit

protocol FileManagerProtocol {
    func documentDirectoryPath() -> URL?
    func loadImageFromDocument(fileName: String) -> UIImage?
    func saveImageToDocument(fileName: String, image: UIImage?)
    func removeImageFromDocument(fileName: String)
    func fetchDocumentZipFile()
    func createDirectory(dirName: String)
}



extension FileManagerProtocol {
    func documentDirectoryPath() -> URL? {
            guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            return documentDirectory
    }
    
    func loadImageFromDocument(fileName: String) -> UIImage? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return UIImage() }
        let dirURL = documentDirectory.appendingPathComponent("image")
        let fileURL = dirURL.appendingPathComponent(fileName)
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return UIImage(contentsOfFile: fileURL.path)
        } else {
            return UIImage(systemName: "xmark")
        }
    }
    
    func saveImageToDocument(fileName: String, image: UIImage?) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let dirURL = documentDirectory.appendingPathComponent("image")
        let fileURL = dirURL.appendingPathComponent(fileName)
        
        guard let data = image?.jpegData(compressionQuality: 0.5) else { return }
        do {
            try data.write(to: fileURL)
        } catch let error {
            print(error)
        }
    }
    
    func removeImageFromDocument(fileName: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let dirURL = documentDirectory.appendingPathComponent("image")
        let fileURL = dirURL.appendingPathComponent(fileName)
        
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch let error {
            print(error)
        }
    }
    
    func fetchDocumentZipFile() {
        do {
            guard let path = documentDirectoryPath() else { return }
            let docs = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
            let zip = docs.filter { $0.pathExtension == "zip"}
            let result = zip.map { $0.lastPathComponent }
        } catch {
            print("err")
        }
    }
    
    func createDirectory(dirName: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
       
        let dataPath = documentDirectory.appendingPathComponent(dirName)
        if !FileManager.default.fileExists(atPath: dataPath.path) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}
