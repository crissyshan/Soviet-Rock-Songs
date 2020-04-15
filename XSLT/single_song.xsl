<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- ================================================================ -->
    <!-- Multiple input, multiple output                                  -->
    <!-- Do not specify input document in <oXygen/> debugger              -->
    <!-- ================================================================ -->
    <xsl:template name="xsl:initial-template">
        <xsl:for-each select="collection('../XML/lyrics')">
            <!-- Counts of various types of satire -->
            <xsl:variable name="satire_pol" select="count(//satire[@type='political reference'])"/>
            <xsl:variable name="satire_cult" select="count(//satire[@type='cultural reference'])"/>
            <xsl:variable name="satire_sym" select="count(//satire[@type='symbolism'])"/>
            <xsl:variable name="satire_met" select="count(//satire[@type='metaphor'])"/>
            <xsl:variable name="satire_analogy" select="count(//satire[@type='analogy'])"/>
            <xsl:variable name="satire_exp" select="count(//satire[@type='explicit'])"/>
            <xsl:variable name="satire_pun" select="count(//satire[@type='pun'])"/>
            
            <!-- Counts of various types of protest -->
            <xsl:variable name="protest_pol" select="count(//protest[@type='political reference'])"/>
            <xsl:variable name="protest_cult" select="count(//protest[@type='cultural reference'])"/>
            <xsl:variable name="protest_sym" select="count(//protest[@type='symbolism'])"/>
            <xsl:variable name="protest_met" select="count(//protest[@type='metaphor'])"/>
            <xsl:variable name="protest_analogy" select="count(//protest[@type='analogy'])"/>
            <xsl:variable name="protest_exp" select="count(//protest[@type='explicit'])"/>
            
            
            <xsl:variable name="maximum" select="max((count(//satire), count(//protest), 1))"/>       <!-- Sets maximum for vertical scale -->
            <xsl:variable name="max" select="max((count(//satire), count(//protest), 1)) div 400"/>   <!-- Used to scale heights in pixels -->
            
            <xsl:variable name="horizontal">100</xsl:variable> <!-- Position of bar 1 -->
            <xsl:variable name="horizontal2">300</xsl:variable> <!-- Position of bar 2 -->
            <xsl:message select="'Processing file #' || position()"/>
            <xsl:result-document href="result/{tokenize(base-uri(), '/')[last()]}">
                <out>
                    <p>Result document</p>
                    <!--<xsl:copy-of select="//lyrics"/>-->
                </out>
            
                <svg height="500" width="800">
                    <g transform="translate(0,500)">
                        <line x1="50"
                            y1="-50"
                            x2="1600"
                            y2="-50"
                            stroke="black"
                            stroke-width="3"/>
                        <line x1="50"
                            y1="-50"
                            x2="50"
                            y2="-580"
                            stroke="black"
                            stroke-width="3"/>
                        <text x="45" y="-50" text-anchor="end">
                            0
                        </text>
                        <text x="45" y="-250" text-anchor="end">
                            <xsl:value-of select="$maximum div 2"></xsl:value-of>
                        </text>
                        <text x="45" y="-450" text-anchor="end">
                            <xsl:value-of select="$maximum"></xsl:value-of>
                        </text>
                        <line x1="46" x2="53" y1="-250" y2="-250" stroke="black" stroke-width="3"></line>
                        <line x1="46" x2="53" y1="-450" y2="-450" stroke="black" stroke-width="3"></line>
                        <text x="{$horizontal + 50}" y="-30" text-anchor="middle">Satire</text>
                        <text x="{$horizontal2 + 50}" y="-30" text-anchor="middle">Protest</text>
                        <rect width="100" height="{$satire_pol div $max}" x="{$horizontal}" y="{-$satire_pol div $max - 50}" fill="blue"/>
                        <rect width="100" height="{$satire_cult div $max}" x="{$horizontal}" y="{-$satire_cult div $max - ($satire_pol div $max) - 50}" fill="red"/>
                        <rect width="100" height="{$satire_sym div $max}" x="{$horizontal}" y="{-$satire_sym div $max - ($satire_pol div $max) - ($satire_cult div $max) - 50}" fill="green"/>
                        <rect width="100" height="{$satire_met div $max}" x="{$horizontal}" y="{-$satire_met div $max - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - 50}" fill="black"/>
                        <rect width="100" height="{$satire_analogy div $max}" x="{$horizontal}" y="{-$satire_analogy div $max  - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - ($satire_met div $max) - 50}" fill="orange"/>
                        <rect width="100" height="{$satire_exp div $max}" x="{$horizontal}" y="{-$satire_exp div $max - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - ($satire_met div $max) - ($satire_analogy div $max) - 50}" fill="purple"/>
                        <rect width="100" height="{$satire_pun div $max}" x="{$horizontal}" y="{-$satire_pun div $max - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - ($satire_met div $max) - ($satire_analogy div $max) - ($satire_pun div $max) - 50}" fill="pink"/>
                        
                        <rect width="100" height="{$protest_pol div $max}" x="{$horizontal2}" y="{-$protest_pol div $max - 50}" fill="blue"/>
                        <rect width="100" height="{$protest_cult div $max}" x="{$horizontal2}" y="{-$protest_cult div $max - ($protest_pol div $max) - 50}" fill="red"/>
                        <rect width="100" height="{$protest_sym div $max}" x="{$horizontal2}" y="{-$protest_sym div $max - ($protest_pol div $max) - ($protest_cult div $max) - 50}" fill="green"/>
                        <rect width="100" height="{$protest_met div $max}" x="{$horizontal2}" y="{-$protest_met div $max - ($protest_pol div $max) - ($protest_cult div $max) - ($protest_sym div $max) - 50}" fill="black"/>
                        <rect width="100" height="{$protest_analogy div $max}" x="{$horizontal2}" y="{-$protest_analogy div $max - ($protest_pol div $max) - ($protest_cult div $max) - ($protest_sym div $max) - ($protest_met div $max) - 50}" fill="orange"/>
                        <rect width="100" height="{$protest_exp div $max}" x="{$horizontal2}" y="{-$protest_exp div $max - ($protest_pol div $max) - ($protest_cult div $max) - ($protest_sym div $max) - ($protest_met div $max) - ($protest_analogy div $max) - 50}" fill="purple"/>
                        <text x="250" y="15" text-anchor="middle" transform="rotate(-90)">Number of occurences</text>
                    </g>
                    <text x="500" y="20" fill = "black">Key:</text>
                    <text x="500" y="40" fill = "blue">Political Reference</text>
                    <text x="500" y="60" fill = "red">Cultural Reference</text>
                    <text x="500" y="80" fill = "green">Symbolism</text>
                    <text x="500" y="100" fill = "black">Metaphor</text>
                    <text x="500" y="120" fill = "orange">Analogy</text>
                    <text x="500" y="140" fill = "purple">Explicit</text>
                    <text x="500" y="160" fill = "pink">Pun</text>
                </svg>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>