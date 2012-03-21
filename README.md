Homebrew-alt
============
This repository contains "unofficial" formulae for [Homebrew](https://github.com/mxcl/homebrew).

ATTN: the `duplicates` and `versions` directories have been moved to their own repositories:

 * [homebrew-dupes][]
 * [homebrew-versions][]

Installing Homebrew-alt Formulae
--------------------------------
Just `brew tap adamv/alt` and then `brew install <formula>`.

If the formula conflicts with one in mxcl/master, you can `brew install adamv/alt/<formula>`.

You can also install via URL:

```
brew install https://raw.github.com/adamv/homebrew-alt/master/<directory>/<formula>.rb
```

Categories
----------
  * **fonts**  

  * **head-only**  
  Formulae that provide only the latest development HEAD.

  * **mono**  

  * **non-free**  
  Formulae that provide non-free software.

  * **other**  
  Miscellaneous formulae that do not meet the criteria for acceptance into mxcl/master.

  * **unmaintained**  
  Formulae for abandoned and unmaintained software.

  * **avr**
  Formulae for AVR tools. AVR is a family of popular microcontrollers, used 
  for example in the Arduino open hardware project

Docs
----
`brew help`, `man brew`, or the Homebrew [wiki][].

[wiki]:http://wiki.github.com/mxcl/homebrew
[homebrew-dupes]:https://github.com/Homebrew/homebrew-dupes
[homebrew-versions]:https://github.com/Homebrew/homebrew-versions
