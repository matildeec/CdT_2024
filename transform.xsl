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
                <link href="https://fonts.googleapis.com/css2?family=Newsreadero" rel="stylesheet" />
                <link rel="stylesheet" type="text/css" href="src/style.css"/>
                <title>Progetto di Codifica di Testi</title>
            </head>

            <body>
                <div class="header">
                    <h1><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>
                    <h3><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:sponsor"/></h3>
                </div>

                <div class="container">
                    <div class="containerTabelle">
                        <div class="containerTabella">
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc"/>

                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc"/>
                        </div>
                    </div>
                </div>

                <!-- Bibliografia -->
                <div>

                </div>

            </body>

            <footer>
                <p><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/></p>
                <p>Repository <a target="_blank" href="https://github.com/matildeec/CdT_2024">GitHub</a></p>
            </footer>
        </html>
    </xsl:template>
    
    <!-- Templates -->

    <!-- fileDesc -->
    <xsl:template match="tei:fileDesc">
        <h3>Descrizione bibliografica</h3>
        <table>
            <tr></tr>
            <tr>
                <td><span><strong>Pubblicazione</strong></span></td>
                <td>
                    <xsl:apply-templates select="tei:publicationStmt"/>
                </td>
            </tr>
            <tr>
                <td><span><strong>Serie</strong></span></td>
                <td>
                    <xsl:apply-templates select="tei:seriesStmt"/>
                </td>
            </tr>
            <tr>
                <td><span><strong>Note</strong></span></td>
                <td>
                    <xsl:apply-templates select="tei:notesStmt"/>
                </td>
            </tr>
            <tr>
                <td><span><strong>Fonte</strong></span></td>
                <td>
                    <xsl:apply-templates select="tei:sourceDesc"/>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:publicationStmt">
        <table>
            <tr>
                <td><strong>Editore</strong></td>
                <td><xsl:value-of select="tei:publisher"/></td>
            </tr>
            <tr>
                <td><strong>Luogo, data</strong></td>
                <td><xsl:value-of select="tei:pubPlace"/>, <xsl:value-of select="tei:date"/>
            </td>
            </tr>
            <tr>
                <td><strong>Risorsa</strong></td>
                <td>
                    <xsl:value-of select="tei:availability/tei:p"/>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="tei:availability/tei:ref/@target"/>
                        </xsl:attribute>
                        <xsl:value-of select="tei:availability/tei:ref"/>
                    </a>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:seriesStmt">
        <table>
            <tr>
                <td><strong>Serie</strong></td>
                <td><xsl:value-of select="tei:title"/></td>
            </tr>
            <tr>
                <td><strong>Supervisore</strong></td>
                <td><xsl:value-of select="tei:respStmt"/></td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:notesStmt">
        <table>
            <tr>
                <td><xsl:value-of select="tei:note[1]"/></td>
            </tr>
            <tr>
                <td><xsl:value-of select="tei:note[2]"/>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="tei:ref/@target"/>
                    </xsl:attribute>
                    <xsl:value-of select="tei:ref"/>
                </a>
            </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:sourceDesc">
        <table>
            <tr>
                <td><strong>Titolo</strong></td>
                <td><xsl:value-of select="tei:biblStruct/tei:monogr/tei:title"/></td>
            </tr>
            <tr>
                <td><strong><xsl:value-of select="tei:biblStruct/tei:monogr/tei:respStmt/tei:resp"/></strong></td>
                <td><xsl:value-of select="tei:biblStruct/tei:monogr/tei:respStmt/tei:name[1]"/>, <xsl:value-of select="tei:biblStruct/tei:monogr/tei:respStmt/tei:name[2]"/></td>
            </tr>
            <tr>
                <td><strong>Editore</strong></td>
                <td><xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:publisher"/></td>
            </tr>
            <tr>
                <td><strong>Lingua</strong></td>
                <td><xsl:value-of select="tei:biblStruct/tei:monogr/tei:textLang"/></td>
            </tr>
            <tr>
                <td><strong>Luogo, data</strong></td>
                <td><xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:pubPlace"/>, <xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:date"/></td>
            </tr>
            <tr>
                <td><strong>Volume, fascicolo</strong></td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:biblScope[1]"/>, <xsl:value-of select="tei:biblStruct/tei:monogr/tei:biblScope[2]"/>
                </td>
            </tr>
            <tr>
                <td><strong>Pagine</strong></td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:biblScope[3]"/>
                </td>
            </tr>
            <tr>
                <td><strong>Sezioni codificate</strong></td>
                <td>
                    <xsl:for-each select="tei:biblStruct/tei:analytic">
                        <xsl:value-of select="tei:title"/>
                        <xsl:if test="count(tei:author)>0">,
                            <span><xsl:value-of select="tei:author/tei:persName"/></span>
                        </xsl:if><br/>
                    </xsl:for-each>
                </td>
            </tr>
        </table>
    </xsl:template>

    <!-- encodingDesc -->
    <xsl:template match="tei:encodingDesc">
    <h3>Descrizione della codifica</h3>
    <table>
        <tr></tr>
        <tr>
            <td><span><strong>Correzioni</strong></span></td>
            <td>
                <xsl:value-of select="tei:editorialDecl/tei:correction"/>
            </td>
        </tr>
        <tr>
            <td><span><strong>Normalizzazioni</strong></span></td>
            <td>
                <xsl:value-of select="tei:editorialDecl/tei:normalization"/>
            </td>
        </tr>
        <tr>
            <td><span><strong>Lineette d'unione</strong></span></td>
            <td>
                <xsl:value-of select="tei:editorialDecl/tei:hyphenation"/>
            </td>
        </tr>
    </table>
    </xsl:template>

</xsl:stylesheet>