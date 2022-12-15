import Foundation

extension String {

    static func repositoryInfo(repositoriesCount: Int, bifurcationsCount: Int) -> String {

        return "\(repositoriesCount) stars   \(bifurcationsCount) bifurcations"
    }
}
