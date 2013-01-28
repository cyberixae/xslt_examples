<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">

<xsl:output omit-xml-declaration="yes" method="xml" />

<xsl:template match="/html/head/link[@rel='stylesheet' and @type='text/css' and @href]">
  <xsl:variable name="cssfile" select="@href" />
  <xsl:variable name="xmlfile"><xsl:value-of select="$cssfile" />.xml</xsl:variable>
  <style>
    <xsl:value-of select="document($xmlfile)" disable-output-escaping="yes" />
  </style>
</xsl:template>

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>
