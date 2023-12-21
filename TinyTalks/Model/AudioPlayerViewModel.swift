//
//  AudioPlayerViewModel.swift
//  TinyTalks
//
//  Created by Afrah Saleh on 08/06/1445 AH.
//

import Foundation
import AVFoundation

class AudioPlayerViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer?
    var audioQueue: [String] = []
    
    // The language code is initially set to the device's current setting.
    // You can update this value if your app allows changing the language internally.
    var currentLanguageCode: String = Locale.current.language.languageCode?.identifier ?? "en"

    func queueAudioFiles(with labels: [String]) {
           // This will create file names such as "Greeting_en.mp3" or "Greeting_ar.mp3"
           audioQueue = labels.map { "\($0)_\(currentLanguageCode).mp3" }
           playNextAudioClip()
       }

    private func getLocalizedSoundFileName(for label: String, languageCode: String) -> String {
        // Assuming you have a naming convention for audio files
        // E.g., "Hello_en.mp3" for English and "Hello_ar.mp3" for Arabic
        let localizedFileName = "\(label)_\(languageCode).mp3"
        return localizedFileName
    }

    private func playNextAudioClip() {
        guard !audioQueue.isEmpty, let nextClip = audioQueue.first else { return }
        audioQueue.removeFirst() // Remove the clip from the queue
        playSound(named: nextClip)
    }

    private func playSound(named soundFileName: String) {
        guard let path = Bundle.main.path(forResource: soundFileName, ofType: nil) else {
            print("Unable to find the sound file \(soundFileName)")
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.play()
        } catch {
            print("Couldn't load sound file: \(error)")
            playNextAudioClip() // Proceed to the next clip if there's an error
        }
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            playNextAudioClip() // Play the next clip in the queue
        }
    }
}
