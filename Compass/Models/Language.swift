//
//  Language.swift
//  Compass
//
//  Created by Ayush Biswas on 20/09/25.
//


import TOMLDecoder
import Foundation

struct Language: Codable {
    var id: Int?
    var cf_id: Int?              // default if missing
    var name: String          // required
    var source_file: String   // default if missing
    var compiler_cmd: String?      // optional
    var compiler_args: [String]?   // optional
    var run_cmd: String       // default if missing
    var run_args: [String]?        // optional
    var check_args: [String]  // default empty
    var comment: String        // default empty
}

extension Language {
    func check() -> Bool {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/which")
        process.arguments = [self.compiler_cmd ?? self.run_cmd]
        
        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = Pipe()
        
        do {
            try process.run()
            process.waitUntilExit()
            return process.terminationStatus == 0
        } catch {
            return false
        }
    }
}

func load(_ filename: String) -> [String: Language] {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't file \(filename) in main bundle file.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = TOMLDecoder()
        var languages = try decoder.decode([String: Language].self, from: data)
        
        for (key, var lang) in languages {
            lang.id = Int(key) ?? 0
            languages[key] = lang
        }
        
        return languages
    } catch {
        fatalError("Couldn't parse \(filename):\n\(error)")
    }
}
