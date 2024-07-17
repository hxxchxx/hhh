import UIKit

class WordSetCreateViewModel: WordSetStorableViewModelType {
    struct Dependency {
        let coordinator: Coordinator
        let storage: WordSetStorageType
    }
    
    let coordinator: Coordinator
    let storage: WordSetStorageType
    
    init(dependency: Dependency) {
        self.coordinator = dependency.coordinator
        self.storage = dependency.storage
    }

        func create(_ viewController: UIViewController, title: String?) {
            if let title = title, !title.isEmpty {
                if !storage.createSet(title: title) {
                    let message = "동일한 제목으로 생성할 수 없습니다"
                    AlertView.showXMark(message)
                    UIAccessibility.post(notification: .announcement, argument: message)
                }
            } else {
                let message = "빈 제목으로 생성할 수 없습니다"
                AlertView.showXMark(message)
                UIAccessibility.post(notification: .announcement, argument: message)
            }
            
            coordinator.dismiss(viewController: viewController, animated: true)
        }
        
        func cancel(_ viewController: UIViewController) {
            coordinator.dismiss(viewController: viewController, animated: true)
        }
    }
