#!/usr/bin/python


from lxml import etree

xsltf = open('main.xsl')
xslt_tree = etree.parse(xsltf)

f = open('fruits.xml')
tree = etree.parse(f)


transform = etree.XSLT(xslt_tree)

print transform(tree)
