//
//  UIApplication+Extension.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 13.11.2021.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
