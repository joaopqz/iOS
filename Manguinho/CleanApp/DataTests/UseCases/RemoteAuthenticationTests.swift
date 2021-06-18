import XCTest
import Domain
import Data

class RemoteAuthenticationTests: XCTestCase {

    func test_add_should_call_httpClient_with_correct_url () {
        let url = makeURL()
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.auth(authenticationModel: makeAuthenticationModel()){_ in}
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
}

extension RemoteAuthenticationTests{
    
    func makeSut(url: URL = URL(string: "http://any-url.com")!, file: StaticString = #filePath, line: UInt = #line) -> (sut: RemoteAuthentication, httpClientSpy: HttpClientSpy){
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAuthentication(url: url, httpClient: httpClientSpy) //system under test... classe a ser testada.
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: httpClientSpy, file: file, line: line)
        return (sut, httpClientSpy)
    }
}

