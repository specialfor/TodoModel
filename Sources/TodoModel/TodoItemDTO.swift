//
//  TodoItemDTO.swift
//  TodoMVC
//
//  Created by Volodymyr Hryhoriev on 01.05.2020.
//  Copyright © 2020 Volodymyr Hryhoriev. All rights reserved.
//

import CRDT

public struct TodoItemDTO: Hashable, Codable, Mergable {
    public typealias ID = String

    public var id: ID
    public var title: MVRegister<String>
    public var tags: AWSet<String>
    public var isDone: EWFlag

    public init(id: ID, title: MVRegister<String>, tags: AWSet<String>, isDone: EWFlag) {
        self.id = id
        self.title = title
        self.tags = tags
        self.isDone = isDone
    }

    // MARK: - Mergable

    public mutating func merge(_ object: TodoItemDTO) {
        title.merge(object.title)
        tags.merge(object.tags)
        isDone.merge(object.isDone)
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: TodoItemDTO, rhs: TodoItemDTO) -> Bool {
        return lhs.id == rhs.id
    }
}
