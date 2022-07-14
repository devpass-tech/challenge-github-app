import Foundation

protocol SampleDataSource {
    func fetchList(_ completion: @escaping (Result<[String], Error>) -> Void)
}

struct Service: SampleDataSource {
    func fetchList(_ completion: @escaping (Result<[String], Error>) -> Void) {
        completion(.success(["Repository 1", "Repository 2", "Repository 3"]))
    }
}

final class SampleApiDataSource: SampleDataSource {
    private let network: NetworkProtocol

    init(network: NetworkProtocol) {
        self.network = network
    }

    func fetchList(_ completion: @escaping (Result<[String], Error>) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json")!
        network.request(url: url) { (result: Result<[RepositoryResponse], Error>) in
            switch result {
            case .success(let restaurants):
                guard restaurants.isEmpty == false else {
                    completion(.failure(FetchListEmptyError()))
                    return
                }

                completion(.success(restaurants.map(\.name)))
            case .failure(let error):
                completion(.failure(FetchListError()))
            }
        }
    }

    struct FetchListEmptyError: Error {}
    struct FetchListError: Error {}
}

final class SampleCoreDataDataSource: SampleDataSource {
    func fetchList(_ completion: @escaping (Result<[String], Error>) -> Void) {
        completion(.success([]))
    }
}

struct RepositoryResponse: Codable {
    let name: String
    let category: String
}
