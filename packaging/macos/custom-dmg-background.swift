import AppKit
import Foundation
// Text-free background in the shared Craft community cobalt/violet palette.
guard CommandLine.arguments.count == 2 else { fatalError("Usage: swift custom-dmg-background.swift output.tiff") }
let size = NSSize(width: 960, height: 600)
let art = NSImage(size: size)
art.lockFocus()
let rect = NSRect(origin: .zero, size: size)
let light = NSColor(calibratedRed: 0.95, green: 0.96, blue: 1, alpha: 1)
let violet = NSColor(calibratedRed: 0.88, green: 0.86, blue: 0.98, alpha: 1)
NSGradient(starting: violet, ending: light)!.draw(in: rect, angle: 90)
NSColor(calibratedRed: 0.20, green: 0.37, blue: 0.86, alpha: 1).setFill()
NSRect(x: 0, y: 544, width: 960, height: 56).fill()
NSColor(calibratedRed: 0.46, green: 0.28, blue: 0.79, alpha: 1).setFill()
NSRect(x: 0, y: 536, width: 960, height: 8).fill()
art.unlockFocus()
guard let data = art.tiffRepresentation else { fatalError("Could not render DMG background") }
try data.write(to: URL(fileURLWithPath: CommandLine.arguments[1]), options: .atomic)
