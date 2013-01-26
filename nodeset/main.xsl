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
<xsl:template name="filter">
  <xsl:param name="input" />
  <xsl:apply-templates mode="filter" select="$input" />
</xsl:template>

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
<xsl:template name="tohtml">
  <xsl:param name="input" />
  <xsl:apply-templates mode="tohtml" select="$input" />
</xsl:template>

<!-- main -->
<xsl:output omit-xml-declaration="yes" />
<xsl:template match="/">
  <xsl:variable name="filtered">
    <xsl:call-template name="filter">
      <xsl:with-param name="input" select="/" />
    </xsl:call-template>
  </xsl:variable>
  <xsl:call-template name="tohtml">
    <xsl:with-param name="input" select="exsl:node-set($filtered)" />
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
