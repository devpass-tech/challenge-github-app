import Foundation

protocol NetworkProtocol {
    func request<T: Codable>(url: URL, completion: @escaping (Result<[T], Error>) -> Void)
}

final class NetworkManager: NetworkProtocol {
    private let session: DataTaskProtocol

    init(session: DataTaskProtocol) {
        self.session = session
    }

    func request<T: Codable>(url: URL, completion: @escaping (Result<[T], Error>) -> Void) {
        session.wrappedDataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(NetworkRequestFailed()))
                return
            }

            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200 else {
                completion(.failure(NetworkRequestFailed()))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkInvalidData()))
                return
            }

            do {
                let decode = try JSONDecoder().decode([T].self, from: data)
                completion(.success(decode))
            } catch {
                completion(.failure(error))
            }
        }
    }

    struct NetworkRequestFailed: Error {}
    struct NetworkInvalidData: Error {}
}

protocol DataTaskProtocol {
    func wrappedDataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: DataTaskProtocol {
    func wrappedDataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = dataTask(with: url, completionHandler: completionHandler)
        dataTask.resume()
    }
}
