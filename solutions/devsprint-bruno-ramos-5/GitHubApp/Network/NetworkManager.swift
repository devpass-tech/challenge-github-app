import Foundation

final class NetworkManager {
    func request<T: Codable>(url: URL, completion: @escaping (Result<[T], Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }

            do {
                let decode = try JSONDecoder().decode([T].self, from: data!)
                completion(.success(decode))
            } catch {
                completion(.failure(error))
            }
        }

        dataTask.resume()
    }
}

struct Restaurant: Codable {
    let name: String
    let category: String
}
