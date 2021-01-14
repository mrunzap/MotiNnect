//
//  Motinnect.swift
//  MotiNnect
//
//  Created by donghun on 2021/01/14.
//

import Foundation

// String 구조체도 Equatable 을 구현했기 때문에 문자끼리 동등비교가 가능하다.
// Motinnect 구조체도 동등비교를 하기 위해서는 Euatable을 구현해야한다.
struct Motinnect: Codable,Equatable {
    //struct 내부에서 id를 변경하지 않으므로 상수 선언
    let id: Int
    var content: String
    var register_date: Date
    var habitor: String
    
    // 아이디가 같으면 True 아니면 False를 리턴한다.
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
