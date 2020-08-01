# VoiceMeeter Potato Activator

This is a simple GUI tool to activate VoiceMeeter Potato without having to buy the software.
The activator is working (as simple as a registry key change), but please donate to VB-Audio if you use VoiceMeeter on a daily basis.

# How does it works

Here is the only "active" line:

```autoit
RegWrite("HKEY_CURRENT_USER\VB-Audio\VoiceMeeter", "code", "REG_DWORD", 0x00123456)
```

Specifying a value in this registry key makes VoiceMeeter believes that it is activated, permanently.

# Is this a joke

Yes. For a whole bunch of reasons:

- A registry key change can be done with a simple `.reg` file
- This wrapper is made with one of the worst development languages of the world (no offense)
- What is the point of putting music and increasing the executable to more than 2MB, just for registry edit?

AutoIt is the first language I started with. I wanted to give it a new try for an afternoon, and rebuild something with it.
And if you have to do something, it must be done well.

# Download

Well, even if you should never trust `.exe` files that you find on the internet (especially on GitHub), you can download the compiled script here : [build/VoiceMeeterPotatoActivator_x64.exe](https://github.com/sucresware/voicemeeter-activator-autoit/blob/master/build/VoiceMeeterPotatoActivator_x64.exe)
