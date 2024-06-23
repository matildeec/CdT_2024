<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" >
    <xsl:output method="html" encoding="UTF-8"/>

    <!-- html template -->
    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <script type="text/javascript" src="src/script.js"></script>
                <link rel="stylesheet" type="text/css" href="src/style.css"/>
                <title>Progetto di Codifica di Testi</title>
            </head>

            <body>
                <div class="header">
                    <h1><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>
                    <h2><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/></h2>
                </div>

            </body>
        </html>
    </xsl:template>
    <!---->

</xsl:stylesheet>