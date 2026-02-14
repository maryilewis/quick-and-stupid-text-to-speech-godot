# Quick and Stupid Text-To-Speech for Godot

Made with Godot 4.6.

Demo: TODO add link to demo

This is a very simple example of how to add Animal Crossing-like speech to a Godot project.

## How it works

* I recorded myself saying alphabet sounds.
* I chopped up the recording to 1 file per letter sound.
* I added a function that loads the files.
* I added a function that takes a string and for each character (letter) it plays the relevant audio file.
* I added pitch shift to the audio stream player to speed up the speech, and pitch shift to bring the tone back down a little.
* I added a timer so that each character gets to play for the same amount of time. It seemed a little slow to me otherwise. You can set "Use Character Timer" to false in the inspector to disable this.

## How you can use it

* You are free to use everything in this project, including the voice files. (Although I didn't pay much attention to audio quality. For example, my "P" is really "popping.")

## How to make it your own

* You can record your own version of the alphabet. Get one from all your friends for your different characters!
* Adjust pitch scale on the audio stream and pitch shift on the bust to get different "voices"

## Troubleshooting

If it isn't working in your project:
* Make sure you are reading files from the correct path
* Make sure your AudioStreamPlayer is pointing to the right bus
* Is your volume up?
