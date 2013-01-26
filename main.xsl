<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">

<xsl:variable name="input" select="/" />

<xsl:template mode="filter" match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates mode="filter" select="@*|node()"/>
    </xsl:copy>
</xsl:template>
<xsl:template mode="filter" match="node()[@type='banana']" />
<xsl:variable name="xfiltered">
  <xsl:apply-templates mode="filter" select="$input" />
</xsl:variable>
<xsl:variable name="filtered" select="exsl:node-set($xfiltered)" />

<xsl:template mode="tohtml" match="/">
  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
  <html><head><title>XSLT power!</title></head><body>
  <ul>
    <xsl:apply-templates mode="tohtml" select="//fruit" />
  </ul>
  </body></html>
</xsl:template>
<xsl:template mode="tohtml" match="fruit">
  <li><xsl:value-of select="@type" /></li><xsl:text>
</xsl:text>
</xsl:template>
<xsl:variable name="xhtml">
  <xsl:apply-templates mode="tohtml" select="$filtered" />
</xsl:variable>

<xsl:template match="/">
  <xsl:copy-of select="$xhtml" />
</xsl:template>


</xsl:stylesheet>
