# CAT

Digitised manuscripts sale catalogs.

Basic bibliographic information for each catalogue are available [here](https://github.com/e-ditiones/CAT/blob/master/_listCAT.tsv).

## Workflow

From scanned catalogs to the final XML-TEI documents ulpoaded in this folder, several transformations are applied on the electronic file:

### 1. Preparing PDF

Using the tool **cpdf** (for “Coherent PDF Command Line Tools”, more information available [here](https://community.coherentpdf.com/), a **new PDF** is created, containing **only the pages that record manuscripts entries**. This extraction aimed at improving the quality of output in the subsequent steps. Indeed, OCR and HTR models do not fully perform on very ornate pages, such as catalogs covers. Furthermore, [GROBID dictionaries](https://github.com/MedKhem/grobid-dictionaries) is a software meant to deal only with encyclopedic-like data and not with articles or advertising.

After downloading and building cpdf on one’s computer (the steps to follow are [there](https://github.com/johnwhitington/cpdf-source)) and reaching the relevant folder in the terminal, the command line to extract some pages from a PDF is **cpdf PDF.pdf X-Y -o  selection.pdf** where X is the first page of the catalog with encyclopedic-like entries and Y the last one.

### 2. OCRising and HTRising catalogs

This trimmed PDF is imported in [**Transkribus**](https://transkribus.eu/Transkribus/) and processed in two steps. An **OCR model** is firstly applied to **recognize the layout** of the document. A **HTR model** specifically trained on manuscript catalogs such as the _Revue des autographes_ is then applied to **enhance the quality and the accuracy of the output**. A file that contains the PDF and the text is finally **exported from Transkribus**.

An alternative model to OCRise catalogs with **Kraken** is available [here](https://github.com/e-ditiones/OCRcat).

### 3. Structuring and encoding catalog entries

This exported PDF is processed by **[GROBID dictionaries](https://github.com/MedKhem/grobid-dictionaries)**, a software designed to automatically structure lexicographical resources, **after the software has been trained with a relevant train set**, as explained [here](https://github.com/e-ditiones/GROBID/blob/master/README.md). The XML-TEI output is then downloaded from GROBID dictionaries API.

To produce a TEI-P5 compliant document and a complete TEI header, **this output is transformed with the stylesheet grobid_output_transformation.xsl**. The TEI header needs to be completed by hand. Encoding choices are detailed in the documentation odd_editiones.xml and odd_editiones.html available [here](https://github.com/e-ditiones/_rules).

The next step is to **associate the document with the schema schema_grobid_output.rng** available [here](https://github.com/e-ditiones/_rules). If using Oxygen XML editor, it is important to **tick the box "Add additional associations for embedded schematron rules"**. These schematron rules ensure that each entry is well structured (with at least a number, an author name and an autograph description) and that the entries numbers follow each other. It enables to spot and correct inaccuracies in the final document structure.

After the global structure of the document has been checked and corrected, the XML-TEI document is transformed thanks to a **second XSLT stylesheet named catalog_final_transformation.xsl**. Every item is especially given a single xml:id and can therefore be linked with a relevant manuscript description. Finally, the document is **associated with the global schema** of E-ditiones **named odd_editiones.rng** available [here](https://github.com/e-ditiones/_rules).

## Cite this repository
Lucie Rondeau du Noyer and Simon Gabay (éd.), _Manuscript sale catalogues_, Neuchâtel: Université de Neuchâtel, 2019, [https://github.com/e-ditiones/CAT](https://github.com/e-ditiones/CAT).

## Licence
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Licence Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International Licence</a>.
