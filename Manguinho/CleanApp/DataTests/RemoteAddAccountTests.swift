//
//  DataTests.swift
//  DataTests
//
//  Created by João Queiroz | Gerencianet on 31/05/21.
//

import XCTest

class RemoteAddAccount{
    
    private let url: URL
    private let httpClient: HttpClient
    
    init(url: URL, httpClient: HttpClient){
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(){
        httpClient.post(url: url)
    }
}

protocol HttpClient {
    
    func post(url: URL)
}

class RemoteAddAccountTests: XCTestCase {

    func test_add_should_call_httpClient_with_correct_url() {
        let url = URL(string: "http://any-url.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy) //system under test... classe a ser testada.
        sut.add()
        XCTAssertEqual(httpClientSpy.url, url)
    }

    class HttpClientSpy: HttpClient {
        var url: URL?
        
        func post(url: URL){
            self.url = url
        }
    }
    
}
