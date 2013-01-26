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



<xsl:template match="/">
  <xsl:apply-templates select="$filtered//fruit" />
</xsl:template>

<xsl:template match="fruit">
  <xsl:value-of select="@type" /><xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>
