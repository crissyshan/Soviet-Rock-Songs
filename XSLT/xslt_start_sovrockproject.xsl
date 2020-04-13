<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:variable name="apathy" select="count(//apathy-DI)"/>
    <xsl:variable name="dummy">2</xsl:variable>
    <xsl:variable name="ratio_apathy" select= "$apathy div $dummy"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Lyrics: <xsl:apply-templates select="//title"/></title>
                <!--<link href="soviet-rock.css" rel="stylesheet" type="text/css" />-->
            </head>
            <body>
                <h1><xsl:apply-templates select="//title"/></h1>
                <h2>Song Details</h2>
                <ul>
                    <xsl:apply-templates select="//details"/>
                </ul>
               <h2>Video</h2>
                <xsl:apply-templates select="//video"/>
                
               <table>
                    <tr>
                        <th><h3>What's this song about?</h3></th>
                        <th><h3>Why was it selected?</h3></th>
                    </tr>
                    <tr>
                        <th><p>Insert simple song description (assumption being-- user doesn't read Russian).</p></th>
                        <th><p>Insert explanation of why song was selected.</p></th>
                    </tr>
                </table>
                <div class="popup" onclick="myFunction()">Click for Song Lyrics.
                    <span class="popuptext" id="myPopup"><xsl:apply-templates select="//lyrics"/></span>
                </div>
                <h2>Song Data</h2>
                <ul>
                    <li><xsl:value-of select="$ratio_apathy"></xsl:value-of></li>
                </ul>
                <div id = "svg1_wrapper"><svg xmlns="http://www.w3.org/2000/svg" height = "100%" width = "100%">
                    <line x1="0" x2="100" y1="0" y2="100" stroke = "black" stroke-width="5"/>
                </svg></div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="details">
        <li>Artist:<xsl:apply-templates select="artist"/></li>
        <li>Year: <xsl:apply-templates select="year"/></li>
        <li>Location of Band: <xsl:apply-templates select="location"/></li>
    </xsl:template>
    <xsl:template match="video">
        <iframe width="420" height="315"
            src="{.}">
        </iframe>
    </xsl:template>
</xsl:stylesheet>