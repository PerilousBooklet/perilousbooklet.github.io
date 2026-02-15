---
title: Arch Linux is Great
date: 10/03/2025
---

## Introduction

I've been running Arch Linux on my desktop, laptop and servers for a little over 2 years now (since December 2022) and, 
looking back, it's been the smoothest Linux experience so far.

In the following paragraphs I'm going to explain why Arch Linux is great.

To start off, let me give you a bit of context.

I started my Linux journey back in September 2019 with Fedora 29.

It happened one day when I decided to change the Windows 10 UI on my laptop.
I quickly realized it wasn't feasible and, by chance, found a certain something called GNOME.

At the time, it felt novel and modern, so I tried it by downloading Fedora and running it off the usual USB stick.

My experience with Fedora was fairly smooth until I had to deal with Nvidia drivers; for someone that just started using a 
Linux distro, it's not obvious to know where to find documentation about drivers and the various kernels, and this is one of 
the reasons why Fedora didn't work out for me: it didn't have a comprehensive user documentation website.

Also, I kept having strange problems while using it, like sudden crashes and unbootable states (probably related to buggy 
GNOME extensions and nvidia driver updates, but we'll never know for sure), so I had a strong incentive to try something else.

And that's when I found Manjaro.
Manjaro is a derivative of Arch Linux that maintains its own repositories, but still uses the AUR under the hood of its own 
GUI package manager. It promised the package availability of Arch while being more stable (it keeps all updates back for 
two weeks, while still using the AUR) and a more user-friendly approach.

I then installed the Plasma edition, which has a nice UI that is very similar to Windows 10, and for a few months it seemed 
like everything was going fine. At some point however, I had that same problem of the system suddenly becoming unbootable.
Even now, I'm not sure what the causes were.

At the time I still didn't have the linux troubleshooting skills to quickly start probing and searching for answers, and 
I was more concerned with doing other things (I still wasn't developing software daily), so my main fallback option was 
a full reinstall of the system (I know, skill issue).

So, at that point the situation had become unsustainable; I couldn't just reinstall every time I had a problem like that, 
so I decided to actually learn the basics of a Linux system, to make sure I could fix most problems myself.
And that's where Arch Linux comes in.

Arch Linux is a DIY, minimal distribution with a pragmatic and user-centric approach.
This means that if the user knows what they're doing, Arch gets out of the way and allows a vast amount of customization
(with the exception of the init system and a few others, almost anything can be replaced or reconfigured).

That, along with the best documentation wiki of all and the best package manager, lay the basics for an excellent developer 
experience.

## What Makes Arch Linux Great

So, what is it that makes Arch Linux great?

It's a combination of several factors:

- DIY: wether you use the manual install process or not, Arch can be customized almost completely, from the display 
  server and the user interface to all kinds of automated scripts and programs.
  This is ideal when custom workflows are required.
- KISS: the first principle of the [Arch philosophy](https://wiki.archlinux.org/title/Arch_Linux#Principles) is simplicity.
  Arch itself is designed to be as simple as possible: from the package manager usage and configuration to the 
  [website](https://archlinux.org/) and [documentation](https://wiki.archlinux.org/title/Main_page), 
  the developers chose a minimal, intuitive and clear design that emphasizes readability and consistency.
- Pacman: [Arch's package manager](https://wiki.archlinux.org/title/Pacman) is the focus of 
  the system's greatness. Adding, removing, [querying packages](https://archlinux.org/packages/) and 
  managing custom repositories is a breeze thanks to its concise syntax and easily readable configuration files.
  There's just one thing to be careful of when managing packages on Arch Linux: the official way of updating packages 
  (which guarantees the intended level of stability) requires that all packages be updated at once, and every time you want 
  to install a new package you also update all other packages.
- Rolling Release: Arch Linux is a rolling release distribution. 
  This is one of the most important reasons for its greatness: the system's update management must be done incrementally, 
  ideally every week, so there are never huge lists of conflicts and incompatibilites to solve every time there's an update, 
  even with hundreds of packages installed at the same time (speaking from experience).
- Arch Build System: another great feature of Arch is its package build system.
  ABS (Arch Build System) is a collection of tools for compiling source code into compressed archived packages. 
  These packages are defined each by a single, simple text file (here's the 
  [PKGBUILD for Lite XL](https://gitlab.archlinux.org/archlinux/packaging/packages/lite-xl/-/blob/main/PKGBUILD?ref_type=heads) 
  as an example). 
  The example provided above is relatively simple, but a PKGBUILD can do much more than just fetch source code and run 
  build commands: from [applying patches](https://wiki.archlinux.org/title/Patching_packages) to 
  running update scripts, whatever your use case is, most likely ABS has got you covered.
- Arch Wiki: built on top of the popular [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki), 
  Arch's documentation website has been regarded as the best linux documentation for years; 
  even users from other distributions use it!
  Its strong points are the great number of maintainers, the clear and quick interface (it's the same one that Wikipedia uses) and 
  the reputation of reliability it has built over the years.
- Community: the Arch community is vast and rich.
  Whenever the ArchWiki isn't enough to solve a problem, the Arch Forums can be a vast source of past questions and answers.
  Just remember to do all the research you can before asking for help, as the people who answer on the forums dedicate their 
  free time to do it.
- Professional Work Culture: in the recent wake of many open source projects involving themselves with unrelated politics, 
  the Arch Linux team still believes that a technical project should remain focused on creating and maintaining a great product.

## The AUR

The [Arch User Repository](https://aur.archlinux.org/) is a community-driven repository of user-produced content, where 
anyone can upload a package (as long as it's not for personal use only) or assume responsibility for maintaining one that 
was abandoned.</p>
Whenever a package is not available in the official Arch repositories, it's very likely that you can find it in the AUR.

And even if it's not available in the AUR, creating it is trivial: you just need to follow the 
[official guidelines](https://wiki.archlinux.org/title/Creating_packages), which basically consist of writing a simple 
text file for describing the package contents and then running a simple command to package the software and install it..

The combination of the Arch Build System and the Arch User Repository creates the best package management experience among 
all current linux distributions.

## Conclusion

Arch Linux is the best general-purpose GNU/Linux distribution, thanks to its design features centered around simplicity and 
user-centric approach.

If you are a developer who longs for a reliable and long-lasting operating system that just gets out of the way and allows 
you to do the things that you want to do, I encourage you to give [Arch Linux](https://archlinux.org/download/) a try.
