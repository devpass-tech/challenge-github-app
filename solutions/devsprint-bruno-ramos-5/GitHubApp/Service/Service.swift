import Foundation

protocol SampleDataSource {
    func fetchList(_ completion: ([String]) -> Void)
}

struct Service: SampleDataSource {
    func fetchList(_ completion: ([String]) -> Void) {
        completion(["Repository 1", "Repository 2", "Repository 3"])
    }
}

final class SampleApiDataSource: SampleDataSource {
    func fetchList(_ completion: ([String]) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json")!
        NetworkManager().request(url: url) { (result: Result<[Restaurant], Error>) in
            switch result {
            case .success(let decodedObject):
                print("deu bom")
            case .failure(let error):
                print("deu ruim")
            }
        }
    }
}

final class SampleCoreDataDataSource: SampleDataSource {
    func fetchList(_ completion: ([String]) -> Void) {
        completion([])
    }
}
