//
//  Repository.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 14/01/22.
//

import Foundation

// MARK: - Repository

struct Repository: Decodable {
    let id: Int
    let nodeID, name, fullName: String
    let welcome4Private: Bool
    let owner: Owner
    let htmlURL: String
    let welcome4Description: String?
    let fork: Bool
    let url: String
    let forksURL: String
    let keysURL, collaboratorsURL: String
    let teamsURL, hooksURL: String
    let issueEventsURL: String
    let eventsURL: String
    let assigneesURL, branchesURL: String
    let tagsURL: String
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String
    let statusesURL: String
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String
    let subscriptionURL: String
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String
    let contentsURL, compareURL: String
    let mergesURL: String
    let archiveURL: String
    let downloadsURL: String
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String
    let labelsURL, releasesURL: String
    let deploymentsURL: String
    let createdAt, updatedAt, pushedAt: Date
    let gitURL, sshURL: String
    let cloneURL: String
    let svnURL: String
    let homepage: String?
    let size, stargazersCount, watchersCount: Int
    let language: [String]
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool
    let hasPages: Bool
    let forksCount: Int
    let mirrorURL: NSNull
    let archived, disabled: Bool
    let openIssuesCount: Int
    let license: NSNull
    let allowForking, isTemplate: Bool
    let topics: [Any?]
    let visibility: String
    let forks, openIssues, watchers: Int
    let defaultBranch: String
    let permissions: Permissions
}

// MARK: - Owner

struct Owner: Decodable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL: String
    let gistsURL: String
    let starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
}

// MARK: - Permissions

struct Permissions: Decodable {
    let admin, maintain, push, triage: Bool
    let pull: Bool
}

