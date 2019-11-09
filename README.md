# How to work on TotTag in the Vanderbilt SEA Lab

Hi, we're [Conner](https://www.connerpinson.com/) and Vedant and we had the honor of working with the Vanderbilt SEA Lab in the Spring and Fall 2019 semesters. We wanted to make a place where we can pass down all the knowledge we gathered over the past year (and Conner is obsessed with clean documentation) so we've made this GitHub to help new research assistants understand their role in SEA Lab and the TotTag team around the world.

## Navigating the Totternary GitHub

This is your home. Not a day will go by where you don't think about [this GitHub repository](https://github.com/lab11/totternary).

There are three folders that we, as Vanderbilt SEALab RAs, particularly care about. They are:

```
/software/carrier/apps/node
```
```
/software/module/firmware
```
```
/doc
```

Basically, the `/software/.../node` contains the software that needs to be flashed onto the nRF and the `/software/module/firmware` contains the software that needs to be flashed onto the STM.

## The Lab11 Tottag Slack

You should have been made a guest member of the Lab11 Slack group in the Tottag channel. The motto here is **ask early, ask often**. I guarantee you if you think it's a dumb question, I asked dumber. And the people in there are more than happy to help with any issue.

Our main helper is Andreas Biri. He is incredibly nice, however, he lives in Switzerland. So expect that, if you ask a question, it will not be answered until 2 or 3 AM. Our workflow was commonly to work until we encounter an issue, send a synopsis to Andreas for the issue, and wait to hear back on next steps.

I'm going to list off the people in the Slack so you can know what to expect from each person.

### External (current or former Lab11 at UC Berkeley)

**Andreas Biri** (PhD @ ETH Zurich)

**Pat Pannuto** (Assistant Professor @ UCSD)

**Neal Jackson**

### Vanderbilt

**Virginia Salo** (post-doc @ SEA Lab) You should know her.

**Peter Volgyesi** (Researcher @ ISIS Vanderbilt)

**Akos Ledeczi** (Researcher @ ISIS Vanderbilt)


## Flashing the Devices

Our good friend at Lab11 at UC Berkley [Pat](https://patpannuto.com/) has created a fantastic bit of documentation for exactly what we need to do to work on these devices. You can find flashing instructions at [`/doc/Provisioning.md`](https://github.com/lab11/totternary/blob/master/doc/Provisioning.md) on the Totternary Github. They have some fantastic photos and step-by-step instructions on how to flash the code to the nodes.

**Some notes from Conner:** We have these little "feet" things that look like a green table with three metallic legs. You can use these to keep the cables on the nodes. If you are having trouble making those stick, you can absolutely just hold it (or have a lab friend hold it) and it will flash just fine. Also, if you lose them (we've lost two), you can just hold them on. The terminal will tell you if you aren't making enough of a connection and you can adjust.

This next section is taken directly from the [Glossary.md](https://github.com/lab11/totternary/blob/master/doc/Glossary.md#Hardware-Glossary) on the GitHub but we missed it and it caused issues so. The pictured thing is the little box guy that connects the JLink to the TotTag cable. Make **sure** this is correct when flashing AND debugging (discussed later).

>Note: For TotTag the switch should always be in the unlabeled or down position (the top position says RST).

>Note: Pay attention to the power switch. If the tag is plugged into USB or attached to a battery, the switch should be in the DEV ("power from device") position. If the tag is only plugged into the programmer, it should be in the 3V3 ("3.3V from the programmer box") position.

![TagConnect Adapter Photo](images/adapter_jlink_tagconnect_annotated.svg)

## Debugging the devices

At the [bottom of the Provisioning doc](https://github.com/lab11/totternary/blob/master/doc/Provisioning.md#Debugging) it explains how to debug. The process is very simple but I will throw in some stuff that confused us at first.

1. This requires the use of TWO J-Link debuggers on ONE node. We have those now, so no issues. Make sure you take node of the serial number (S/N) on each debugger and which one is connected to the nRF and which one is connected to the STM
2. We only have one "foot" but two cables to connect. So I recommend typing in the long commands, connecting the STM with the food and then holding the other with your hand and operating your computer with one hand. Or you can do my patented upside-down technique that **I WILL POST A PICTURE OF HERE ASAP** if you can't find a foot.

PICTURE GOES HERE

3. There's a small typo in one of the commands:
```
JLinkExe -Device NRF52840_XXAA -if SWD -speed 4000 -RTTTelnetPort 9201-SelectEmuBySN XXXXXXXXX
```
should be
```
JLinkExe -Device NRF52840_XXAA -if SWD -speed 4000 -RTTTelnetPort 9201 -SelectEmuBySN XXXXXXXXX
```
Yeah it's just missing a space. But it will crash if you don't add it back in.

### Export Fix!

On the lab Mac computer that is running Linux, it runs into an error when you run the `telnet` command in the debugger steps. To get rid of that, first run:
```command
locate libstdc++
```
After that a big list of file paths should pop up. Find one ending in `libstdc++.so.6.0.22`. You can copy it by highlighting it and pressing `CTRL+SHIFT+C` or by pressing with two fingers on the trackpad.

Type the following command and then paste the filepath you found.
```command
export LD_PRELOAD=
```
If it hasn't changed (which it shouldn't have unless someone has removed ibeat) it should look like:
```command
export LD_PRELOAD=/usr/local/MATLAB/R2019b/sys/os/glnxa64/libstdc++.so.6.0.22
```