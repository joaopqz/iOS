import Foundation

public extension Data{
    func toModel<T: Codable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
