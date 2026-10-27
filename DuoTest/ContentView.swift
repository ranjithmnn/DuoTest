//
//  ContentView.swift
//  DuoTest
//
//  Created by Ranjith Menon on 18/10/2026.
//

import SwiftUI

struct ItemContainerView: View {
    
    @available(anyAppleOS 27.1, *)
    @State private var hinge: DeviceHinge?
    
    let item: DeviceItem = DeviceRepository.iPhone18Pro

    var body: some View {
        NavigationStack {
            if #available(anyAppleOS 27.1, *) {
                if hinge?.status == .closed {
                    ScrollView {
                        ItemIntroView(item: item)
                        ItemDetailsView(item: item)
                    }
                    .ignoresSafeArea()
                    .onHingeChange { oldContext, newContext in
                        hinge = newContext.hinge
                    }
                } else {
                    ArrangementView(
                        primary: {
                            ItemIntroView(item: item)
                                
                        },
                        secondary: {
                            ItemDetailsView(item: item)
                                .ignoresSafeArea()
                        }
                    )
                    .onHingeChange { oldContext, newContext in
                        hinge = newContext.hinge
                    }
//                    .arrangementViewStyle(.split.axes(.horizontal))
                }
            }
        }
    }
}

struct ItemIntroView: View {
    let item: DeviceItem

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
            }
            .padding()
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
    }
}

#Preview {
    ItemContainerView()
}
