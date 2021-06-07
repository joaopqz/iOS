import Foundation

public protocol Model: Codable {}

public extension Model{
    
    func toData() -> Data?{
        return try? JSONEncoder().encode(self)
    }
    
}
