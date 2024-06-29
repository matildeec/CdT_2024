<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" />

    <!-- html template -->
    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="stylesheet" type="text/css" href="src/style.css" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script type="text/javascript" src="src/script.js"></script>
                <title>Progetto di Codifica di Testi</title>
            </head>

            <body>
                <div class="header">
                    <img
                        src="https://rassegnasettimanale.animi.it/wp-content/uploads/2019/03/logo_rassegna_new.jpg"
                        alt="La Rassegna Settimanale Logo" />
                </div>
                
                <div class="heading">
                    <h1>
                        <xsl:value-of
                            select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
                    </h1>
                    <span>
                        <img src="https://upload.wikimedia.org/wikipedia/it/e/e2/Stemma_unipi.svg"
                            alt="Logo Università di Pisa" style="width:80px" />
                    </span>
                    <h3>
                        <xsl:value-of
                            select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:sponsor" />
                    </h3>
                </div>
    
                <div class="container">
                    <p style="color: black;">Informazioni sul Progetto</p>

                    <div class="btns-container">
                        <button class="desc" id="btn-descBibl">Descrizione bibliografica</button>
                        <button class="desc" id="btn-descCod">Descrizione della codifica</button>
                    </div>
                </div>

                <div class="container" id="descBibl">
                    <div class="bgTabella">
                        <div class="containerTabella">
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc" />
                        </div>
                    </div>
                </div>

                <div class="container" id="descCod">
                    <div class="bgTabella">
                        <div class="containerTabella">
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc" />
                        </div>
                    </div>
                </div>

                <div class="container"><h3>Evidenzia</h3></div>

                <div class="menu">

                    <!-- Bottoni -->
                    <div class="btns-highlight">
                        <button class="highlight yellow" id="person">Persone</button>
                        <button class="highlight rose" id="character">Personaggi</button>
                        <button class="highlight mint" id="bibl">Opere</button>
                        <button class="highlight powder" id="place">Luoghi</button>
                        <button class="highlight purple" id="publisher">Casa editrice</button>
                        <button class="highlight coral" id="date">Date</button>
                        <button class="highlight crimson" id="verbum">Verbum</button>
                        <button class="highlight orange" id="literary">Correnti letterarie</button>
                        <button class="highlight lilac" id="foreign">Lingua straniera</button>
                        <button class="highlight jade" id="cit">Citazioni</button>
                        <button class="highlight blue" id="org">Organizzazioni</button>
                        <button class="highlight applegreen" id="religion">Religioni</button>
                    </div>

                    <div class="btns-show" style="width:600px;">
                        <button class="show lemon" id="expan">Espansioni</button>
                        <button class="show marine" id="reg">Regolarizzazioni</button>
                        <button class="show vanilla" id="ex">Aggiunte</button>
                        <button class="show sand" id="corr">Correzioni</button>
                    </div>
                </div>

                <!-- Testo -->

                <div class="container">

                    <div class="containerSection">
                        <!-- Itera su ogni sezione -->
                        <xsl:for-each
                            select="tei:TEI/tei:text/tei:body/tei:div[@type='journal']/tei:div">
                            <!-- Estrai e visualizza il titolo della sezione -->
                            <div
                                class="section">
                                <h2>
                                    <xsl:value-of
                                        select="tei:head" />
                                </h2>

                                <xsl:for-each select="tei:pb">
                                    <xsl:variable name="page_id">
                                        <xsl:value-of select="@xml:id" />
                                    </xsl:variable>

                                    <div class="page">
                                        <div class="facsimile">
                                            <xsl:apply-templates select="." />
                                        </div>

                                        <table class="columns">
                                            <tbody>
                                                <tr>
                                                    <th>Colonna 1</th>
                                                    <th>Colonna 2</th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="column left">
                                                            <xsl:for-each select="following-sibling::tei:cb[@corresp=concat('#',$page_id) and @n=1]">
                                                                <xsl:variable name="col_id">
                                                                    <xsl:value-of select="@xml:id" />
                                                                </xsl:variable>
                                                                <xsl:for-each select="following-sibling::tei:ab[@corresp=concat('#',$col_id)] | following-sibling::tei:head[@corresp=concat('#',$col_id)] | following-sibling::tei:closer[@corresp=concat('#',$col_id)] | following-sibling::tei:div[@corresp=concat('#',$col_id)]/tei:ab | following-sibling::tei:div[@corresp=concat('#',$col_id)]/tei:head">
                                                                    <xsl:apply-templates select="." />
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="column right">
                                                            <xsl:for-each select="following-sibling::tei:cb[@corresp=concat('#',$page_id) and @n=2]">
                                                                <xsl:variable name="col_id">
                                                                    <xsl:value-of select="@xml:id" />
                                                                </xsl:variable>
                                                                <xsl:for-each select="following-sibling::tei:ab[@corresp=concat('#',$col_id)] | following-sibling::tei:head[@corresp=concat('#',$col_id)] | following-sibling::tei:div[@corresp=concat('#',$col_id)]/tei:ab | following-sibling::tei:div[@corresp=concat('#',$col_id)]/tei:head | following-sibling::tei:div[@corresp=concat('#',$col_id)]/tei:list">
                                                                    <xsl:apply-templates select="." />
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </xsl:for-each>
                            </div>
                        </xsl:for-each>
                    </div>

                </div>

            </body>

            <footer>
                <p>
                    <span>
                        <xsl:value-of
                        select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp" />&#160;
                    </span>
                    <span><xsl:value-of
                        select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name[1]" /></span>&#160;e&#160; 
                        <span><xsl:value-of
                            select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name[2]" /></span>
                </p>
                <p>Repository <a target="_blank" href="https://github.com/matildeec/CdT_2024" style="color:var(--lemon);">GitHub</a></p>
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
                <td>
                    <h3>Pubblicazione</h3>
                </td>
                <td>
                    <xsl:apply-templates select="tei:publicationStmt" />
                </td>
            </tr>
            <tr>
                <td>
                    <h3>Serie</h3>
                </td>
                <td>
                    <xsl:apply-templates select="tei:seriesStmt" />
                </td>
            </tr>
            <tr>
                <td>
                    <h3>Note</h3>
                </td>
                <td>
                    <xsl:apply-templates select="tei:notesStmt" />
                </td>
            </tr>
            <tr>
                <td>
                    <h3>Fonte</h3>
                </td>
                <td>
                    <xsl:apply-templates select="tei:sourceDesc" />
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:publicationStmt">
        <table>
            <tr>
                <td>
                    <strong>Editore</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:publisher" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Luogo, data</strong>
                </td>
                <td><xsl:value-of select="tei:pubPlace" />, <xsl:value-of select="tei:date" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Risorsa</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:availability/tei:p" />
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="tei:availability/tei:ref/@target" />
                        </xsl:attribute>
                        <xsl:value-of select="tei:availability/tei:ref" />
                    </a>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:seriesStmt">
        <table>
            <tr>
                <td>
                    <strong>Serie</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:title" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Coordinatore</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:respStmt" />
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:notesStmt">
        <table>
            <tr>
                <td>
                    <xsl:value-of select="tei:note[1]" />
                </td>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="tei:note[2]" />
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="tei:ref/@target" />
                        </xsl:attribute>
                        <xsl:value-of select="tei:ref" />
                    </a>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="tei:sourceDesc">
        <table>
            <tr>
                <td>
                    <strong>Titolo</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:title" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>
                        <xsl:value-of select="tei:biblStruct/tei:monogr/tei:respStmt/tei:resp" />
                    </strong>
                </td>
                <td><xsl:value-of select="tei:biblStruct/tei:monogr/tei:respStmt/tei:name[1]" />, <xsl:value-of
                        select="tei:biblStruct/tei:monogr/tei:respStmt/tei:name[2]" /></td>
            </tr>
            <tr>
                <td>
                    <strong>Editore</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:publisher" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Lingua</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:textLang" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Luogo, data</strong>
                </td>
                <td><xsl:value-of select="tei:biblStruct/tei:monogr/tei:imprint/tei:pubPlace" />, <xsl:value-of
                        select="tei:biblStruct/tei:monogr/tei:imprint/tei:date" /></td>
            </tr>
            <tr>
                <td>
                    <strong>Volume, fascicolo</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:biblScope[1]" />, <xsl:value-of
                        select="tei:biblStruct/tei:monogr/tei:biblScope[2]" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Pagine</strong>
                </td>
                <td>
                    <xsl:value-of select="tei:biblStruct/tei:monogr/tei:biblScope[3]" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Sezioni codificate</strong>
                </td>
                <td>
                    <xsl:for-each select="tei:biblStruct/tei:analytic">
                        <xsl:value-of select="tei:title" />
                        <xsl:if test="count(tei:author)>0">, <span>
                                <xsl:value-of select="tei:author/tei:persName" />
                            </span>
                        </xsl:if><br />
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
                <td>
                    <span>
                        <strong>Correzioni</strong>
                    </span>
                </td>
                <td>
                    <xsl:value-of select="tei:editorialDecl/tei:correction" />
                </td>
            </tr>
            <tr>
                <td>
                    <span>
                        <strong>Normalizzazioni</strong>
                    </span>
                </td>
                <td>
                    <xsl:value-of select="tei:editorialDecl/tei:normalization" />
                </td>
            </tr>
            <tr>
                <td>
                    <span>
                        <strong>Lineette d'unione</strong>
                    </span>
                </td>
                <td>
                    <xsl:value-of select="tei:editorialDecl/tei:hyphenation" />
                </td>
            </tr>
        </table>
    </xsl:template>

    <!-- surface -->
    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
            <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:attribute name="alt">Immagine <xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:attribute name="class">facsimile</xsl:attribute>
        </xsl:element>

        <xsl:element name="map">
            <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:for-each select="tei:zone">
                <xsl:element name="area">
                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                    <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <!-- pb -->
    <xsl:template match="tei:pb">
        <xsl:variable name="pb_id" select="substring-after(@facs, '#')" />
        <xsl:apply-templates select="//tei:facsimile/tei:surface[@xml:id = $pb_id]" />
    </xsl:template>

    <!-- head -->
    <xsl:template match="tei:head">
        <div class="paragraph">
            <xsl:element name="span">
                <xsl:attribute name="id">
                    <xsl:value-of select="substring-after(@facs, '#')"/>
                </xsl:attribute>
                <strong><xsl:value-of select="substring-after(@facs, '#')"/></strong>
            </xsl:element>
            <div class="block">
                <xsl:apply-templates />
            </div>
        </div>
    </xsl:template>

    <!-- closer -->
    <xsl:template match="tei:closer">
        <div class="paragraph">
            <xsl:element name="span">
                <xsl:attribute name="id">
                    <xsl:value-of select="substring-after(@facs, '#')"/>
                </xsl:attribute>
                <strong><xsl:value-of select="substring-after(@facs, '#')"/></strong>
            </xsl:element>
            <div class="block">
                <xsl:apply-templates />
            </div>
        </div>
    </xsl:template>

    <!-- ab -->
    <xsl:template match="tei:ab">
        <div class="paragraph">
            <xsl:element name="span">
                <xsl:attribute name="id">
                    <xsl:value-of select="substring-after(@facs, '#')"/>
                </xsl:attribute>
                <strong><xsl:value-of select="substring-after(@facs, '#')"/></strong>
            </xsl:element>
            <div class="block">
                <xsl:apply-templates />
            </div>
        </div>
    </xsl:template>

    <!-- list -->
    <xsl:template match="tei:list">
        <div class="paragraph">
            <div class="block">
                <xsl:apply-templates />
            </div>
        </div>
    </xsl:template>

    <!-- list item -->
    <xsl:template match="tei:item">
        <div class="paragraph">
            <xsl:element name="span">
                <xsl:attribute name="id">
                    <xsl:value-of select="substring-after(@facs, '#')"/>
                </xsl:attribute>
                <strong><xsl:value-of select="substring-after(@facs, '#')"/></strong>
            </xsl:element>
            <div class="block">
                <xsl:apply-templates />
            </div>
        </div>
    </xsl:template>

    <!-- lb -->
    <xsl:template match="tei:lb">
        <div class="line">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <!-- Persone reali-->
    <xsl:template match="tei:name[@type='person']">
        <xsl:variable name="person_ref" select="substring-after(@ref, '#')" />
        <xsl:element name="span">
            <xsl:attribute name="class">person</xsl:attribute>
            <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listPerson/tei:person[@xml:id=$person_ref]/tei:persName/tei:ref/@target"/></xsl:attribute>
                        <xsl:apply-templates />
            </xsl:element>
        </xsl:element>
        <xsl:for-each select="/tei:TEI/tei:text/tei:back/tei:div/tei:listPerson/tei:person">
            <xsl:if test="@xml:id=$person_ref">
                <span class="info">
                    <strong>Nome: </strong><xsl:value-of select="./tei:persName"/><br/>
                    <strong>Nascita: </strong><xsl:value-of select="./tei:birth"/><br/>
                    <strong>Morte: </strong><xsl:value-of select="./tei:death"/><br/>
                    <strong>Professione: </strong><xsl:value-of select="./tei:occupation"/><br/>
                </span>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <!-- Personaggi -->
    <xsl:template match="tei:name[@type='character']">
        <xsl:variable name="char_ref" select="substring-after(@ref, '#')" />
        <xsl:element name="span">
            <xsl:attribute name="class">character</xsl:attribute>
            <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listPerson/tei:person[@xml:id=$char_ref]/tei:persName/tei:ref/@target"/></xsl:attribute>
                        <xsl:apply-templates />
            </xsl:element>
        </xsl:element>
        <xsl:for-each select="/tei:TEI/tei:text/tei:back/tei:div/tei:listPerson/tei:person">
            <xsl:if test="@xml:id=$char_ref">
                <span class="info">
                    <strong>Nome: </strong><xsl:value-of select="./tei:persName"/><br/>
                    <strong>Nascita: </strong><xsl:value-of select="./tei:birth"/><br/>
                    <strong>Morte: </strong><xsl:value-of select="./tei:death"/><br/>
                    <strong>Natura: </strong><xsl:value-of select="./tei:occupation"/><br/>
                </span>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <!-- Opere-->
    <xsl:template match="tei:name[@type='bibl']">
        <xsl:variable name="bibl_ref" select="substring-after(@ref, '#')" />
        <xsl:element name="span">
            <xsl:attribute name="class">bibl</xsl:attribute>
            <xsl:element name="a">
                    <xsl:attribute name="href"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listBibl/tei:bibl[@xml:id=$bibl_ref]/tei:ref/@target"/></xsl:attribute>
                    <xsl:apply-templates />
            </xsl:element>
        </xsl:element>
        <xsl:for-each select="/tei:TEI/tei:text/tei:back/tei:div/tei:listBibl/tei:bibl">
            <xsl:if test="@xml:id=$bibl_ref">
                <span class="info">
                    <strong>Titolo: </strong><xsl:value-of select="./tei:title"/><br/>
                    <strong>Autore: </strong><xsl:value-of select="./tei:author | ./tei:respStmt"/><br/>
                    <strong>Anno: </strong><xsl:value-of select="./tei:date"/><br/>
                </span>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <!-- Luoghi-->
    <xsl:template match="tei:name[@type='place']">
        <xsl:variable name="place_ref" select="substring-after(@ref, '#')" />
        <xsl:element name="span">
            <xsl:attribute name="class">place</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
        <xsl:for-each select="/tei:TEI/tei:text/tei:back/tei:div/tei:listPlace/tei:place">
                <xsl:if test="@xml:id=$place_ref">
                    <span class="info">
                        <strong>Nome: </strong><xsl:value-of select="./tei:placeName"/><br/>
                        <strong>Località: </strong><xsl:value-of select="./tei:location"/>
                    </span>
                </xsl:if>
            </xsl:for-each>
    </xsl:template>
    <!--Date-->
    <xsl:template match="tei:date">
        <xsl:element name="span">
            <xsl:attribute name="class">date</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    <!--Verbum-->
    <xsl:template match="tei:term[@type='verbum']">
        <xsl:element name="span">
            <xsl:attribute name="class">verbum</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    <!--Testo straniero-->
    <xsl:template match="*[@xml:lang]">
        <xsl:element name="span">
            <xsl:attribute name="class">foreign</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    <!--Citazioni-->
    <xsl:template match="tei:quote | tei:q | tei:cit | tei:said">
        <xsl:element name="span">
            <xsl:attribute name="class">cit</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    <!--Organizzazioni-->
    <xsl:key name="orgById" match="tei:org" use="@xml:id" />
    <xsl:template match="tei:name[@type='org']">
        <xsl:variable name="org_ref" select="substring-after(@ref, '#')" />
        <xsl:variable
            name="org_element" select="key('orgById', $org_ref)[1]" />
        <xsl:choose>
            <xsl:when test="$org_element/@role = 'publisher'">
                <span class="publisher">
                    <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listOrg/tei:org[@xml:id=$org_ref]/tei:orgName/tei:ref/@target"/></xsl:attribute>
                        <xsl:apply-templates />
                    </xsl:element>  
                </span>
            </xsl:when>
            <xsl:when test="$org_element/@role = 'literary'">
                <span class="literary">
                    <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listOrg/tei:org[@xml:id=$org_ref]/tei:orgName/tei:ref/@target"/></xsl:attribute>
                        <xsl:apply-templates />
                    </xsl:element> 
                </span>
            </xsl:when>
            <xsl:when test="$org_element/@role = 'religion'">
                <span class="religion">
                    <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listOrg/tei:org[@xml:id=$org_ref]/tei:orgName/tei:ref/@target"/></xsl:attribute>
                        <xsl:apply-templates />
                    </xsl:element> 
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="org">
                    <xsl:element name="a">
                        <xsl:attribute name="href"><xsl:value-of select="/tei:TEI/tei:text/tei:back/tei:div/tei:listOrg/tei:org[@xml:id=$org_ref]/tei:orgName/tei:ref/@target"/></xsl:attribute>
                        <xsl:apply-templates />
                    </xsl:element> 
                </span>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:for-each select="/tei:TEI/tei:text/tei:back/tei:div/tei:listOrg/tei:org">
            <xsl:if test="@xml:id=$org_ref">
                <span class="info">
                    <strong><xsl:value-of select="./tei:orgName"/></strong>
                </span>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <!--Espansioni
    e correzioni-->
    <xsl:template match="tei:expan[not(*)]">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
                <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:ex">
        <xsl:element name="span">
            <xsl:attribute name="class">ex</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:corr">
        <xsl:element name="span">
            <xsl:attribute name="class">corr</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>