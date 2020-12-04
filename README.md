# Output Data - level 1

This repository contains digitised manuscripts sale catalogs encoded in XML-TEI at level 1.

The data have not been cleaned ([level 2](https://github.com/katabase/2_CleanedData)) or post-processed ([level 3](https://github.com/katabase/3_TaggedData)).

## Description of the data

Basic bibliographic information for each catalogue are available [here](https://github.com/katabase/1_OutputData/blob/master/_listDATA.csv).

## Workflow

### Creation of the data

The creation process is described in detail in the following [repo](https://github.com/katabase/GROBID_Dictionaries/blob/master/DOCUMENTATION.md).

### Cleaning the data

Entries of catalogues look like the following:

```xml
<item n="80" xml:id="CAT_000146_e80">
   <num>80</num>
   <name type="author">Cherubini (L.),</name>
   <trait>
      <p>l'illustre compositeur</p>
   </trait>
   <desc>L. a s.; 1836, 1 p 1 /2 in8.</desc>
    <measure commodity="currency" unit="FRF" quantity="12">12</measure>
</item>
```

Most of the reconciliation process uses data from the `<desc>` element of our xml files. We therefore need to correct typos to ease further post-processing, _e.g._
  * `L. a s.` -> `L. a. s.`
  * `in8` -> `in-8`
  * `1 /2` -> `1/2`
  * `1 p ` -> `1 p. `

The `clean-xml.py` script [available here](https://github.com/katabase/1_OutputData/blob/master/script/clean_xml.py) tackles this problem.


## Installation and use

```bash
* git clone https://github.com/katabase/1_OutputData.git
* cd 1_OutputData
* python3 -m venv my_env
* source my_env/bin/activate
* pip install -r requirements.txt
* `python clean-xml.py -f FILENAME` processes one single file
	OR
* `python clean-xml.py -d DIRECTORY` processes all the files contained in a directory
```

## Credits

Expliquer qui a fait quoi.

## Cite this repository
Alexandre Bartz, Simon Gabay, Matthias Gille Levenson, Ljudmila Petkovic and Lucie Rondeau du Noyer, _Manuscript sale catalogues_, Neuchâtel: Université de Neuchâtel, 2019, [https://github.com/katabase/1_OutputData](https://github.com/katabase/1_OutputData).

## Licence
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Licence Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International Licence</a>.
