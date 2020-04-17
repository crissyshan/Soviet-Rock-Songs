<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- ================================================================ -->
    <!-- Multiple input, single output                                    -->
    <!-- ================================================================ -->

    <xsl:template name="xsl:initial-template">
        <xsl:variable name="apathy-DI" select="count(collection('../XML/Lyrics')//apathy-DI)"/>
        <xsl:variable name="change" select="count(collection('../XML/Lyrics')//change)"/>
        <xsl:variable name="hope" select="count(collection('../XML/Lyrics')//hope)"/>
        <xsl:variable name="community" select="count(collection('../XML/Lyrics')//community)"/>
        <xsl:variable name="protest" select="count(collection('../XML/Lyrics')//protest)"/>
        <xsl:variable name="protest_metaphor"
            select="count(collection('../XML/Lyrics')//protest[@type = 'metaphor'])"/>
        <xsl:variable name="protest_symbolism"
            select="count(collection('../XML/Lyrics')//protest[@type = 'symbolism'])"/>
        <xsl:variable name="protest_explicit"
            select="count(collection('../XML/Lyrics')//protest[@type = 'explicit'])"/>
        <xsl:variable name="protest_symbol_sum" select="sum($protest_symbolism + $protest_metaphor)"/>
        <xsl:variable name="satire" select="count(collection('../XML/Lyrics')//satire)"/>
        <xsl:variable name="satire_political"
            select="count(collection('../XML/Lyrics')//satire[@type = 'political reference'])"/>
        <xsl:variable name="satire_cultural"
            select="count(collection('../XML/Lyrics')//satire[@type = 'cultural'])"/>
        <xsl:variable name="satire_explicit"
            select="count(collection('../XML/Lyrics')//satire[@type = 'explicit'])"/>
        <xsl:variable name="satire_mid_sum" select="sum($satire_cultural + $satire_political)"/>
        <xsl:variable name="apathy-DI" select="count(collection('../XML/Lyrics')//apathy-DI)"/>
        <xsl:variable name="nature" select="count(collection('../XML/Lyrics')//nature)"/>
        <xsl:variable name="nature_resource"
            select="count(collection('../XML/Lyrics')//nature[@ref = 'resource'])"/>
        <xsl:variable name="self" select="count(collection('../XML/Lyrics')//self)"/>
        <xsl:variable name="self_dream"
            select="count(collection('../XML/Lyrics')//self[@ref = 'dream'])"/>
        <xsl:variable name="self_memory"
            select="count(collection('../XML/Lyrics')//self[@ref = 'memory'])"/>
        <xsl:variable name="self_conscious"
            select="count(collection('../XML/Lyrics')//self[@ref = 'conscious'])"/>
        <xsl:variable name="self_fear"
            select="count(collection('../XML/Lyrics')//self[@ref = 'fear'])"/>
        <xsl:variable name="self_life"
            select="count(collection('../XML/Lyrics')//self[@ref = 'life'])"/>
        <xsl:variable name="self_love"
            select="count(collection('../XML/Lyrics')//self[@ref = 'love'])"/>
        <xsl:variable name="self_loneliness"
            select="count(collection('../XML/Lyrics')//self[@ref = 'loneliness'])"/>
        <xsl:variable name="self_soul"
            select="count(collection('../XML/Lyrics')//self[@ref = 'soul'])"/>
        <xsl:variable name="self_pride"
            select="count(collection('../XML/Lyrics')//self[@ref = 'pride'])"/>
        <xsl:variable name="self_honesty"
            select="count(collection('../XML/Lyrics')//self[@ref = 'honesty'])"/>
        <xsl:variable name="self_values"
            select="count(collection('../XML/Lyrics')//self[@ref = 'values'])"/>
        <xsl:variable name="self_cons_sum" select="$self"/>
        <xsl:variable name="self_dream_sum"
            select="sum($self_dream + $self_fear + $self_honesty + $self_life + $self_loneliness + $self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_fear_sum"
            select="sum($self_fear + $self_honesty + $self_life + $self_loneliness + $self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_honesty_sum"
            select="sum($self_honesty + $self_life + $self_loneliness + $self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_life_sum"
            select="sum($self_life + $self_loneliness + $self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_lone_sum"
            select="sum($self_loneliness + $self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_love_sum"
            select="sum($self_love + $self_memory + $self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_memory_sum"
            select="sum($self_memory + $self_pride + $self_soul + $self_values)"/>" <xsl:variable
            name="self_pride_sum" select="sum($self_pride + $self_soul + $self_values)"/>
        <xsl:variable name="self_soul_sum" select="sum($self_soul + $self_values)"/>
        <xsl:variable name="defense" select="count(collection('../XML/Lyrics')//defense)"/>
        <xsl:variable name="subst" select="count(collection('../XML/Lyrics')//subst)"/>
        <xsl:variable name="industry" select="count(collection('../XML/Lyrics')//industry)"/>
        <xsl:variable name="time" select="count(collection('../XML/Lyrics')//time)"/>
        <xsl:variable name="soviet-symbol"
            select="count(collection('../XML/Lyrics')//soviet-symbol)"/>
        <xsl:variable name="absurdism" select="count(collection('../XML/Lyrics')//absurdism)"/>
        <xsl:variable name="absurdism_low"
            select="count(collection('../XML/Lyrics')//absurdism[@level = 'low'])"/>
        <xsl:variable name="absurdism_med"
            select="count(collection('../XML/Lyrics')//absurdism[@level = 'medium'])"/>
        <xsl:variable name="absurdism_high"
            select="count(collection('../XML/Lyrics')//absurdism[@level = 'high'])"/>
        <xsl:variable name="abs_med_sum" select="sum($absurdism_low + $absurdism_med)"/>
        <xsl:variable name="bar_width" select="14"/>
        <xsl:variable name="bar_space" select="$bar_width + 6"/>
        <xsl:variable name="multiplier" select="10"/>
        <xsl:variable name="y2_position" select="14 * $bar_space + 15"/>
        <!-- For line graphs -->
        <xsl:variable name="p1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//protest)"/>
        <xsl:variable name="p1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//protest)"/>
        <xsl:variable name="p1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//protest)"/>
        <xsl:variable name="p1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//protest)"/>
        <xsl:variable name="p1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//protest)"/>
        <xsl:variable name="p1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//protest)"/>
        <xsl:variable name="p1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//protest)"/>
        <xsl:variable name="p1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//protest)"/>
        <xsl:variable name="p1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//protest)"/>
        <xsl:variable name="p1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//protest)"/>
        <xsl:variable name="maximump"
            select="max(($p1980, $p1981, $p1982, $p1983, $p1984, $p1985, $p1986, $p1987, $p1988, $p1989))"/>
        <xsl:variable name="s1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//satire)"/>
        <xsl:variable name="s1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//satire)"/>
        <xsl:variable name="s1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//satire)"/>
        <xsl:variable name="s1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//satire)"/>
        <xsl:variable name="s1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//satire)"/>
        <xsl:variable name="s1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//satire)"/>
        <xsl:variable name="s1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//protest)"/>
        <xsl:variable name="s1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//satire)"/>
        <xsl:variable name="s1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//satire)"/>
        <xsl:variable name="s1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//satire)"/>
        <xsl:variable name="maximums"
            select="max(($s1980, $s1981, $s1982, $s1983, $s1984, $s1985, $s1986, $s1987, $s1988, $s1989))"/>
        <xsl:result-document href="../Website/analysis.xhtml">
            <html>
                <head>
                    <title>Analysis</title>
                    <link rel="stylesheet" type="text/css" href="soviet-rock.css" />
                </head>
                <body>
                    <div id="headerimg">
                        <img src="soviet-rock-banner.jpg" />
                    </div>
                    <header>
                        <a href = "index.xhtml" id = "tab1">Home</a>
                        <a href = "about.xhtml" id = "tab2">About</a>
                        <a href = "criteria.xhtml" id = "tab3">Criteria</a>
                        <a href = "lyrics.xhtml" id = "tab4">Lyrics</a>
                        <a href = "analysis.xhtml" id = "tab5">Analysis</a>
                        <a href = "conclusion.xhtml" id = "tab6">Conclusion</a>
                        <a href = "more.xhtml" id = "tab7">More</a>
                    </header>
                    <section id="section1">
                        <div id="Welcome">
                            <h1>Analysis of Data</h1>
                        </div>
                        <div id="Graph">
                            <h1>Frequency of References</h1>
                            <svg xmlns="http://www.w3.org/2000/svg" height="400" width="1000">
                                <g transform="translate(800, 15)">
                                    <line x1="0" x2="-800" y1="10" y2="10" stroke="black"
                                        stroke-width="1"/>
                                    <line x1="0" x2="0" y1="10" y2="{$y2_position}" stroke="black"
                                        stroke-width="1"/>
                                    <rect x="88" y="98" stroke="black" fill="white"
                                        stroke-width="0.5" width="15" height="100"/>
                                    <text x="-{$y2_position div 2}" y="100" text-anchor="middle"
                                        transform="rotate(-90)" font-size="14" fill="black">Reference Name</text>
                                    <rect x="-150" y="-10" stroke="black" fill="white"
                                        stroke-width="0.5" width="100" height="15"/>
                                    <text x="-100" y="0" text-anchor="middle" font-size="14"
                                        fill="black"># of Appearances</text>
                                    <rect x="-{$change * $multiplier}" y="12" stroke="black"
                                        fill="red" stroke-width="0.5"
                                        width="{$change * $multiplier}" height="{$bar_width}"
                                            ><title>Change</title></rect>
                                    <text x="5" y="20" text-anchor="start" font-size="10"
                                        fill="black">Change</text>
                                    <rect x="-{$hope * $multiplier}" y="32" stroke="black"
                                        fill="gold" stroke-width="0.5" width="{$hope * $multiplier}"
                                        height="{$bar_width}"><title>Hope</title></rect>
                                    <text x="5" y="40" text-anchor="start" font-size="10"
                                        fill="black">Hope</text>
                                    <rect x="-{$community * $multiplier}" y="52" stroke="black"
                                        fill="blue" stroke-width="0.5"
                                        width="{$community * $multiplier}" height="{$bar_width}"
                                            ><title>Community (family, nation, religion, city,
                                            friends, etc.)</title></rect>
                                    <text x="5" y="60" text-anchor="start" font-size="10"
                                        fill="black">Community</text>
                                    <rect x="-{$protest * $multiplier}" y="72" stroke="black"
                                        fill="darkorange" stroke-width="0.5"
                                        width="{$protest * $multiplier}" height="{$bar_width}"
                                            ><title>protest type: explicit</title></rect>
                                    <rect x="-{$protest_symbol_sum * $multiplier}" y="72"
                                        stroke="black" fill="orange" stroke-width="0.5"
                                        width="{$protest_symbol_sum * $multiplier}"
                                        height="{$bar_width}"><title>protest type:
                                        symbolism</title></rect>
                                    <rect x="-{$protest_metaphor * $multiplier}" y="72"
                                        stroke="black" fill="coral" stroke-width="0.5"
                                        width="{$protest_metaphor * $multiplier}"
                                        height="{$bar_width}"><title>protest type:
                                        metaphor</title></rect>
                                    <text x="5" y="80" text-anchor="start" font-size="10"
                                        fill="black">Protest</text>
                                    <rect x="-{$satire * $multiplier}" y="92" stroke="black"
                                        fill="darkred" stroke-width="0.5"
                                        width="{$satire * $multiplier}" height="{$bar_width}"
                                            ><title>satire type: cultural reference</title></rect>
                                    <rect x="-{$satire_mid_sum * $multiplier}" y="92" stroke="black"
                                        fill="red" stroke-width="0.5"
                                        width="{$satire_mid_sum * $multiplier}"
                                        height="{$bar_width}"><title>satire type:
                                        explicit</title></rect>
                                    <rect x="-{$satire_political * $multiplier}" y="92"
                                        stroke="black" fill="tomato" stroke-width="0.5"
                                        width="{$satire_political * $multiplier}"
                                        height="{$bar_width}"><title>satire type: political
                                            reference</title></rect>
                                    <text x="5" y="100" text-anchor="start" font-size="10"
                                        fill="black">Satire</text>
                                    <rect x="-{$apathy-DI * $multiplier}" y="112" stroke="black"
                                        fill="maroon" stroke-width="0.5"
                                        width="{$apathy-DI * $multiplier}" height="{$bar_width}"
                                            ><title>Apathy/Disillusionment</title></rect>
                                    <text x="5" y="120" text-anchor="start" font-size="10"
                                        fill="black">Apathy/Disillusion</text>
                                    <rect x="-{$nature * $multiplier}" y="132" stroke="black"
                                        fill="springgreen" stroke-width="0.5"
                                        width="{$nature * $multiplier}" height="{$bar_width}"
                                            ><title>Nature (geography, environment, natural
                                            resources, etc.) </title></rect>
                                    <text x="5" y="140" text-anchor="start" font-size="10"
                                        fill="black">Nature</text>
                                    <rect x="-{$self * $multiplier}" y="152" stroke="black"
                                        fill="olivedrab" stroke-width="0.5"
                                        width="{$self * $multiplier}" height="{$bar_width}"
                                            ><title>attribute: consciousness</title></rect>
                                    <rect x="-{$self_dream_sum * $multiplier}" y="152"
                                        stroke="black" fill="darkcyan" stroke-width="0.5"
                                        width="{$self_dream_sum * $multiplier}"
                                        height="{$bar_width}"><title>attribute: dream</title></rect>
                                    <rect x="-{$self_fear_sum * $multiplier}" y="152" stroke="black"
                                        fill="darkgreen" stroke-width="0.5"
                                        width="{$self_fear_sum * $multiplier}" height="{$bar_width}"
                                            ><title>attribute: fear</title></rect>
                                    <rect x="-{$self_honesty_sum * $multiplier}" y="152"
                                        stroke="black" fill="lime" stroke-width="0.5"
                                        width="{$self_honesty_sum * $multiplier}"
                                        height="{$bar_width}"><title>attribute:
                                        honesty</title></rect>
                                    <rect x="-{$self_life_sum * $multiplier}" y="152" stroke="black"
                                        fill="lightgreen" stroke-width="0.5"
                                        width="{$self_life_sum * $multiplier}" height="{$bar_width}"
                                            ><title>attribute: life</title></rect>
                                    <rect x="-{$self_lone_sum * $multiplier}" y="152" stroke="black"
                                        fill="seagreen" stroke-width="0.5"
                                        width="{$self_lone_sum * $multiplier}" height="{$bar_width}"
                                            ><title>attribute: loneliness</title></rect>
                                    <rect x="-{$self_love_sum * $multiplier}" y="152" stroke="black"
                                        fill="turquoise" stroke-width="0.5"
                                        width="{$self_love_sum * $multiplier}" height="{$bar_width}"
                                            ><title>attribute: love</title></rect>
                                    <rect x="-{$self_memory_sum * $multiplier}" y="152"
                                        stroke="black" fill="teal" stroke-width="0.5"
                                        width="{$self_memory_sum * $multiplier}"
                                        height="{$bar_width}"><title>attribute:
                                        memory</title></rect>
                                    <rect x="-{$self_pride_sum * $multiplier}" y="152"
                                        stroke="black" fill="aquamarine" stroke-width="0.5"
                                        width="{$self_pride_sum * $multiplier}"
                                        height="{$bar_width}"><title>attribute: pride</title></rect>
                                    <rect x="-{$self_soul_sum * $multiplier}" y="152" stroke="black"
                                        fill="powderblue" stroke-width="0.5"
                                        width="{$self_soul_sum * $multiplier}" height="{$bar_width}"
                                            ><title>attribute: soul/spirit</title></rect>
                                    <rect x="-{$self_values * $multiplier}" y="152" stroke="black"
                                        fill="royalblue" stroke-width="0.5"
                                        width="{$self_values * $multiplier}" height="{$bar_width}"
                                            ><title>attribute: values</title></rect>
                                    <text x="5" y="160" text-anchor="start" font-size="10"
                                        fill="black">Self</text>
                                    <rect x="-{$absurdism * $multiplier}" y="172" stroke="black"
                                        fill="cyan" stroke-width="0.5"
                                        width="{$absurdism * $multiplier}" height="{$bar_width}"
                                            ><title>absurdism level: low</title></rect>
                                    <rect x="-{$abs_med_sum * $multiplier}" y="172" stroke="black"
                                        fill="powderblue" stroke-width="0.5"
                                        width="{$abs_med_sum * $multiplier}" height="{$bar_width}"
                                            ><title>absurdism level: medium</title></rect>
                                    <rect x="-{$absurdism_high *$multiplier}" y="172" stroke="black"
                                        fill="lightcyan" stroke-width="0.5"
                                        width="{$absurdism_high * $multiplier}"
                                        height="{$bar_width}"><title>absurdism level:
                                        high</title></rect>
                                    <text x="5" y="180" text-anchor="start" font-size="10"
                                        fill="black">Absurdism</text>
                                    <rect x="-{$industry * $multiplier}" y="192" stroke="black"
                                        fill="gray" stroke-width="0.5"
                                        width="{$industry * $multiplier}" height="{$bar_width}"
                                            ><title>Indsutry (technology, labor, infrastructure,
                                            innovation, etc.)</title></rect>
                                    <text x="5" y="200" text-anchor="start" font-size="10"
                                        fill="black">Industry</text>
                                    <rect x="-{$soviet-symbol * $multiplier}" y="212" stroke="black"
                                        fill="yellow" stroke-width="0.5"
                                        width="{$soviet-symbol * $multiplier}" height="{$bar_width}"
                                            ><title>Soviet Symbols</title></rect>
                                    <text x="5" y="220" text-anchor="start" font-size="10"
                                        fill="black">Soviet Symbols</text>
                                    <rect x="-{$defense * $multiplier}" y="232" stroke="black"
                                        fill="orange" stroke-width="0.5"
                                        width="{$defense * $multiplier}" height="{$bar_width}"
                                            ><title>Defense (violence, militarism, protection,
                                            etc.)</title></rect>
                                    <text x="5" y="240" text-anchor="start" font-size="10"
                                        fill="black">Defense</text>
                                    <rect x="-{$subst * $multiplier}" y="252" stroke="black"
                                        fill="navy" stroke-width="0.5"
                                        width="{$subst * $multiplier}" height="{$bar_width}"
                                            ><title>Substances (drug and alcohol references,
                                            etc.)</title></rect>
                                    <text x="5" y="260" text-anchor="start" font-size="10"
                                        fill="black">Substance</text>
                                    <rect x="-{$time * $multiplier}" y="272" stroke="black"
                                        fill="green" stroke-width="0.5"
                                        width="{$time * $multiplier}" height="{$bar_width}"
                                            ><title>Time (future, passage of time, past, waiting,
                                            etc.)</title></rect>
                                    <text x="5" y="280" text-anchor="start" font-size="10"
                                        fill="black">Time</text>
                                </g>
                            </svg>
                        </div>
                        <div id="Graph">
                            <h1>Frequency of Protest References Over Time</h1>
                            <svg xmlns="http://www.w3.org/2000/svg" height="500" width="600">
                                <!-- Line Graph for Protest -->
                                <g transform="translate(0, 500)">
                                    <line x1="50" y1="-50" x2="1600" y2="-50" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                        stroke-width="3"/>
                                    <text x="45" y="-50" text-anchor="end"> 0 </text>
                                    <text x="45" y="-250" text-anchor="end">
                                        <xsl:value-of select="$maximump div 2"/>
                                    </text>
                                    <text x="45" y="-450" text-anchor="end">
                                        <xsl:value-of select="$maximump"/>
                                    </text>
                                    <text x="100" y="-30" text-anchor="middle">1980</text>
                                    <text x="150" y="-30" text-anchor="middle">1981</text>
                                    <text x="200" y="-30" text-anchor="middle">1982</text>
                                    <text x="250" y="-30" text-anchor="middle">1983</text>
                                    <text x="300" y="-30" text-anchor="middle">1984</text>
                                    <text x="350" y="-30" text-anchor="middle">1985</text>
                                    <text x="400" y="-30" text-anchor="middle">1986</text>
                                    <text x="450" y="-30" text-anchor="middle">1987</text>
                                    <text x="500" y="-30" text-anchor="middle">1988</text>
                                    <text x="550" y="-30" text-anchor="middle">1989</text>
                                    <line x1="100" y1="-47" x2="100" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="150" y1="-47" x2="150" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="200" y1="-47" x2="200" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="250" y1="-47" x2="250" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="300" y1="-47" x2="300" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="350" y1="-47" x2="350" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="400" y1="-47" x2="400" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="450" y1="-47" x2="450" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="500" y1="-47" x2="500" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="550" y1="-47" x2="550" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                        stroke-width="3"/>
                                    <polyline fill="none" stroke="red" stroke-width="3"
                                        points="
                            100, {-400*($p1980 div $maximump) - 50}
                            150, {-400*($p1981 div $maximump) - 50}
                            200, {-400*($p1982 div $maximump) - 50}
                            250, {-400*($p1983 div $maximump) - 50}
                            300, {-400*($p1984 div $maximump) - 50}
                            350, {-400*($p1985 div $maximump) - 50}
                            400, {-400*($p1986 div $maximump) - 50}
                            450, {-400*($p1987 div $maximump) - 50}
                            500, {-400*($p1988 div $maximump) - 50}
                            550, {-400*($p1989 div $maximump) - 50}"
                                    />
                                </g>
                            </svg>
                        </div>
                        <div id="Graph">
                            <h1>Frequency of Satirical References Over Time</h1>
                            <svg xmlns="http://www.w3.org/2000/svg" height="500" width="600">
                                <!-- Line Graph for Satire -->
                                <g transform="translate(0, 500)">
                                    <line x1="50" y1="-50" x2="1600" y2="-50" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                        stroke-width="3"/>
                                    <text x="45" y="-50" text-anchor="end"> 0 </text>
                                    <text x="45" y="-250" text-anchor="end">
                                        <xsl:value-of select="$maximums div 2"/>
                                    </text>
                                    <text x="45" y="-450" text-anchor="end">
                                        <xsl:value-of select="$maximums"/>
                                    </text>
                                    <text x="100" y="-30" text-anchor="middle">1980</text>
                                    <text x="150" y="-30" text-anchor="middle">1981</text>
                                    <text x="200" y="-30" text-anchor="middle">1982</text>
                                    <text x="250" y="-30" text-anchor="middle">1983</text>
                                    <text x="300" y="-30" text-anchor="middle">1984</text>
                                    <text x="350" y="-30" text-anchor="middle">1985</text>
                                    <text x="400" y="-30" text-anchor="middle">1986</text>
                                    <text x="450" y="-30" text-anchor="middle">1987</text>
                                    <text x="500" y="-30" text-anchor="middle">1988</text>
                                    <text x="550" y="-30" text-anchor="middle">1989</text>
                                    <line x1="100" y1="-47" x2="100" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="150" y1="-47" x2="150" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="200" y1="-47" x2="200" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="250" y1="-47" x2="250" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="300" y1="-47" x2="300" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="350" y1="-47" x2="350" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="400" y1="-47" x2="400" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="450" y1="-47" x2="450" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="500" y1="-47" x2="500" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="550" y1="-47" x2="550" y2="-54" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                        stroke-width="3"/>
                                    <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                        stroke-width="3"/>
                                    <polyline fill="none" stroke="blue" stroke-width="3"
                                        points="
                                100, {-400*($s1980 div $maximums) - 50}
                                150, {-400*($s1981 div $maximums) - 50}
                                200, {-400*($s1982 div $maximums) - 50}
                                250, {-400*($s1983 div $maximums) - 50}
                                300, {-400*($s1984 div $maximums) - 50}
                                350, {-400*($s1985 div $maximums) - 50}
                                400, {-400*($s1986 div $maximums) - 50}
                                450, {-400*($s1987 div $maximums) - 50}
                                500, {-400*($s1988 div $maximums) - 50}
                                550, {-400*($s1989 div $maximums) - 50}"
                                    />
                                </g>
                            </svg>
                        </div>
                    </section>
                </body>
            </html>
        </xsl:result-document>
        <xsl:for-each select="collection('../XML/lyrics')">
            <!-- Counts of various types of satire -->
            <xsl:variable name="satire_pol" select="count(//satire[@type = 'political reference'])"/>
            <xsl:variable name="satire_cult" select="count(//satire[@type = 'cultural reference'])"/>
            <xsl:variable name="satire_sym" select="count(//satire[@type = 'symbolism'])"/>
            <xsl:variable name="satire_met" select="count(//satire[@type = 'metaphor'])"/>
            <xsl:variable name="satire_analogy" select="count(//satire[@type = 'analogy'])"/>
            <xsl:variable name="satire_exp" select="count(//satire[@type = 'explicit'])"/>
            <xsl:variable name="satire_pun" select="count(//satire[@type = 'pun'])"/>
            <!-- Counts of various types of protest -->
            <xsl:variable name="protest_pol"
                select="count(//protest[@type = 'political reference'])"/>
            <xsl:variable name="protest_cult"
                select="count(//protest[@type = 'cultural reference'])"/>
            <xsl:variable name="protest_sym" select="count(//protest[@type = 'symbolism'])"/>
            <xsl:variable name="protest_met" select="count(//protest[@type = 'metaphor'])"/>
            <xsl:variable name="protest_analogy" select="count(//protest[@type = 'analogy'])"/>
            <xsl:variable name="protest_exp" select="count(//protest[@type = 'explicit'])"/>
            <xsl:variable name="maximum" select="max((count(//satire), count(//protest), 1))"/>
            <!-- Sets maximum for vertical scale -->
            <xsl:variable name="max" select="max((count(//satire), count(//protest), 1)) div 400"/>
            <!-- Used to scale heights in pixels -->
            <xsl:variable name="horizontal">100</xsl:variable>
            <!-- Position of bar 1 -->
            <xsl:variable name="horizontal2">300</xsl:variable>
            <!-- Position of bar 2 -->
            <xsl:message select="'Processing file #' || position()"/>
            <xsl:result-document
                href="../Website/Lyrics/{tokenize(tokenize(base-uri(), '/')[last()], '\.')[position()=1]}.xhtml">
                <html>
                    <head>
                        <title>Lyrics</title>
                        <link rel="stylesheet" type="text/css" href="../soviet-rock.css" />
                    </head>
                    <body>
                        <div id="headerimg">
                            <img src="../soviet-rock-banner.jpg" />
                        </div>
                        <header>
                            <a href="../index.xhtml" id="tab1">Home</a>
                            <a href="../about.xhtml" id="tab2">About</a>
                            <a href="../criteria.xhtml" id="tab3">Criteria</a>
                            <a href="../lyrics.xhtml" id="tab4">Lyrics</a>
                            <a href="../analysis.xhtml" id="tab5">Analysis</a>
                            <a href="../conclusion.xhtml" id="tab6">Conclusion</a>
                            <a href="../more.xhtml" id="tab7">More</a>
                        </header>
                        <header>
                            <div class="dropdown">
                                <button id="tab11">1980</button>
                                <div class="dropdown-content">
                                    <a href="ne-strelyai.xhtml">Ne Strelyai</a>
                                    <a href="povorot.xhtml">Povorot</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab12">1981</button>
                                <div class="dropdown-content"> </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab13">1982</button>
                                <div class="dropdown-content">
                                    <a href="prosti-zemlya.xhtml">Prosti Zemlya</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab14">1983</button>
                                <div class="dropdown-content">
                                    <a href="kamchatka.xhtml">Kamchatka</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab15">1984</button>
                                <div class="dropdown-content">
                                    <a href="storozh_sergeev.xhtml">Storozh Sergeev</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab16">1985</button>
                                <div class="dropdown-content">
                                    <a href="komarovo.xhtml">Komarovo</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab17">1986</button>
                                <div class="dropdown-content">
                                    <a href="v_dobriy_chas.xhtml">V Dobriy Chas</a>
                                    <a href="vladimirskaya-rus.xhtml">Vladimirskaya Rus</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab18">1987</button>
                                <div class="dropdown-content">
                                    <a href="listya.xhtml">Listya</a>
                                    <a href="shar_tsveta.xhtml">Shar Tsveta Khaki</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab19">1988</button>
                                <div class="dropdown-content">
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab20">1989</button>
                                <div class="dropdown-content">
                                </div>
                            </div>
                        </header>
                        <section id="section0">
                            <div id="Lyrics">
                                <h1>~<xsl:value-of select="//title"/>~</h1>
                                <h2><xsl:value-of select="//artist"/>, <xsl:value-of select="//year"/></h2>
                                <p><xsl:apply-templates select="//lyrics"/></p>
                            </div>
                            <div id="Graph">
                                <h1>~Figurative Language Content~</h1>
                                <svg xmlns="http://www.w3.org/2000/svg" height="500" width="800">
                                    <g transform="translate(0,500)">
                                        <line x1="50" y1="-50" x2="1600" y2="-50" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                            stroke-width="3"/>
                                        <text x="45" y="-50" text-anchor="end"> 0 </text>
                                        <text x="45" y="-250" text-anchor="end">
                                            <xsl:value-of select="$maximum div 2"/>
                                        </text>
                                        <text x="45" y="-450" text-anchor="end">
                                            <xsl:value-of select="$maximum"/>
                                        </text>
                                        <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                            stroke-width="3"/>
                                        <text x="{$horizontal + 50}" y="-30" text-anchor="middle"
                                            >Satire</text>
                                        <text x="{$horizontal2 + 50}" y="-30" text-anchor="middle"
                                            >Protest</text>
                                        <rect width="100" height="{$satire_pol div $max}" x="{$horizontal}"
                                            y="{-$satire_pol div $max - 50}" fill="blue"/>
                                        <rect width="100" height="{$satire_cult div $max}" x="{$horizontal}"
                                            y="{-$satire_cult div $max - ($satire_pol div $max) - 50}"
                                            fill="red"/>
                                        <rect width="100" height="{$satire_sym div $max}" x="{$horizontal}"
                                            y="{-$satire_sym div $max - ($satire_pol div $max) - ($satire_cult div $max) - 50}"
                                            fill="green"/>
                                        <rect width="100" height="{$satire_met div $max}" x="{$horizontal}"
                                            y="{-$satire_met div $max - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - 50}"
                                            fill="black"/>
                                        <rect width="100" height="{$satire_analogy div $max}"
                                            x="{$horizontal}"
                                            y="{-$satire_analogy div $max  - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - ($satire_met div $max) - 50}"
                                            fill="orange"/>
                                        <rect width="100" height="{$satire_exp div $max}" x="{$horizontal}"
                                            y="{-$satire_exp div $max - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - ($satire_met div $max) - ($satire_analogy div $max) - 50}"
                                            fill="purple"/>
                                        <rect width="100" height="{$satire_pun div $max}" x="{$horizontal}"
                                            y="{-$satire_pun div $max - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - ($satire_met div $max) - ($satire_analogy div $max) - ($satire_pun div $max) - 50}"
                                            fill="pink"/>
                                        <rect width="100" height="{$protest_pol div $max}"
                                            x="{$horizontal2}" y="{-$protest_pol div $max - 50}" fill="blue"/>
                                        <rect width="100" height="{$protest_cult div $max}"
                                            x="{$horizontal2}"
                                            y="{-$protest_cult div $max - ($protest_pol div $max) - 50}"
                                            fill="red"/>
                                        <rect width="100" height="{$protest_sym div $max}"
                                            x="{$horizontal2}"
                                            y="{-$protest_sym div $max - ($protest_pol div $max) - ($protest_cult div $max) - 50}"
                                            fill="green"/>
                                        <rect width="100" height="{$protest_met div $max}"
                                            x="{$horizontal2}"
                                            y="{-$protest_met div $max - ($protest_pol div $max) - ($protest_cult div $max) - ($protest_sym div $max) - 50}"
                                            fill="black"/>
                                        <rect width="100" height="{$protest_analogy div $max}"
                                            x="{$horizontal2}"
                                            y="{-$protest_analogy div $max - ($protest_pol div $max) - ($protest_cult div $max) - ($protest_sym div $max) - ($protest_met div $max) - 50}"
                                            fill="orange"/>
                                        <rect width="100" height="{$protest_exp div $max}"
                                            x="{$horizontal2}"
                                            y="{-$protest_exp div $max - ($protest_pol div $max) - ($protest_cult div $max) - ($protest_sym div $max) - ($protest_met div $max) - ($protest_analogy div $max) - 50}"
                                            fill="purple"/>
                                        <text x="250" y="15" text-anchor="middle" transform="rotate(-90)"
                                            >Number of occurences</text>
                                    </g>
                                    <text x="500" y="20" fill="black">Key:</text>
                                    <text x="500" y="40" fill="blue">Political Reference</text>
                                    <text x="500" y="60" fill="red">Cultural Reference</text>
                                    <text x="500" y="80" fill="green">Symbolism</text>
                                    <text x="500" y="100" fill="black">Metaphor</text>
                                    <text x="500" y="120" fill="orange">Analogy</text>
                                    <text x="500" y="140" fill="purple">Explicit</text>
                                    <text x="500" y="160" fill="pink">Pun</text>
                                </svg>
                            </div>
                        </section>
                        </body></html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="lyrics">
        <p><xsl:apply-templates select="verse"></xsl:apply-templates></p>
    </xsl:template>
    <xsl:template match="verse">
        <p><xsl:apply-templates select="l"></xsl:apply-templates></p>
    </xsl:template>
    <xsl:template match="l">
        <xsl:apply-templates></xsl:apply-templates><br></br>
    </xsl:template>

    <!-- <xsl:result-document href="../Website/analysis_test.xhtml">
                   
            
            
            
            
                <xsl:for-each select="collection('../XML/Lyrics')">
                    <p>
                   <xsl:value-of select = "count(//protest)"/>
                    </p>
                    <xsl:message select="count(//protest)"/>
                        
                </xsl:for-each>
        </xsl:result-document>-->

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
