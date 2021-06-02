//
//  DataTests.swift
//  DataTests
//
//  Created by João Queiroz | Gerencianet on 31/05/21.
//

import XCTest
import Domain

class RemoteAddAccount{
    
    private let url: URL
    private let httpClient: HttpClient
    
    init(url: URL, httpClient: HttpClient){
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(addAccountModel: AddAccountModel){
        let data = try? JSONEncoder().encode(addAccountModel)
        httpClient.post(to: url, with: data)
    }
}

protocol HttpClient {
    
    func post(to url: URL, with data: Data?)
}

class RemoteAddAccountTests: XCTestCase {

    func test_add_should_call_httpClient_with_correct_url () {
        let url = URL(string: "http://any-url.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy) //system under test... classe a ser testada.
        sut.add(addAccountModel: makeAddAccountModel())
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    func test_add_should_call_httpClient_with_correct_data () {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: URL(string: "http://any-url.com")!, httpClient: httpClientSpy) //system under test... classe a ser testada.
        let addAccountModel = makeAddAccountModel()
        sut.add(addAccountModel: addAccountModel)
        let data = try? JSONEncoder().encode(addAccountModel)
        XCTAssertEqual(httpClientSpy.data, data)
    }
    
}

extension RemoteAddAccountTests{
    func makeAddAccountModel() -> AddAccountModel{
        return  AddAccountModel(name: "John Doe", email: "johndoe@mail.com", password: "doe1234", passwordConfimation: "doe1234")
    }
    class HttpClientSpy: HttpClient {
        var url: URL?
        var data: Data?
        
        func post(to url: URL, with data: Data?){
            self.url = url
            self.data = data
        }
    }
}
