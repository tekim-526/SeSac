//
//  APIKey.swift
//  LoginWithServer
//
//  Created by Kim TaeSoo on 2022/11/02.
//

import Foundation

import Alamofire


enum GetIn {
    case signup(username: String, email: String, password: String)
    case login(email: String, password: String)
    case profile
}

extension GetIn {
    var url: String {
        switch self {
        case .signup:
            return "http://api.memolease.com/api/v1/users/signup"
        case .login:
            return "http://api.memolease.com/api/v1/users/login"
        case .profile:
            return "http://api.memolease.com/api/v1/users/me"
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .signup, .login:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        case .profile:
            return [
                "Authorization" : "Bearer \(UserDefaults.standard.string(forKey: "token")!)",
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .signup(let username, let email, let password):
            return [
                "userName" : username,
                "email": email,
                "password" : password
            ]
        case .login(let email, let password):
            return [
                "email": email,
                "password" : password
            ]
        default: return ["": ""]
        }
    }
}

struct Login: Codable {
    let token: String
}
struct Profile: Codable {
    let user: User
}

struct User: Codable {
    let photo: String
    let email: String
    let username: String
}

class APISetup {
    private let baseURL = "http://api.memolease.com/api/v1/users/"
    
    // post
    func login(email: String, password: String, completion: @escaping () -> Void) {
        let login = GetIn.login(email: email, password: password)
        AF.request(login.url, method: .post, parameters: login.parameters, headers: login.headers).validate(statusCode: 200...299).responseDecodable(of: Login.self) { response in
            switch response.result {
            case .success(let data):
                UserDefaults.standard.set(data.token, forKey: "token")
                print("token : \(data)")
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func signup(username: String, email: String, password: String, completion: @escaping () -> Void) {
        let signup = GetIn.signup(username: username, email: email, password: password)
        AF.request(signup.url, method: .post, parameters: signup.parameters, headers: signup.headers).validate(statusCode: 200...299).response { response in
            switch response.result {
            case .success(let data):
                print(data) // ok
                UserDefaults.standard.set(true, forKey: "signupSucceed")
                completion()
            case .failure(let error):
                print("signupFailed")
                print(error)
            }
        }
    }
    
    func profile() {
        let profile = GetIn.profile
        AF.request(profile.url, method: .get, headers: profile.headers).validate(statusCode: 200...299).responseDecodable(of: Profile.self) { response in
            switch response.result {
            case .success(let data):
                print(data.user)
            case .failure(let error):
                print(error)
            }
        }
    }
}
