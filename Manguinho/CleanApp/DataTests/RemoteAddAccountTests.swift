//
//  DataTests.swift
//  DataTests
//
//  Created by João Queiroz | Gerencianet on 31/05/21.
//

import XCTest
import Data
import Domain


protocol HttpClient {
    
    func post(to url: URL, with data: Data?)
}

class RemoteAddAccountTests: XCTestCase {

    func test_add_should_call_httpClient_with_correct_url () {
        let url = URL(string: "http://any-url.com")!
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.add(addAccountModel: makeAddAccountModel())
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    func test_add_should_call_httpClient_with_correct_data () {
        let (sut, httpClientSpy) = makeSut()
        let addAccountModel = makeAddAccountModel()
        sut.add(addAccountModel: addAccountModel)
        XCTAssertEqual(httpClientSpy.data, addAccountModel.toData())
    }
    
}

extension RemoteAddAccountTests{
    
    func makeAddAccountModel() -> AddAccountModel{
        return  AddAccountModel(name: "John Doe", email: "johndoe@mail.com", password: "doe1234", passwordConfimation: "doe1234")
    }
    
    func makeSut(url: URL = URL(string: "http://any-url.com")!) -> (sut: RemoteAddAccount, httpClientSpy: HttpClientSpy){
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy) //system under test... classe a ser testada.
        return (sut, httpClientSpy)
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
