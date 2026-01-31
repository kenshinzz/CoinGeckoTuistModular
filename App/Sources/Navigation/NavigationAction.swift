//
//  NavigationAction.swift
//  CryptoApp
//
//  Created by Gorawit Tapsanongsuk on 31/1/2569 BE.
//
import SwiftUI

public struct NavigationAction {
  typealias Action = (Route) -> Void
  let action: Action
  func callAsFunction(_ route: Route) {
    action(route)
  }
}

public extension EnvironmentValues {
  @Entry var navigate = NavigationAction(action: { _ in })
}
