import Foundation

func makeInvalidData() -> Data{
    return Data("invalid_data".utf8)
}

func makeValidData() -> Data{
    return Data("{\"name\":\"Joao\"}".utf8)
}

func makeURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func makeError() -> Error {
    return NSError(domain: "any_error", code: 0)
}

func makeHttpResponse(statusCode: Int = 200) -> HTTPURLResponse {
    return HTTPURLResponse(url: makeURL(), statusCode: 200, httpVersion: nil, headerFields: nil)!
}
