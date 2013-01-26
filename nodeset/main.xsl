<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">

<!-- html library -->
<xsl:template name="html">
  <xsl:param name="title" />
  <xsl:param name="body" />
  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
  <html>
    <head>
      <title><xsl:copy-of select="$title" /></title>
    </head>
    <body>
      <xsl:copy-of select="$body" />
    </body>
  </html>
</xsl:template>

<!-- banana filter -->
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

<!-- htmlifier -->
<xsl:template mode="tohtml" match="/">
  <xsl:variable name="fruit_list">
    <ul>
      <xsl:apply-templates mode="tohtml" select="//fruit" />
    </ul>
  </xsl:variable>
  <xsl:call-template name="html">
    <xsl:with-param name="title">XSLT power!</xsl:with-param>
    <xsl:with-param name="body" select="$fruit_list"/>
  </xsl:call-template>
</xsl:template>
<xsl:template mode="tohtml" match="fruit">
  <li><xsl:value-of select="@type" /></li><xsl:text>
</xsl:text>
</xsl:template>
<xsl:variable name="xhtml">
  <xsl:apply-templates mode="tohtml" select="$filtered" />
</xsl:variable>

<!-- main -->
<xsl:variable name="input" select="/" />
<xsl:template match="/">
  <xsl:copy-of select="$xhtml" />
</xsl:template>

</xsl:stylesheet>
