//
//  ContentView.swift
//  DuoTest
//
//  Created by Ranjith Menon on 18/10/2026.
//

import SwiftUI

struct ItemContainerView: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    let item: DeviceItem = DeviceRepository.iPhone18Pro

    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    var body: some View {
        NavigationStack {
            if #available(anyAppleOS 27.1, *) {
                DuoContainerView(item: item)
            } else {
                if isPad || verticalSizeClass == .compact {
                    HStack(spacing: 0) {
                        ItemIntroView(item: item, showsNavigationLink: false)
                            .frame(maxWidth: .infinity)
                        Divider()
                        ItemDetailsView(item: item)
                            .frame(maxWidth: .infinity)
                    }
                } else {
                    ItemIntroView(item: item, showsNavigationLink: true)
                }
            }
        }
    }
}

@available(anyAppleOS 27.1, *)
private struct DuoContainerView: View {
    let item: DeviceItem

    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var hinge: DeviceHinge?

    private var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    private var isSingleScreen: Bool {
        if isPad {
            return false
        }
        if let hinge {
            return hinge.status == .closed
        }
        return verticalSizeClass == .regular && horizontalSizeClass == .compact
    }

    var body: some View {
        Group {
            if isSingleScreen {
                ItemIntroView(item: item, showsNavigationLink: true)
            } else {
                ArrangementView(
                    primary: {
                        ItemIntroView(item: item, showsNavigationLink: false)
                    },
                    secondary: {
                        ItemDetailsView(item: item)
                            .ignoresSafeArea()
                    }
                )
            }
        }
        .onHingeChange { oldContext, newContext in
            hinge = newContext.hinge
        }
    }
}

struct ItemIntroView: View {
    let item: DeviceItem
    var showsNavigationLink: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.name)
                        .font(.largeTitle)
                        .bold()

                    Text(item.tagline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Text(item.intro)
                    .font(.body)
                    .lineSpacing(4)
                    .foregroundStyle(.primary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Key Highlights")
                        .font(.headline)

                    ForEach(item.quickHighlights, id: \.title) { highlight in
                        HStack(spacing: 14) {
                            Image(systemName: highlight.icon)
                                .font(.title3)
                                .foregroundColor(.blue)
                                .frame(width: 32)

                            VStack(alignment: .leading, spacing: 2) {
                                Text(highlight.title)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)

                                Text(highlight.subtitle)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                        }
                        .padding(12)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }

                if showsNavigationLink {
                    NavigationLink(destination: ItemDetailsView(item: item)) {
                        HStack {
                            Text("View Full Specifications")
                                .fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.top, 4)
                }
            }
            .padding()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if showsNavigationLink {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ItemDetailsView(item: item)) {
                        Text("Specs")
                            .fontWeight(.medium)
                    }
                }
            }
        }
    }
}

struct ItemDetailsView: View {
    let item: DeviceItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ForEach(item.specSections) { section in
                    VStack(alignment: .leading, spacing: 12) {
                        Label(section.title, systemImage: section.icon)
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.primary)

                        VStack(spacing: 0) {
                            ForEach(Array(section.items.enumerated()), id: \.offset) { index, spec in
                                HStack(alignment: .top) {
                                    Text(spec.label)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                        .frame(width: 120, alignment: .leading)

                                    Text(spec.value)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .foregroundStyle(.primary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 14)

                                if index < section.items.count - 1 {
                                    Divider()
                                        .padding(.horizontal, 14)
                                }
                            }
                        }
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Specifications")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ItemContainerView()
}
