import Foundation

final class SampleService {
    private let localDataSource = Service()

    func fetchRepositories(completion: @escaping (Result<[String], Error>) -> Void) {
        localDataSource.fetchList {
            completion(.success($0))
        }
    }
}
