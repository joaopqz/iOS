import Foundation
import Data
import Domain

public func makeRemoteAddAccount() -> AddAccount{
    return makeRemoteAddAccount(with: makeAlamofireAdapter())
}

public func makeRemoteAddAccount(with httpClient: HttpPostClient) -> AddAccount{
    let remoteAddAccount = RemoteAddAccount(url: makeApiUrl(path: "signup"), httpClient: httpClient)
    return MainQueueDispatchDecorator(remoteAddAccount)
}
