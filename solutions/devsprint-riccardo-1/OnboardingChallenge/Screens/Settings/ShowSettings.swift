//
//  ShowScreens.swift
//  OnboardingChallenge
//
//  Created by Strawberry Pie on 12/14/21.
//

import Foundation

struct ShowSettings {
    struct DisplayedSettings {
        var item: String
    }
    enum Get {
        struct Request {
            var key: String
        }
        
        struct Response {
            var item: String
        }
        
        struct ViewModel {
            var displayed: DisplayedSettings
        }
    }
}
