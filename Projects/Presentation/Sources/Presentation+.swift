//
//  Presentation+.swift
//  Presentation
//
//  Created by root0 on 2023/11/27.
//

import Foundation
import SwiftUI

extension View {
	
}

struct NavigationSplitViewWrapper<Sidebar, Content, Detail>: View where Sidebar: View, Content: View, Detail: View {
	
	private var sidebar: Sidebar
	private var content: Content
	private var detail: Detail
	
	init(
		@ViewBuilder sidebar: () -> Sidebar,
		@ViewBuilder content: () -> Content,
		@ViewBuilder detail: () -> Detail
	) {
		self.sidebar = sidebar()
		self.content = content()
		self.detail = detail()
	}
	
	init(
		@ViewBuilder sidebar: () -> Sidebar,
		@ViewBuilder detail: () -> Detail
	) where Content == EmptyView {
		self.sidebar = sidebar()
		self.content = EmptyView()
		self.detail = detail()
	}
	
	var body: some View {
		if #available(iOS 16, macOS 13, tvOS 16, watchOS 9, visionOS 1, *) {
			NavigationSplitView {
				sidebar
			} content: {
				content
			} detail: {
				detail
			}
		} else {
			NavigationView {
				sidebar
				content
				detail
			}.navigationViewStyle(.columns)
		}
	}
}
