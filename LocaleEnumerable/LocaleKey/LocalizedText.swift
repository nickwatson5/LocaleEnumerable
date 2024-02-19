//
//  LocalizedText.swift
//  LocaleEnumerable
//
//  Created by Nick Watson on 14/02/2024.
//

import Foundation

protocol Localizable: CaseIterable {

    var rawValue: String { get }

}

/// Opaque type that abstracts the localization's mechanism of the injected localeKey.
struct LocalizedText<T: Localizable> {

    private let localeKey: T
    private let languageTable: LanguageTableProvideable

    init(_ localeKey: T, languageTable: LanguageTableProvideable = LanguageTableProvider.shared) {
        self.localeKey = localeKey
        self.languageTable = languageTable
    }

    var text: String {
        return NSLocalizedString(localeKey.rawValue, tableName: languageTable.currentSupportedLanguageTable, comment: "")
    }

}
