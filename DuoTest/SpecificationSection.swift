//
//  SpecificationSection.swift
//  DuoTest
//
//  Created by Ranjith Menon on 18/10/2026.
//


//
//  PhoneModel.swift
//  DuoTest
//

import Foundation

struct SpecificationSection: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let items: [(label: String, value: String)]
}

struct DeviceItem: Identifiable {
    let id = UUID()
    let name: String
    let tagline: String
    let intro: String
    let quickHighlights: [(icon: String, title: String, subtitle: String)]
    let specSections: [SpecificationSection]
}

enum DeviceRepository {
    static let iPhone18Pro = DeviceItem(
        name: "iPhone 18 Pro",
        tagline: "Apple A20 Pro · 2nm · Ceramic Shield 2",
        intro: """
        Announced September 2026, the iPhone 18 Pro introduces the 2nm Apple A20 Pro chipset, a 6.3-inch LTPO Super Retina XDR OLED display reaching up to 3,000 nits peak brightness, and an upgraded triple 48MP Pro camera system with dual-pixel PDAF, 4x periscope optical zoom, and 12GB Unified RAM.
        """,
        quickHighlights: [
            ("cpu", "A20 Pro (2 nm)", "Hexa-core 2x4.93 GHz + 4x2.64 GHz"),
            ("display", "6.3\" Super Retina XDR", "1206 x 2622 px, 120Hz LTPO, 3000 nits"),
            ("camera.aperture", "Triple 48 MP", "Wide f/1.5-4.0 + 4x Telephoto + Ultrawide"),
            ("memorychip", "12 GB RAM", "256 GB up to 2 TB NVMe storage"),
            ("battery.100.bolt", "4,056 / 4,288 mAh", "PD 3.2 fast charge, 25W MagSafe/Qi2")
        ],
        specSections: [
            SpecificationSection(
                title: "Body & Build",
                icon: "iphone.gen3",
                items: [
                    ("Dimensions", "150 x 71.9 x 8.8 mm (5.91 x 2.83 x 0.35 in)"),
                    ("Weight", "211 g (7.44 oz)"),
                    ("Build", "Ceramic Shield 2 front, aluminum frame, Ceramic Shield back"),
                    ("Protection", "IP68 dust/water resistant (up to 6m for 30 mins)"),
                    ("SIM", "Nano-SIM + dual eSIM / dual eSIM options")
                ]
            ),
            SpecificationSection(
                title: "Display",
                icon: "display",
                items: [
                    ("Type", "LTPO Super Retina XDR OLED, 120Hz ProMotion"),
                    ("HDR", "HDR10, Dolby Vision"),
                    ("Brightness", "1000 nits (typ), 1600 nits (HBM), 3000 nits (peak)"),
                    ("Resolution", "1206 x 2622 pixels (~460 ppi density, 19.5:9 ratio)"),
                    ("Protection", "Ceramic Shield 2 with anti-reflective coating")
                ]
            ),
            SpecificationSection(
                title: "Platform & Performance",
                icon: "cpu",
                items: [
                    ("OS", "iOS 27"),
                    ("Chipset", "Apple A20 Pro (2 nm)"),
                    ("CPU", "Hexa-core (2x 4.93 GHz + 4x 2.64 GHz)"),
                    ("GPU", "Apple GPU (7-core graphics)"),
                    ("Internal Storage", "256GB / 512GB / 1TB / 2TB NVMe"),
                    ("RAM", "12GB unified memory")
                ]
            ),
            SpecificationSection(
                title: "Main Camera System",
                icon: "camera",
                items: [
                    ("Wide (Primary)", "48 MP, f/1.5-4.0 variable aperture, 24mm, dual pixel PDAF, sensor-shift OIS"),
                    ("Telephoto", "48 MP, f/2.8, 100mm periscope, 4x optical zoom, 3D sensor-shift OIS"),
                    ("Ultrawide", "48 MP, f/2.2, 13mm, 120˚ FOV, PDAF"),
                    ("Depth", "TOF 3D LiDAR scanner"),
                    ("Video", "4K @ 24/25/30/60/100/120 fps, ProRes RAW, Apple Log 2, Spatial Video")
                ]
            ),
            SpecificationSection(
                title: "Selfie Camera",
                icon: "person.crop.square",
                items: [
                    ("Front Camera", "18 MP multi-aspect, f/1.9, 20mm ultrawide, PDAF"),
                    ("Sensors", "SL 3D depth & biometrics (Face ID)"),
                    ("Video", "4K @ 60fps, Dolby Vision HDR, ProRes RAW, Gyro-EIS")
                ]
            ),
            SpecificationSection(
                title: "Battery & Charging",
                icon: "battery.100.bolt",
                items: [
                    ("Capacity", "4,056 mAh (Nano-SIM) / 4,288 mAh (eSIM model)"),
                    ("Wired Charging", "USB-PD 3.2 (50% in 15 min)"),
                    ("Wireless", "25W MagSafe / Qi2 (50% in 30 min)"),
                    ("Reverse Charging", "4.5W reverse wired charging via Type-C")
                ]
            ),
            SpecificationSection(
                title: "Connectivity & Features",
                icon: "antenna.radiowaves.left.and.right",
                items: [
                    ("WLAN", "Wi-Fi 7 (802.11be), tri-band"),
                    ("Bluetooth", "6.0, A2DP, LE"),
                    ("Port", "USB Type-C 3.2 Gen 2 (up to 10Gbps), DisplayPort"),
                    ("Satellite", "Emergency SOS, Messages, and Find My via satellite"),
                    ("Ultra-Wideband", "UWB Gen 2 chip")
                ]
            )
        ]
    )
}