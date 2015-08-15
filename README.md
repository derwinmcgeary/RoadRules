# RoadRules
## Quick Overview
This is supposed to be a good Highway Code/UK Driving Theory Test app.  It uses material available under the [OGL](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
and at the moment is mostly going to make the Highway Code easily accessible on mobile devices.

## Contents
SignDownloader.R is an R script which parses https://www.gov.uk/traffic-sign-images , downloading an excel file describing the signs, plus the signs themselves as .eps files

downloader.sh reads urlslist.txt , which contains a list of urls pointing to bits of the highway code in numerical order and downloads those files into one big file - downloaded.html

newcode.html is an extremely-manually cleaned-up version of downloaded html where every section has an id, avery article has a number (which is the id)

tocgenerator.sh is a terrible script which generates a series of <a href="--------">-_______</a> by reading an html file and converting all of the section IDs to links

## issues
* The image links still point to the gov.uk website - we should have them locally
* almost a day of manual work from download.html to newcode.html - we must automate this better
* the links in toc.html are all internal <a href="#sdflkj"> ones
