import Foundation
import Data
import Domain

public func makeRemoteAuthentication() -> Authentication{
        return makeRemoteAuthentication(with: makeAlamofireAdapter())
}

public func makeRemoteAuthentication(with httpClient: HttpPostClient) -> Authentication{
    let remoteAuthentication = RemoteAuthentication(url: makeApiUrl(path: "login"), httpClient: httpClient)
    return MainQueueDispatchDecorator(remoteAuthentication)
}
