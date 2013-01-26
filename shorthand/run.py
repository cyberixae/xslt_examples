#!/usr/bin/python

from lxml import etree

xsltf = open('main.xsl')
xslt_tree = etree.parse(xsltf)

f = open('deep.xml')
tree = etree.parse(f)


transform = etree.XSLT(xslt_tree)

transformed = transform(tree)

output = etree.tostring(transformed)

print output
