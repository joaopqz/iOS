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
