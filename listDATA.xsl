<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:variable name="xmlDocuments" select="collection('?select=?*.xml')"/>
    
    <xsl:template match="/">
        <xsl:text>File</xsl:text>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>Id</xsl:text>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>Catalogue number</xsl:text>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>Date of publication</xsl:text>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>Number of entries</xsl:text>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>Number of desc</xsl:text>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>Collaborator</xsl:text>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>Title of the catalogue</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="$xmlDocuments">
            <xsl:value-of select="base-uri()"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="//TEI/@xml:id"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="//sourceDesc/bibl/num"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="//sourceDesc/bibl/date/@when"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(//item)"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(//desc)"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="//titleStmt/respStmt[1]/persName[1]"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="//sourceDesc/bibl/title"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>