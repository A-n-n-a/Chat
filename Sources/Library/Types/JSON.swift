//
//  JSON.swift
//  Chat
//
//  Created by Anna on 10.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

typealias JSON = [String: AnyObject]

func transformJSON<Result>(_ json: JSON, key: String) -> Result? {
    return json[key].flatMap(cast)
}

let toJSON: (JSON, String) -> JSON? = transformJSON
let toJSONInt: (JSON, String) -> Int? = transformJSON
let toJSONID: (JSON, String) -> ID? = { toJSONInt($0, $1).map(toID) }
let toJSONString: (JSON, String) -> String = { transformJSON($0, key: $1) ?? "" }
let toJSONArray: (JSON, String) -> [JSON] = { transformJSON($0, key: $1) ?? [] }
