<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Lyrics: <xsl:apply-templates select="//title"/></title>
            </head>
            <body>
                <h1><xsl:apply-templates select="//title"/></h1>
                <h1><xsl:apply-templates select="//artist"/></h1>
                <h2>Year Published: <xsl:apply-templates select="//year"/></h2>
                <h2>Location of Band: <xsl:apply-templates select="//location"/></h2>
                <h2>Video</h2>
                <!-- embed video link -->
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
                <h2>Song Data</h2>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>