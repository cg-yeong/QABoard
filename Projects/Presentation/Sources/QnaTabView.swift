//
//  QnaTabView.swift
//  Presentation
//
//  Created by root0 on 2023/11/27.
//

import SwiftUI

public enum QnaTabItems: Int, CaseIterable {
	case write = 0
	case exam
	case library
	
	var title: String {
		switch self {
		case .write: return "write"
		case .exam: return "exam"
		case .library: return "library"
		}
	}
	
	var iconName: String {
		switch self {
		case .write: return "doc.on.doc"
		case .exam: return "doc.append"
		case .library: return "books.vertical"
		}
	}
}

public struct QnaTabView: View {
	
	@State var selectedTab = 0
	
	public init(selectedTab: Int = 0) {
		self.selectedTab = selectedTab
	}
	public var body: some View {
		
		ZStack(alignment: .bottom) {
			TabView(selection: $selectedTab) {
				WriteView()
					.tag(0)
				
				ExamView()
					.tag(1)
				
				LibraryView()
					.tag(2)
			}
		}
		
		//ed
    }
}

public extension QnaTabView {
	///https://medium.com/geekculture/custom-tabbar-in-swiftui-4d239410ee73
	func tabItem(imageName: String, title: String, isActive: Bool) -> some View {
		
		HStack(spacing: 10) {
			Spacer()
			Image(imageName)
				.resizable()
				.renderingMode(.template)
				.foregroundStyle(isActive ? Color.black : .gray)
				.frame(width: 20, height: 20)
			if isActive {
				Text(title)
					.font(.system(size: 12))
					.foregroundStyle(isActive ? Color.black : .gray)
			}
			Spacer()
		}
		.frame(width: isActive ? .infinity : 60, height: 60)
		.background(isActive ? .purple.opacity(0.4) : .clear)
		.clipShape(RoundedRectangle(cornerRadius: 30.0))
	}
}


struct WriteView: View {
	var body: some View {
		Text("write")
	}
}
struct LibraryView: View {
	var body: some View {
		Text("library")
	}
}

#Preview {
    QnaTabView()
}
