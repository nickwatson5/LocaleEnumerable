//
//  LanguageTableProvider.swift
//  LocaleEnumerable
//
//  Created by Nick Watson on 14/02/2024.
//

import Foundation

protocol LanguageTableProvideable {

    var currentSupportedLanguageTable: String { get }

}

final class LanguageTableProvider: LanguageTableProvideable {

    static let shared: LanguageTableProvider = LanguageTableProvider()

    private static let defaultLanguageTablePrefix = "Localizable"

    private let preferredLanguage: String

    init(preferredLanguage: String = Locale.preferredLanguages.first ?? "") {
        self.preferredLanguage = preferredLanguage
    }

    lazy var currentSupportedLanguageTable: String = {
        let preferredLanguageWithoutRegion =
            preferredLanguage.split(separator: "-").first ?? ""
        let languageTableFile = "\(LanguageTableProvider.defaultLanguageTablePrefix)-\(String(preferredLanguageWithoutRegion).uppercased())"
        if Bundle.main.path(forResource: languageTableFile, ofType: "strings") != nil {
            return languageTableFile
        } else {
            return "\(LanguageTableProvider.defaultLanguageTablePrefix)-EN"
        }
    }()

}
