<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">

<!-- this does not work -->
<!--
<xsl:variable name="selected" select="/deep/q/w/e/r/t/y/selected/@lang" />
<xsl:template match="/deep/p[@lang!=$selected]" />
-->

<!-- you need to do this -->
<xsl:template match="/deep/p[@lang!=/deep/q/w/e/r/t/y/selected/@lang]" />

</xsl:stylesheet>
