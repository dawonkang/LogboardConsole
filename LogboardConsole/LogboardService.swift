import Foundation
import Logboard
import HaishinKit

protocol LogboardServiceDelegate: class {
    func onData(_ data:Logboard.Data)
}

final class LogboardService: HaishinKit.NetService {
    weak var delegate:LogboardServiceDelegate?

    func client(inputBuffer client: NetClient) {
        defer {
            client.inputBuffer.removeAll()
        }
        guard let data = Logboard.Data(client.inputBuffer) else {
            return
        }
        delegate?.onData(data)
    }
}
