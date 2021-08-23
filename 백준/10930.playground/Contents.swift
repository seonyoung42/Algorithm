import Foundation
import UIKit
import CryptoKit

let valueArray = "Baekjoon"

let data = valueArray.data(using: .utf8)
let sha256 = SHA256.hash(data: data!)
let stringHash = sha256.map{ String(format: "%02x", $0)}.joined()

// sha256 = SHA256.Digets 여기서 Digest는 hash 함수를 통과한 이후의 데이터

print(stringHash)
