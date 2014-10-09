Master's Thesis Style
=====================

This repository contains a LaTeX template for master theses. It is specifically written for master students graduating at the [TU Delft SERG](http://swerl.tudelft.nl/bin/view/Main/WebHome) department.

To get an impression of the style, view the [example PDF](https://github.com/erikvdv1/msc-thesis-style/releases/download/v1.0/msc-thesis-style-v1.0.pdf).

The LaTeX style is based on the style written by [Leon Moonen](http://swerl.tudelft.nl/bin/view/Main/LeonMoonen), which is originally found at the [SERG website](http://swerl.tudelft.nl/bin/view/Main/MasterThesisStyle).

> The use of a uniform layout helps you in formatting and structuring your thesis, and in creating proper bibliographic references through Bibtex. Furthermore, it helps us to quickly see where results can be found, and in comparing the theses from our group.

Improvements
------------

* Use built-in memoir style, instead of a custom one
* TU Delft logo replaced by a colorized version
* Clickable table of contents
* Better URL linking support
* Compilation to HTML for easy spell/grammar checking by 3-party tool
* A basis todo command

Compilation
-----------

* Run `make` to build the PDF document
* Run `make html` to build the HTML version of the document
* Run `make clean` to delete all temporary and intermediate files
