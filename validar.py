from xml import etree
#cambiar xml por lxml
#instalar lxml https://lxml.de/installation.html

# xsd en un etree con objeto que valide
xsd = etree.parse('xml-schema_irving.xsd')
xmlschema = etree.XMLSchema(xsd)

# cargar el xml
xml = etree.parse('xml_irving.xml')

# validación
if xmlschema.validate(xml):
    print('el xml es valido')
else:
    print('el xml y el xsd no coinciden')
