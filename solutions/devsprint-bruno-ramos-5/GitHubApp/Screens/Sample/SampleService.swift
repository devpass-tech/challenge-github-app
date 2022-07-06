import Foundation

protocol SampleServiceProtocol {
    func fetchRepositories(completion: @escaping (Result<[String], Error>) -> Void)
}

final class SampleService: SampleServiceProtocol {
    private let dataSource: SampleDataSource

    init(dataSource: SampleDataSource) {
        self.dataSource = dataSource
    }

    func fetchRepositories(completion: @escaping (Result<[String], Error>) -> Void) {
        dataSource.fetchList { repositories in
            if repositories.isEmpty {
                completion(.failure(RepositoriesNotFoundError()))
            } else {
                completion(.success(repositories))
            }
        }
    }

    struct RepositoriesNotFoundError: Error {}
}
