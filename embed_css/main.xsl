<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">

<xsl:output omit-xml-declaration="yes" />

<xsl:template match="/html/head/link[@rel='stylesheet' and @type='text/css' and @href]">
  <xsl:variable name="cssfile" select="@href" />
  <xsl:variable name="xmlfile"><xsl:value-of select="$cssfile" />.xml</xsl:variable>

  <!-- the problem here is that we can not read the css
       file directly as it is not xml. Adding the css
       content to an xml file with an xinclude does not
       work, as the xinclude does not get expanded when
       the xslt reads it with document() -->
  <xsl:variable name="cssdata" select="document($xmlfile)" />
  <xsl:copy-of select="$cssdata" />
</xsl:template>

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>
