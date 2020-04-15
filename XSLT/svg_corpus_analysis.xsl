<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    
    
    <!-- ================================================================ -->
    <!-- Multiple input, single output                                    -->
    <!-- ================================================================ -->
       
    <xsl:template name="xsl:initial-template">
        
        
        <!-- Global Varialbes (from all XML Docs) -->
            
            
        <xsl:variable name="apathy-DI" select="count(collection('../XML/Lyrics')//apathy-DI)"/>
        <xsl:variable name="change" select="count(collection('../XML/Lyrics')//change)"/>
        <xsl:variable name="hope" select="count(collection('../XML/Lyrics')//hope)"/>
        <xsl:variable name="community" select="count(collection('../XML/Lyrics')//community)"/>
        
        <xsl:variable name="protest" select="count(collection('../XML/Lyrics')//protest)"/>
        <xsl:variable name="protest_metaphor" select="count(collection('../XML/Lyrics')//protest[@type='metaphor'])"/>
        <xsl:variable name="protest_symbolism" select="count(collection('../XML/Lyrics')//protest[@type='symbolism'])"/>
        <xsl:variable name="protest_explicit" select="count(collection('../XML/Lyrics')//protest[@type='explicit'])"/>
        <xsl:variable name="protest_symbol_sum" select="sum($protest_symbolism + $protest_metaphor)"/>
        
        <xsl:variable name="satire" select="count(collection('../XML/Lyrics')//satire)"/>
        <xsl:variable name="satire_political" select="count(collection('../XML/Lyrics')//satire[@type='political reference'])"/>
        <xsl:variable name="satire_cultural" select="count(collection('../XML/Lyrics')//satire[@type='cultural'])"/>
        <xsl:variable name="satire_explicit" select="count(collection('../XML/Lyrics')//satire[@type='explicit'])"/>
        <xsl:variable name="satire_mid_sum" select="sum($satire_cultural + $satire_political)"/>
        
        <xsl:variable name="apathy-DI" select="count(collection('../XML/Lyrics')//apathy-DI)"/>
        
        <xsl:variable name="nature" select="count(collection('../XML/Lyrics')//nature)"/>
        <xsl:variable name="nature_resource" select="count(collection('../XML/Lyrics')//nature[@ref='resource'])"/>
        
        <xsl:variable name="self" select="count(collection('../XML/Lyrics')//self)"/>
        <xsl:variable name="self_dream" select="count(collection('../XML/Lyrics')//self[@ref='dream'])"/>
        <xsl:variable name="self_memory" select="count(collection('../XML/Lyrics')//self[@ref='memory'])"/>
        <xsl:variable name="self_conscious" select="count(collection('../XML/Lyrics')//self[@ref='conscious'])"/>
        <xsl:variable name="self_fear" select="count(collection('../XML/Lyrics')//self[@ref='fear'])"/>
        <xsl:variable name="self_life" select="count(collection('../XML/Lyrics')//self[@ref='life'])"/>
        <xsl:variable name="self_love" select="count(collection('../XML/Lyrics')//self[@ref='love'])"/>
        <xsl:variable name="self_loneliness" select="count(collection('../XML/Lyrics')//self[@ref='loneliness'])"/>
        <xsl:variable name="self_soul" select="count(collection('../XML/Lyrics')//self[@ref='soul'])"/>
        <xsl:variable name="self_pride" select="count(collection('../XML/Lyrics')//self[@ref='pride'])"/>
        <xsl:variable name="self_honesty" select="count(collection('../XML/Lyrics')//self[@ref='honesty'])"/>
        <xsl:variable name="self_values" select="count(collection('../XML/Lyrics')//self[@ref='values'])"/>
        
        <xsl:variable name="self_cons_sum" select="$self"/>
        <xsl:variable name="self_dream_sum" select="sum($self_dream + $self_fear + $self_honesty + $self_life + $self_loneliness + $self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_fear_sum" select="sum($self_fear + $self_honesty + $self_life + $self_loneliness + $self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_honesty_sum" select ="sum($self_honesty + $self_life + $self_loneliness + $self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_life_sum" select="sum($self_life + $self_loneliness + $self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_lone_sum" select="sum($self_loneliness + $self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_love_sum" select="sum($self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_memory_sum" select="sum($self_memory + $self_pride + $self_soul + $self_values)"/>"
        <xsl:variable name="self_pride_sum" select="sum($self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_soul_sum" select="sum($self_soul + $self_values)"/>
        
        <xsl:variable name="defense" select="count(collection('../XML/Lyrics')//defense)"/>
        <xsl:variable name="subst" select="count(collection('../XML/Lyrics')//subst)"/>
        <xsl:variable name="industry" select="count(collection('../XML/Lyrics')//industry)"/>
        <xsl:variable name="time" select="count(collection('../XML/Lyrics')//time)"/>
        <xsl:variable name="soviet-symbol" select="count(collection('../XML/Lyrics')//soviet-symbol)"/>
        
        <xsl:variable name="absurdism" select="count(collection('../XML/Lyrics')//absurdism)"/>
        <xsl:variable name="absurdism_low" select="count(collection('../XML/Lyrics')//absurdism[@level='low'])"/>
        <xsl:variable name="absurdism_med" select="count(collection('../XML/Lyrics')//absurdism[@level='medium'])"/>
        <xsl:variable name="absurdism_high" select="count(collection('../XML/Lyrics')//absurdism[@level='high'])"/>
        <xsl:variable name="abs_med_sum" select="sum($absurdism_low + $absurdism_med)"/>
        
        <xsl:variable name="bar_width" select="14"/>
        <xsl:variable name="bar_space" select="$bar_width + 6"/>
        <xsl:variable name="multiplier" select="10"/>
        <xsl:variable name="y2_position" select="14*$bar_space+15"/>
        
        <xsl:result-document href="../Website/analysis_test.xhtml">
            <svg xmlns="http://www.w3.org/2000/svg" height="610" width="500">
                <g transform="translate(200, 15)">
                    <line x1="0" x2="-400" y1="10" y2="10" stroke="black" stroke-width="1"/>
                    <line x1="0" x2="0" y1="10" y2="{$y2_position}" stroke="black"
                        stroke-width="1"/>
                    <rect x="88" y="98" stroke="black" fill="white" stroke-width="0.5" width="15" height="100" /> 
                    <text x="-{$y2_position div 2}" y="100" text-anchor="middle" transform="rotate(-90)" font-size="14" fill="black">Elements Tagged</text>
                    <rect x="-150" y="-10" stroke="black" fill="white" stroke-width="0.5" width="100" height="15" /> 
                    <text x="-100" y="0" text-anchor="middle"  font-size="14" fill="black"># of Appearances</text>
                    <!--<xsl:apply-templates select="//lyrics"/>-->
                </g>
            </svg>
        
        </xsl:result-document>
        
        <!--<xsl:template match="lyrics">
            
            
            <xsl:variable name="sum_elements" select="sum($change + $hope + $community + $protest + $satire + $apathy-DI + $nature + $self)"/>
            <xsl:variable name="change_perc" select="$change div $sum_elements"/>
            <xsl:variable name="hope_perc" select="$hope div $sum_elements"/>
            <xsl:variable name="community_perc" select="$community div $sum_elements"/>
            <xsl:variable name="protest_perc" select="$protest div $sum_elements"/>
            <xsl:variable name="satire_perc" select="$satire div $sum_elements"/>
            <xsl:variable name="apathy-DI_perc" select="$apathy-DI div $sum_elements"/>
            <xsl:variable name="nature_perc" select="$nature div $sum_elements"/>
            <xsl:variable name="self_perc" select="$self div $sum_elements"/>
            
            <rect x="-{$change * $multiplier}" y="12" stroke="black" fill="red" stroke-width="0.5" width="{$change * $multiplier}" height="{$bar_width}"><title>Change</title></rect>
            <text x="5" y="20" text-anchor="start" font-size="10" fill="black">Change</text>
            <rect x="-{$hope * $multiplier}" y="32" stroke="black" fill="gold" stroke-width="0.5" width="{$hope * $multiplier}" height="{$bar_width}"><title>Hope</title></rect>
            <text x="5" y="40" text-anchor="start" font-size="10" fill="black">Hope</text>
            <rect x="-{$community * $multiplier}" y="52" stroke="black" fill="blue" stroke-width="0.5" width="{$community * $multiplier}" height="{$bar_width}"><title>Community (family, nation, religion, city, friends, etc.)</title></rect>
            <text x="5" y="60" text-anchor="start" font-size="10" fill="black">Community</text>
            
            <rect x="-{$protest * $multiplier}" y="72" stroke="black" fill="darkorange" stroke-width="0.5" width="{$protest * $multiplier}" height="{$bar_width}"><title>protest type: explicit</title></rect>
            <rect x="-{$protest_symbol_sum * $multiplier}" y="72" stroke="black" fill="orange" stroke-width="0.5" width="{$protest_symbol_sum * $multiplier}" height="{$bar_width}"><title>protest type: symbolism</title></rect>
            <rect x="-{$protest_metaphor * $multiplier}" y="72" stroke="black" fill="coral" stroke-width="0.5" width="{$protest_metaphor * $multiplier}" height="{$bar_width}"><title>protest type: metaphor</title></rect>
            <text x="5" y="80" text-anchor="start" font-size="10" fill="black">Protest</text>
            
            <rect x="-{$satire * $multiplier}" y="92" stroke="black" fill="darkred" stroke-width="0.5" width="{$satire * $multiplier}" height="{$bar_width}"><title>satire type: cultural reference</title></rect>
            <rect x="-{$satire_mid_sum * $multiplier}" y="92" stroke="black" fill="red" stroke-width="0.5" width="{$satire_mid_sum * $multiplier}" height="{$bar_width}"><title>satire type: explicit</title></rect>
            <rect x="-{$satire_political * $multiplier}" y="92" stroke="black" fill="tomato" stroke-width="0.5" width="{$satire_political * $multiplier}" height="{$bar_width}"><title>satire type: political reference</title></rect>
            <text x="5" y="100" text-anchor="start" font-size="10" fill="black">Satire</text>
            
            <rect x="-{$apathy-DI * $multiplier}" y="112" stroke="black" fill="maroon" stroke-width="0.5" width="{$apathy-DI * $multiplier}" height="{$bar_width}"><title>Apathy/Disillusionment</title></rect>
            <text x="5" y="120" text-anchor="start" font-size="10" fill="black">Apathy/Disillusion</text>
            <rect x="-{$nature * $multiplier}" y="132" stroke="black" fill="springgreen" stroke-width="0.5" width="{$nature * $multiplier}" height="{$bar_width}"><title>Nature (geography, environment, natural resources, etc.) </title></rect>
            <text x="5" y="140" text-anchor="start" font-size="10" fill="black">Nature</text>
            
            <rect x="-{$self * $multiplier}" y="152" stroke="black" fill="olivedrab" stroke-width="0.5" width="{$self * $multiplier}" height="{$bar_width}"><title>attribute: consciousness</title></rect>
            <rect x="-{$self_dream_sum * $multiplier}" y="152" stroke="black" fill="darkcyan" stroke-width="0.5" width="{$self_dream_sum * $multiplier}" height="{$bar_width}"><title>attribute: dream</title></rect>
            <rect x="-{$self_fear_sum * $multiplier}" y="152" stroke="black" fill="darkgreen" stroke-width="0.5" width="{$self_fear_sum * $multiplier}" height="{$bar_width}"><title>attribute: fear</title></rect>
            <rect x="-{$self_honesty_sum * $multiplier}" y="152" stroke="black" fill="lime" stroke-width="0.5" width="{$self_honesty_sum * $multiplier}" height="{$bar_width}"><title>attribute: honesty</title></rect>
            <rect x="-{$self_life_sum * $multiplier}" y="152" stroke="black" fill="lightgreen" stroke-width="0.5" width="{$self_life_sum * $multiplier}" height="{$bar_width}"><title>attribute: life</title></rect>
            <rect x="-{$self_lone_sum * $multiplier}" y="152" stroke="black" fill="seagreen" stroke-width="0.5" width="{$self_lone_sum * $multiplier}" height="{$bar_width}"><title>attribute: loneliness</title></rect>
            <rect x="-{$self_love_sum * $multiplier}" y="152" stroke="black" fill="turquoise" stroke-width="0.5" width="{$self_love_sum * $multiplier}" height="{$bar_width}"><title>attribute: love</title></rect>
            <rect x="-{$self_memory_sum * $multiplier}" y="152" stroke="black" fill="teal" stroke-width="0.5" width="{$self_memory_sum * $multiplier}" height="{$bar_width}"><title>attribute: memory</title></rect>
            <rect x="-{$self_pride_sum * $multiplier}" y="152" stroke="black" fill="aquamarine" stroke-width="0.5" width="{$self_pride_sum * $multiplier}" height="{$bar_width}"><title>attribute: pride</title></rect>
            <rect x="-{$self_soul_sum * $multiplier}" y="152" stroke="black" fill="powderblue" stroke-width="0.5" width="{$self_soul_sum * $multiplier}" height="{$bar_width}"><title>attribute: soul/spirit</title></rect>
            <rect x="-{$self_values * $multiplier}" y="152" stroke="black" fill="royalblue" stroke-width="0.5" width="{$self_values * $multiplier}" height="{$bar_width}"><title>attribute: values</title></rect>
            <text x="5" y="160" text-anchor="start" font-size="10" fill="black">Self</text>
            
            <rect x="-{$absurdism * $multiplier}" y="172" stroke="black" fill="cyan" stroke-width="0.5" width="{$absurdism * $multiplier}" height="{$bar_width}"><title>absurdism level: low</title></rect>
            <rect x="-{$abs_med_sum * $multiplier}" y="172" stroke="black" fill="powderblue" stroke-width="0.5" width="{$abs_med_sum * $multiplier}" height="{$bar_width}"><title>absurdism level: medium</title></rect>
            <rect x="-{$absurdism_high *$multiplier}" y="172" stroke="black" fill="lightcyan" stroke-width="0.5" width="{$absurdism_high * $multiplier}" height="{$bar_width}"><title>absurdism level: high</title></rect>
            <text x="5" y="180" text-anchor="start" font-size="10" fill="black">Absurdism</text>
            
            <rect x="-{$industry * $multiplier}" y="192" stroke="black" fill="gray" stroke-width="0.5" width="{$industry * $multiplier}" height="{$bar_width}"><title>Indsutry (technology, labor, infrastructure, innovation, etc.)</title></rect>
            <text x="5" y="200" text-anchor="start" font-size="10" fill="black">Industry</text>
            <rect x="-{$soviet-symbol * $multiplier}" y="212" stroke="black" fill="yellow" stroke-width="0.5" width="{$soviet-symbol * $multiplier}" height="{$bar_width}"><title>Soviet Symbols</title></rect>
            <text x="5" y="220" text-anchor="start" font-size="10" fill="black">Soviet Symbols</text>
            <rect x="-{$defense * $multiplier}" y="232" stroke="black" fill="orange" stroke-width="0.5" width="{$defense * $multiplier}" height="{$bar_width}"><title>Defense (violence, militarism, protection, etc.)</title></rect>
            <text x="5" y="240" text-anchor="start" font-size="10" fill="black">Defense</text>
            <rect x="-{$subst * $multiplier}" y="252" stroke="black" fill="navy" stroke-width="0.5" width="{$subst * $multiplier}" height="{$bar_width}"><title>Substances (drug and alcohol references, etc.)</title></rect>
            <text x="5" y="260" text-anchor="start" font-size="10" fill="black">Substance</text>
            <rect x="-{$time * $multiplier}" y="272" stroke="black" fill="green" stroke-width="0.5" width="{$time * $multiplier}" height="{$bar_width}"><title>Time (future, passage of time, past, waiting, etc.)</title></rect>
            <text x="5" y="280" text-anchor="start" font-size="10" fill="black">Time</text>
        </xsl:template>-->
            
            
       <!-- <xsl:result-document href="../Website/analysis_test.xhtml">
                   
            
            
            
            
                <xsl:for-each select="collection('../XML/Lyrics')">
                    <p>
                   <xsl:value-of select = "count(//protest)"/>
                    </p>
                    <xsl:message select="count(//protest)"/>
                        
                </xsl:for-each>
        </xsl:result-document>-->
            
    </xsl:template>
    
    
    <!--
    
    </xsl:template>
    
        
        
        
        
        <!-\- -\->
        
        
        
        <xsl:template match="/">
            <html>
                <head>
                    <title>Lyrics: <xsl:apply-templates select="//title"/></title>
                    <!-\-<link href="soviet-rock.css" rel="stylesheet" type="text/css" />-\->
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
                            <th><p>Insert simple song description (assumption being-\- user doesn't read Russian).</p></th>
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
    </xsl:template>-->
</xsl:stylesheet>