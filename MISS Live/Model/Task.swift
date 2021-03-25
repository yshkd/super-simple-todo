//
//  Task.swift
//  MISS Live
//
//  Created by yushi kida on 2021/03/12.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userID: String?
}

let testDataTasks = [
    Task(title: "Implement the ui", completed: true),
    Task(title: "Connect to firebase", completed: false),
    Task(title: "????", completed: false),
    Task(title: "Profit!", completed: false)
]
