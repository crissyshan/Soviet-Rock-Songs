<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- ================================================================ -->
    <!-- Multiple input, single output                                    -->
    <!-- ================================================================ -->

    <xsl:template name="xsl:initial-template">
        
        <!-- Basic Variables -->
        <xsl:variable name="total-songs" select="count(collection('../XML/Lyrics'))"/>
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
        
        <!-- Protest -->
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
        <xsl:variable name="ep1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//protest[@type = 'explicit'])"/>
        <xsl:variable name="ep1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//protest[@type = 'explicit'])"/>
        <xsl:variable name="ep1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//protest[@type = 'explicit'])"/>
        <xsl:variable name="ep1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//protest[@type = 'explicit'])"/>
        <xsl:variable name="ep1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//protest[@type = 'explicit'])"/>
        <xsl:variable name="ep1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//protest[@type = 'explicit'])"/>
        <xsl:variable name="ep1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//protest[@type = 'explicit'])"/>
        <xsl:variable name="ep1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//protest[@type = 'explicit'])"/>
        <xsl:variable name="ep1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//protest[@type = 'explicit'])"/>
        <xsl:variable name="ep1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//protest[@type = 'explicit'])"/>
        <xsl:variable name="maximump"
            select="max(($p1980, $p1981, $p1982, $p1983, $p1984, $p1985, $p1986, $p1987, $p1988, $p1989))"/>
        
        <!-- Satire -->
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
            select="count(collection('../XML/Lyrics')[//year = 1986]//satire)"/>
        <xsl:variable name="s1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//satire)"/>
        <xsl:variable name="s1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//satire)"/>
        <xsl:variable name="s1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//satire)"/>
        <xsl:variable name="es1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//satire[@type = 'explicit'])"/>
        <xsl:variable name="es1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//satire[@type = 'explicit'])"/>
        <xsl:variable name="es1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//satire[@type = 'explicit'])"/>
        <xsl:variable name="es1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//satire[@type = 'explicit'])"/>
        <xsl:variable name="es1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//satire[@type = 'explicit'])"/>
        <xsl:variable name="es1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//satire[@type = 'explicit'])"/>
        <xsl:variable name="es1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//satire[@type = 'explicit'])"/>
        <xsl:variable name="es1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//satire[@type = 'explicit'])"/>
        <xsl:variable name="es1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//satire[@type = 'explicit'])"/>
        <xsl:variable name="es1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//satire[@type = 'explicit'])"/>
        <xsl:variable name="maximums"
            select="max(($s1980, $s1981, $s1982, $s1983, $s1984, $s1985, $s1986, $s1987, $s1988, $s1989))"/>
        
        <!-- Apathy vs Hope -->
        <xsl:variable name="h1980" select="count(collection('../XML/Lyrics')[//year = 1980]//hope)"/>
        <xsl:variable name="h1981" select="count(collection('../XML/Lyrics')[//year = 1981]//hope)"/>
        <xsl:variable name="h1982" select="count(collection('../XML/Lyrics')[//year = 1982]//hope)"/>
        <xsl:variable name="h1983" select="count(collection('../XML/Lyrics')[//year = 1983]//hope)"/>
        <xsl:variable name="h1984" select="count(collection('../XML/Lyrics')[//year = 1984]//hope)"/>
        <xsl:variable name="h1985" select="count(collection('../XML/Lyrics')[//year = 1985]//hope)"/>
        <xsl:variable name="h1986" select="count(collection('../XML/Lyrics')[//year = 1986]//hope)"/>
        <xsl:variable name="h1987" select="count(collection('../XML/Lyrics')[//year = 1987]//hope)"/>
        <xsl:variable name="h1988" select="count(collection('../XML/Lyrics')[//year = 1988]//hope)"/>
        <xsl:variable name="h1989" select="count(collection('../XML/Lyrics')[//year = 1989]//hope)"/>
        <xsl:variable name="maximumh"
            select="max(($h1980, $h1981, $h1982, $h1983, $h1984, $h1985, $h1986, $h1987, $h1988, $h1989))"/>
        <xsl:variable name="a1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//apathy-DI)"/>
        <xsl:variable name="a1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//apathy-DI)"/>
        <xsl:variable name="a1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//apathy-DI)"/>
        <xsl:variable name="a1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//apathy-DI)"/>
        <xsl:variable name="a1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//apathy-DI)"/>
        <xsl:variable name="a1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//apathy-DI)"/>
        <xsl:variable name="a1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//apathy-DI)"/>
        <xsl:variable name="a1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//apathy-DI)"/>
        <xsl:variable name="a1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//apathy-DI)"/>
        <xsl:variable name="a1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//apathy-DI)"/>
        <xsl:variable name="maximuma"
            select="max(($a1980, $a1981, $a1982, $a1983, $a1984, $a1985, $a1986, $a1987, $a1988, $a1989))"/>
        
        <!-- Change vs Time -->
        <xsl:variable name="c1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//change)"/>
        <xsl:variable name="c1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//change)"/>
        <xsl:variable name="c1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//change)"/>
        <xsl:variable name="c1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//change)"/>
        <xsl:variable name="c1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//change)"/>
        <xsl:variable name="c1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//change)"/>
        <xsl:variable name="c1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//change)"/>
        <xsl:variable name="c1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//change)"/>
        <xsl:variable name="c1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//change)"/>
        <xsl:variable name="c1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//change)"/>
        <xsl:variable name="maximumc"
            select="max(($c1980, $c1981, $c1982, $c1983, $c1984, $c1985, $c1986, $c1987, $c1988, $c1989))"/>
        <xsl:variable name="t1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//time)"/>
        <xsl:variable name="t1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//time)"/>
        <xsl:variable name="t1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//time)"/>
        <xsl:variable name="t1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//time)"/>
        <xsl:variable name="t1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//time)"/>
        <xsl:variable name="t1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//time)"/>
        <xsl:variable name="t1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//time)"/>
        <xsl:variable name="t1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//time)"/>
        <xsl:variable name="t1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//time)"/>
        <xsl:variable name="t1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//time)"/>
        <xsl:variable name="maximumt"
            select="max(($t1980, $t1981, $t1982, $t1983, $t1984, $t1985, $t1986, $t1987, $t1988, $t1989))"/>
        
        <!-- Substance counts-->
        <xsl:variable name="al1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//subst[@ref='alcohol'])"/>
        <xsl:variable name="al1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//subst[@ref='alcohol'])"/>
        <xsl:variable name="al1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//subst[@ref='alcohol'])"/>
        <xsl:variable name="al1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//subst[@ref='alcohol'])"/>
        <xsl:variable name="al1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//subst[@ref='alcohol'])"/>
        <xsl:variable name="al1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//subst[@ref='alcohol'])"/>
        <xsl:variable name="al1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//subst[@ref='alcohol'])"/>
        <xsl:variable name="al1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//subst[@ref='alcohol'])"/>
        <xsl:variable name="al1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//subst[@ref='alcohol'])"/>
        <xsl:variable name="al1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//subst[@ref='alcohol'])"/>
        <xsl:variable name="maximumal"
            select="max(($al1980, $al1981, $al1982, $al1983, $al1984, $al1985, $al1986, $al1987, $al1988, $al1989))"/>
        <xsl:variable name="cig1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//subst[@ref='tobacco'])"/>
        <xsl:variable name="cig1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//subst[@ref='tobacco'])"/>
        <xsl:variable name="cig1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//subst[@ref='tobacco'])"/>
        <xsl:variable name="cig1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//subst[@ref='tobacco'])"/>
        <xsl:variable name="cig1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//subst[@ref='tobacco'])"/>
        <xsl:variable name="cig1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//subst[@ref='tobacco'])"/>
        <xsl:variable name="cig1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//subst[@ref='tobacco'])"/>
        <xsl:variable name="cig1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//subst[@ref='tobacco'])"/>
        <xsl:variable name="cig1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//subst[@ref='tobacco'])"/>
        <xsl:variable name="cig1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//subst[@ref='tobacco'])"/>
        <xsl:variable name="maximumcig"
            select="max(($cig1980, $cig1981, $cig1982, $cig1983, $cig1984, $cig1985, $cig1986, $cig1987, $cig1988, $cig1989))"/>
        <xsl:variable name="d1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//subst[@ref='drug'])"/>
        <xsl:variable name="d1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//subst[@ref='drug'])"/>
        <xsl:variable name="d1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//subst[@ref='drug'])"/>
        <xsl:variable name="d1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//subst[@ref='drug'])"/>
        <xsl:variable name="d1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//subst[@ref='drug'])"/>
        <xsl:variable name="d1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//subst[@ref='drug'])"/>
        <xsl:variable name="d1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//subst[@ref='drug'])"/>
        <xsl:variable name="d1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//subst[@ref='drug'])"/>
        <xsl:variable name="d1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//subst[@ref='drug'])"/>
        <xsl:variable name="d1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//subst[@ref='drug'])"/>
        <xsl:variable name="maximumd"
            select="max(($d1980, $d1981, $d1982, $d1983, $d1984, $d1985, $d1986, $d1987, $d1988, $d1989))"/>
        
        <!-- Soviet Symbol counts-->
        <xsl:variable name="cos1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//nature[@ref='cosmos'])"/>
        <xsl:variable name="cos1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//nature[@ref='cosmos'])"/>
        <xsl:variable name="cos1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//nature[@ref='cosmos'])"/>
        <xsl:variable name="cos1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//nature[@ref='cosmos'])"/>
        <xsl:variable name="cos1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//nature[@ref='cosmos'])"/>
        <xsl:variable name="cos1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//nature[@ref='cosmos'])"/>
        <xsl:variable name="cos1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//nature[@ref='cosmos'])"/>
        <xsl:variable name="cos1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//nature[@ref='cosmos'])"/>
        <xsl:variable name="cos1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//nature[@ref='cosmos'])"/>
        <xsl:variable name="cos1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//nature[@ref='cosmos'])"/>
        <xsl:variable name="sym1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//soviet-symbol)"/>
        <xsl:variable name="sym1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//soviet-symbol)"/>
        <xsl:variable name="sym1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//soviet-symbol)"/>
        <xsl:variable name="sym1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//soviet-symbol)"/>
        <xsl:variable name="sym1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//soviet-symbol)"/>
        <xsl:variable name="sym1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//soviet-symbol)"/>
        <xsl:variable name="sym1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//soviet-symbol)"/>
        <xsl:variable name="sym1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//soviet-symbol)"/>
        <xsl:variable name="sym1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//soviet-symbol)"/>
        <xsl:variable name="sym1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//soviet-symbol)"/>
        <xsl:variable name="ind1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//industry)"/>
        <xsl:variable name="ind1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//industry)"/>
        <xsl:variable name="ind1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//industry)"/>
        <xsl:variable name="ind1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//industry)"/>
        <xsl:variable name="ind1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//industry)"/>
        <xsl:variable name="ind1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//industry)"/>
        <xsl:variable name="ind1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//industry)"/>
        <xsl:variable name="ind1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//industry)"/>
        <xsl:variable name="ind1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//industry)"/>
        <xsl:variable name="ind1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//industry)"/>
        <xsl:variable name="maximumsym"
            select="max(($sym1980, $sym1981, $sym1982, $sym1983, $sym1984, $sym1985, $sym1986, $sym1987, $sym1988, $sym1989, $ind1980, $ind1981, $ind1982, $ind1983, $ind1984, $ind1985, $ind1986, $ind1987, $ind1988, $ind1989, $cos1980, $cos1981, $cos1982, $cos1983, $cos1984, $cos1985, $cos1986, $cos1987, $cos1988, $cos1989))"/>
        
        <!-- Militarism counts-->
        <xsl:variable name="m1980"
            select="count(collection('../XML/Lyrics')[//year = 1980]//defense)"/>
        <xsl:variable name="m1981"
            select="count(collection('../XML/Lyrics')[//year = 1981]//defense)"/>
        <xsl:variable name="m1982"
            select="count(collection('../XML/Lyrics')[//year = 1982]//defense)"/>
        <xsl:variable name="m1983"
            select="count(collection('../XML/Lyrics')[//year = 1983]//defense)"/>
        <xsl:variable name="m1984"
            select="count(collection('../XML/Lyrics')[//year = 1984]//defense)"/>
        <xsl:variable name="m1985"
            select="count(collection('../XML/Lyrics')[//year = 1985]//defense)"/>
        <xsl:variable name="m1986"
            select="count(collection('../XML/Lyrics')[//year = 1986]//defense)"/>
        <xsl:variable name="m1987"
            select="count(collection('../XML/Lyrics')[//year = 1987]//defense)"/>
        <xsl:variable name="m1988"
            select="count(collection('../XML/Lyrics')[//year = 1988]//defense)"/>
        <xsl:variable name="m1989"
            select="count(collection('../XML/Lyrics')[//year = 1989]//defense)"/>
        <xsl:variable name="maximumm"
            select="max(($m1980, $m1981, $m1982, $m1983, $m1984, $m1985, $m1986, $m1987, $m1988, $m1989))"/>
        
        <xsl:result-document href="../Website/analysis.xhtml">
            <html>
                <head>
                    <title>Analysis</title>
                    <link rel="stylesheet" type="text/css" href="soviet-rock.css"/>
                </head>
                <body>
                    <div id="headerimg">
                        <img src="soviet-rock-banner.jpg"/>
                    </div>
                    <header>
                        <a href="index.xhtml" id="tab1">Home</a>
                        <a href="about.xhtml" id="tab2">About</a>
                        <a href="criteria.xhtml" id="tab3">Criteria</a>
                        <a href="lyrics.xhtml" id="tab4">Lyrics</a>
                        <a href="analysis.xhtml" id="tab5">Analysis</a>
                        <a href="conclusion.xhtml" id="tab6">Conclusion</a>
                        <a href="more.xhtml" id="tab7">More</a>
                    </header>
                    <section id="section1">
                        <div id="Welcome">
                            <h1>Analysis of Data</h1>
                        </div>
                        <div class="GraphA">
                            <h1>Frequency of Tagged Elements (hover for details)</h1>
                            <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                viewBox="0 0 1000 310" preserveAspectRatio="none">
                                <g transform="translate(800, 15)">
                                    <line x1="0" x2="-900" y1="10" y2="10" stroke="black"
                                        stroke-width="1"/>
                                    <line x1="0" x2="0" y1="10" y2="{$y2_position}" stroke="black"
                                        stroke-width="1"/>
                                    <text x="-{$y2_position div 2}" y="120" text-anchor="middle"
                                        transform="rotate(-90)" font-size="14" fill="black">Elements Tagged</text>
                                    <text x="-400" y="0" text-anchor="middle" font-size="14"
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
                                            ><title>Community (family, nation, religion, city, friends, etc.)</title></rect>
                                    <text x="5" y="60" text-anchor="start" font-size="10"
                                        fill="black">Community</text>
                                    <rect x="-{$protest * $multiplier}" y="72" stroke="black"
                                        fill="darkorange" stroke-width="0.5"
                                        width="{$protest * $multiplier}" height="{$bar_width}"
                                            ><title>protest type: explicit</title></rect>
                                    <rect x="-{$protest_symbol_sum * $multiplier}" y="72"
                                        stroke="black" fill="orange" stroke-width="0.5"
                                        width="{$protest_symbol_sum * $multiplier}"
                                        height="{$bar_width}"><title>protest type: symbolism</title></rect>
                                    <rect x="-{$protest_metaphor * $multiplier}" y="72"
                                        stroke="black" fill="coral" stroke-width="0.5"
                                        width="{$protest_metaphor * $multiplier}"
                                        height="{$bar_width}"><title>protest type:metaphor</title></rect>
                                    <text x="5" y="80" text-anchor="start" font-size="10"
                                        fill="black">Protest</text>
                                    <rect x="-{$satire * $multiplier}" y="92" stroke="black"
                                        fill="darkred" stroke-width="0.5"
                                        width="{$satire * $multiplier}" height="{$bar_width}"
                                            ><title>satire type: cultural reference</title></rect>
                                    <rect x="-{$satire_mid_sum * $multiplier}" y="92" stroke="black"
                                        fill="red" stroke-width="0.5"
                                        width="{$satire_mid_sum * $multiplier}"
                                        height="{$bar_width}"><title>satire type:explicit</title></rect>
                                    <rect x="-{$satire_political * $multiplier}" y="92"
                                        stroke="black" fill="tomato" stroke-width="0.5"
                                        width="{$satire_political * $multiplier}"
                                        height="{$bar_width}"><title>satire type: political reference</title></rect>
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
                                            ><title>Nature (geography, environment, natural resources, etc.) </title></rect>
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
                                        height="{$bar_width}"><title>attribute:honesty</title></rect>
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
                                        height="{$bar_width}"><title>attribute: memory</title></rect>
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
                                        height="{$bar_width}"><title>absurdism level:high</title></rect>
                                    <text x="5" y="180" text-anchor="start" font-size="10"
                                        fill="black">Absurdism</text>
                                    <rect x="-{$industry * $multiplier}" y="192" stroke="black"
                                        fill="gray" stroke-width="0.5"
                                        width="{$industry * $multiplier}" height="{$bar_width}"
                                            ><title>Indsutry (technology, labor, infrastructure, innovation, etc.)</title></rect>
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
                                            ><title>Defense (violence, militarism, protection, etc.)</title></rect>
                                    <text x="5" y="240" text-anchor="start" font-size="10"
                                        fill="black">Defense</text>
                                    <rect x="-{$subst * $multiplier}" y="252" stroke="black"
                                        fill="navy" stroke-width="0.5"
                                        width="{$subst * $multiplier}" height="{$bar_width}"
                                            ><title>Substances (drug and alcohol references, etc.)</title></rect>
                                    <text x="5" y="260" text-anchor="start" font-size="10"
                                        fill="black">Substance</text>
                                    <rect x="-{$time * $multiplier}" y="272" stroke="black"
                                        fill="green" stroke-width="0.5"
                                        width="{$time * $multiplier}" height="{$bar_width}"
                                            ><title>Time (future, passage of time, past, waiting, etc.)</title></rect>
                                    <text x="5" y="280" text-anchor="start" font-size="10"
                                        fill="black">Time</text>
                                </g>
                            </svg>
                        </div>
                        <div class="GraphComp"><div class="Graph">
                                <h1>References to Hope vs Apathy and Disillusionment Over Time</h1>
                                <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                    viewBox="0 0 600 500" preserveAspectRatio="none">
                                    <!-- Line Graph for Hope/Apathy-Disillusionment -->
                                    <g transform="translate(0, 500)">
                                        <line x1="50" y1="-50" x2="1600" y2="-50" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <xsl:variable name="maximumah"
                                            select="max(($maximuma, $maximumh))"/>
                                        <text x="50" y="44" text-anchor="middle"
                                            transform="rotate(-90)"> 0 </text>
                                        <text x="150" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumah div 4"/>
                                        </text>
                                        <text x="350" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumah * 0.75"/>
                                        </text>
                                        <text x="250" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumah div 2"/>
                                        </text>
                                        <text x="450" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumah"/>
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
                                        <line x1="46" x2="53" y1="-150" y2="-150" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-350" y2="-350" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                            stroke-width="3"/>
                                        <polyline fill="none" stroke="purple" stroke-width="3"
                                            points="
                                        100, {-400*($a1980 div $maximumah) - 50}
                                        150, {-400*($a1981 div $maximumah) - 50}
                                        200, {-400*($a1982 div $maximumah) - 50}
                                        250, {-400*($a1983 div $maximumah) - 50}
                                        300, {-400*($a1984 div $maximumah) - 50}
                                        350, {-400*($a1985 div $maximumah) - 50}
                                        400, {-400*($a1986 div $maximumah) - 50}
                                        450, {-400*($a1987 div $maximumah) - 50}
                                        500, {-400*($a1988 div $maximumah) - 50}
                                        550, {-400*($a1989 div $maximumah) - 50}"/>
                                        <polyline fill="none" stroke="green" stroke-width="3"
                                            points="
                                        100, {-400*($h1980 div $maximumah) - 50}
                                        150, {-400*($h1981 div $maximumah) - 50}
                                        200, {-400*($h1982 div $maximumah) - 50}
                                        250, {-400*($h1983 div $maximumah) - 50}
                                        300, {-400*($h1984 div $maximumah) - 50}
                                        350, {-400*($h1985 div $maximumah) - 50}
                                        400, {-400*($h1986 div $maximumah) - 50}
                                        450, {-400*($h1987 div $maximumah) - 50}
                                        500, {-400*($h1988 div $maximumah) - 50}
                                        550, {-400*($h1989 div $maximumah) - 50}"
                                        />
                                    </g>
                                    <text x="450" y="20" fill="black">Key:</text>
                                    <text x="450" y="40" fill="Purple">Apathy/DI</text>
                                    <text x="450" y="60" fill="Green">Hope</text>
                                </svg>
                            </div>
                            <div class="Graph">
                                <h1>References to Time vs References to Change Over Time</h1>
                                <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                    viewBox="0 0 600 500" preserveAspectRatio="none">
                                    <!-- Line Graph for Time vs Change -->
                                    <g transform="translate(0, 500)">
                                        <line x1="50" y1="-50" x2="1600" y2="-50" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <xsl:variable name="maximumtc"
                                            select="max(($maximumt, $maximumc))"/>
                                        <text x="50" y="44" text-anchor="middle"
                                            transform="rotate(-90)"> 0 </text>
                                        <text x="150" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumtc div 4"/>
                                        </text>
                                        <text x="350" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumtc * 0.75"/>
                                        </text>
                                        <text x="250" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumtc div 2"/>
                                        </text>
                                        <text x="450" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumtc"/>
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
                                        <line x1="46" x2="53" y1="-150" y2="-150" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-350" y2="-350" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                            stroke-width="3"/>
                                        <polyline fill="none" stroke="teal" stroke-width="3"
                                            points="
                                        100, {-400*($t1980 div $maximumtc) - 50}
                                        150, {-400*($t1981 div $maximumtc) - 50}
                                        200, {-400*($t1982 div $maximumtc) - 50}
                                        250, {-400*($t1983 div $maximumtc) - 50}
                                        300, {-400*($t1984 div $maximumtc) - 50}
                                        350, {-400*($t1985 div $maximumtc) - 50}
                                        400, {-400*($t1986 div $maximumtc) - 50}
                                        450, {-400*($t1987 div $maximumtc) - 50}
                                        500, {-400*($t1988 div $maximumtc) - 50}
                                        550, {-400*($t1989 div $maximumtc) - 50}"/>
                                        <polyline fill="none" stroke="magenta" stroke-width="3"
                                            points="
                                        100, {-400*($c1980 div $maximumtc) - 50}
                                        150, {-400*($c1981 div $maximumtc) - 50}
                                        200, {-400*($c1982 div $maximumtc) - 50}
                                        250, {-400*($c1983 div $maximumtc) - 50}
                                        300, {-400*($c1984 div $maximumtc) - 50}
                                        350, {-400*($c1985 div $maximumtc) - 50}
                                        400, {-400*($c1986 div $maximumtc) - 50}
                                        450, {-400*($c1987 div $maximumtc) - 50}
                                        500, {-400*($c1988 div $maximumtc) - 50}
                                        550, {-400*($c1989 div $maximumtc) - 50}"
                                        />
                                    </g>
                                    <text x="450" y="20" fill="black">Key:</text>
                                    <text x="450" y="40" fill="teal">Time</text>
                                    <text x="450" y="60" fill="magenta">Change</text>
                                </svg>
                            </div></div> <div class="GraphComp"><div class="Graph">
                                <h1>Frequency of Protest References Over Time</h1>
                                <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                    viewBox="0 0 600 500" preserveAspectRatio="none">
                                    <!-- Line Graph for Protest -->
                                    <g transform="translate(0, 500)">
                                        <line x1="50" y1="-50" x2="1600" y2="-50" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <text x="50" y="44" text-anchor="middle"
                                            transform="rotate(-90)"> 0 </text>
                                        <text x="150" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximump div 4"/>
                                        </text>
                                        <text x="350" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximump * 0.75"/>
                                        </text>
                                        <text x="250" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximump div 2"/>
                                        </text>
                                        <text x="450" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
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
                                        <line x1="46" x2="53" y1="-150" y2="-150" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-350" y2="-350" stroke="black"
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
                                        <polyline fill="none" stroke="darkred" stroke-width="3"
                                            points="
                                            100, {-400*($ep1980 div $maximump) - 50}
                                            150, {-400*($ep1981 div $maximump) - 50}
                                            200, {-400*($ep1982 div $maximump) - 50}
                                            250, {-400*($ep1983 div $maximump) - 50}
                                            300, {-400*($ep1984 div $maximump) - 50}
                                            350, {-400*($ep1985 div $maximump) - 50}
                                            400, {-400*($ep1986 div $maximump) - 50}
                                            450, {-400*($ep1987 div $maximump) - 50}
                                            500, {-400*($ep1988 div $maximump) - 50}
                                            550, {-400*($ep1989 div $maximump) - 50}"
                                        />
                                    </g>
                                    <text x="450" y="20" fill="black">Key:</text>
                                    <text x="450" y="40" fill="red">Protest: All</text>
                                    <text x="450" y="60" fill="darkred">Protest: Explicit</text>
                                </svg>
                            </div>
                            <div class="Graph">
                                <h1>Frequency of Satirical References Over Time</h1>
                                <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                    viewBox="0 0 600 500" preserveAspectRatio="none">
                                    <!-- Line Graph for Satire -->
                                    <g transform="translate(0, 500)">
                                        <line x1="50" y1="-50" x2="1600" y2="-50" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <text x="50" y="44" text-anchor="middle"
                                            transform="rotate(-90)"> 0 </text>
                                        <text x="150" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximums div 4"/>
                                        </text>
                                        <text x="350" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximums * 0.75"/>
                                        </text>
                                        <text x="250" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximums div 2"/>
                                        </text>
                                        <text x="450" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
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
                                        <line x1="46" x2="53" y1="-150" y2="-150" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-350" y2="-350" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                            stroke-width="3"/>
                                        <polyline fill="none" stroke="royalblue" stroke-width="3"
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
                                        <polyline fill="none" stroke="purple" stroke-width="3"
                                            points="
                                            100, {-400*($es1980 div $maximums) - 50}
                                            150, {-400*($es1981 div $maximums) - 50}
                                            200, {-400*($es1982 div $maximums) - 50}
                                            250, {-400*($es1983 div $maximums) - 50}
                                            300, {-400*($es1984 div $maximums) - 50}
                                            350, {-400*($es1985 div $maximums) - 50}
                                            400, {-400*($es1986 div $maximums) - 50}
                                            450, {-400*($es1987 div $maximums) - 50}
                                            500, {-400*($es1988 div $maximums) - 50}
                                            550, {-400*($es1989 div $maximums) - 50}"
                                        />
                                    </g>
                                    <text x="450" y="20" fill="black">Key:</text>
                                    <text x="450" y="40" fill="royalblue">Satire: All</text>
                                    <text x="450" y="60" fill="purple">Satire: Explicit</text>
                                </svg>
                            </div></div>
                            
                            <div class="GraphComp"><div class="Graph">
                                <h1>Frequency of Soviet Symbols Over Time</h1>
                                <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                    viewBox="0 0 600 500" preserveAspectRatio="none">
                                    <!-- Line Graph for Symbols -->
                                    <g transform="translate(0, 500)">
                                        <line x1="50" y1="-50" x2="1600" y2="-50" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <text x="50" y="44" text-anchor="middle"
                                            transform="rotate(-90)"> 0 </text>
                                        <text x="150" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumsym div 4"/>
                                        </text>
                                        <text x="350" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumsym * 0.75"/>
                                        </text>
                                        <text x="250" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumsym div 2"/>
                                        </text>
                                        <text x="450" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumsym"/>
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
                                        <line x1="46" x2="53" y1="-150" y2="-150" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-350" y2="-350" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                            stroke-width="3"/>
                                        <polyline fill="none" stroke="darkblue" stroke-width="3"
                                            points="
                                            100, {-400*($cos1980 div $maximumsym) - 50}
                                            150, {-400*($cos1981 div $maximumsym) - 50}
                                            200, {-400*($cos1982 div $maximumsym) - 50}
                                            250, {-400*($cos1983 div $maximumsym) - 50}
                                            300, {-400*($cos1984 div $maximumsym) - 50}
                                            350, {-400*($cos1985 div $maximumsym) - 50}
                                            400, {-400*($cos1986 div $maximumsym) - 50}
                                            450, {-400*($cos1987 div $maximumsym) - 50}
                                            500, {-400*($cos1988 div $maximumsym) - 50}
                                            550, {-400*($cos1989 div $maximumsym) - 50}"
                                        />
                                        <polyline fill="none" stroke="red" stroke-width="3"
                                            points="
                                            100, {-400*($sym1980 div $maximumsym) - 50}
                                            150, {-400*($sym1981 div $maximumsym) - 50}
                                            200, {-400*($sym1982 div $maximumsym) - 50}
                                            250, {-400*($sym1983 div $maximumsym) - 50}
                                            300, {-400*($sym1984 div $maximumsym) - 50}
                                            350, {-400*($sym1985 div $maximumsym) - 50}
                                            400, {-400*($sym1986 div $maximumsym) - 50}
                                            450, {-400*($sym1987 div $maximumsym) - 50}
                                            500, {-400*($sym1988 div $maximumsym) - 50}
                                            550, {-400*($sym1989 div $maximumsym) - 50}"
                                        />
                                        <polyline fill="none" stroke="brown" stroke-width="3"
                                            points="
                                            100, {-400*($ind1980 div $maximumsym) - 50}
                                            150, {-400*($ind1981 div $maximumsym) - 50}
                                            200, {-400*($ind1982 div $maximumsym) - 50}
                                            250, {-400*($ind1983 div $maximumsym) - 50}
                                            300, {-400*($ind1984 div $maximumsym) - 50}
                                            350, {-400*($ind1985 div $maximumsym) - 50}
                                            400, {-400*($ind1986 div $maximumsym) - 50}
                                            450, {-400*($ind1987 div $maximumsym) - 50}
                                            500, {-400*($ind1988 div $maximumsym) - 50}
                                            550, {-400*($ind1989 div $maximumsym) - 50}"
                                        />
                                    </g>
                                    <text x="450" y="20" fill="black">Key:</text>
                                    <text x="450" y="40" fill="red">Soviet Symbols</text>
                                    <text x="450" y="60" fill="darkblue">Cosmos</text>
                                    <text x="450" y="80" fill="brown">Industry</text>
                                </svg>
                            </div>
                                <div class="Graph">
                                    <h1>Militarism Over Time</h1>
                                    <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                        viewBox="0 0 600 500" preserveAspectRatio="none">
                                        <!-- Line Graph for Satire -->
                                        <g transform="translate(0, 500)">
                                            <line x1="50" y1="-50" x2="1600" y2="-50" stroke="black"
                                                stroke-width="3" stroke-linecap="round"/>
                                            <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                                stroke-width="3" stroke-linecap="round"/>
                                            <text x="50" y="44" text-anchor="middle"
                                                transform="rotate(-90)"> 0 </text>
                                            <text x="150" y="44" text-anchor="middle"
                                                transform="rotate(-90)">
                                                <xsl:value-of select="$maximumm div 4"/>
                                            </text>
                                            <text x="350" y="44" text-anchor="middle"
                                                transform="rotate(-90)">
                                                <xsl:value-of select="$maximumm * 0.75"/>
                                            </text>
                                            <text x="250" y="44" text-anchor="middle"
                                                transform="rotate(-90)">
                                                <xsl:value-of select="$maximumm div 2"/>
                                            </text>
                                            <text x="450" y="44" text-anchor="middle"
                                                transform="rotate(-90)">
                                                <xsl:value-of select="$maximumm"/>
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
                                            <line x1="46" x2="53" y1="-150" y2="-150" stroke="black"
                                                stroke-width="3"/>
                                            <line x1="46" x2="53" y1="-350" y2="-350" stroke="black"
                                                stroke-width="3"/>
                                            <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                                stroke-width="3"/>
                                            <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                                stroke-width="3"/>
                                            <polyline fill="none" stroke="green" stroke-width="3"
                                                points="
                                                100, {-400*($m1980 div $maximumm) - 50}
                                                150, {-400*($m1981 div $maximumm) - 50}
                                                200, {-400*($m1982 div $maximumm) - 50}
                                                250, {-400*($m1983 div $maximumm) - 50}
                                                300, {-400*($m1984 div $maximumm) - 50}
                                                350, {-400*($m1985 div $maximumm) - 50}
                                                400, {-400*($m1986 div $maximumm) - 50}
                                                450, {-400*($m1987 div $maximumm) - 50}
                                                500, {-400*($m1988 div $maximumm) - 50}
                                                550, {-400*($m1989 div $maximumm) - 50}"
                                            />
                                        </g>
                                    </svg>
                                </div></div>
                            <div class="GraphComp"><div class="Graph">
                                <h1>Substance References Over Time</h1>
                                <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                    viewBox="0 0 600 500" preserveAspectRatio="none">
                                    <!-- Line Graph for Protest -->
                                    <g transform="translate(0, 500)">
                                        <line x1="50" y1="-50" x2="1600" y2="-50" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <text x="50" y="44" text-anchor="middle"
                                            transform="rotate(-90)"> 0 </text>
                                        <text x="150" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumal div 4"/>
                                        </text>
                                        <text x="350" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumal * 0.75"/>
                                        </text>
                                        <text x="250" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumal div 2"/>
                                        </text>
                                        <text x="450" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximumal"/>
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
                                        <line x1="46" x2="53" y1="-150" y2="-150" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-350" y2="-350" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                            stroke-width="3"/>
                                        <polyline fill="none" stroke="firebrick" stroke-width="3"
                                            points="
                                            100, {-400*($al1980 div $maximumal) - 50}
                                            150, {-400*($al1981 div $maximumal) - 50}
                                            200, {-400*($al1982 div $maximumal) - 50}
                                            250, {-400*($al1983 div $maximumal) - 50}
                                            300, {-400*($al1984 div $maximumal) - 50}
                                            350, {-400*($al1985 div $maximumal) - 50}
                                            400, {-400*($al1986 div $maximumal) - 50}
                                            450, {-400*($al1987 div $maximumal) - 50}
                                            500, {-400*($al1988 div $maximumal) - 50}
                                            550, {-400*($al1989 div $maximumal) - 50}"
                                        />
                                        <polyline fill="none" stroke="green" stroke-width="3"
                                            points="
                                            100, {-400*($cig1980 div $maximumal) - 50}
                                            150, {-400*($cig1981 div $maximumal) - 50}
                                            200, {-400*($cig1982 div $maximumal) - 50}
                                            250, {-400*($cig1983 div $maximumal) - 50}
                                            300, {-400*($cig1984 div $maximumal) - 50}
                                            350, {-400*($cig1985 div $maximumal) - 50}
                                            400, {-400*($cig1986 div $maximumal) - 50}
                                            450, {-400*($cig1987 div $maximumal) - 50}
                                            500, {-400*($cig1988 div $maximumal) - 50}
                                            550, {-400*($cig1989 div $maximumal) - 50}"
                                        />
                                        <polyline fill="none" stroke="blue" stroke-width="3"
                                            points="
                                            100, {-400*($d1980 div $maximumal) - 50}
                                            150, {-400*($d1981 div $maximumal) - 50}
                                            200, {-400*($d1982 div $maximumal) - 50}
                                            250, {-400*($d1983 div $maximumal) - 50}
                                            300, {-400*($d1984 div $maximumal) - 50}
                                            350, {-400*($d1985 div $maximumal) - 50}
                                            400, {-400*($d1986 div $maximumal) - 50}
                                            450, {-400*($d1987 div $maximumal) - 50}
                                            500, {-400*($d1988 div $maximumal) - 50}
                                            550, {-400*($d1989 div $maximumal) - 50}"
                                        />
                                    </g>
                                    <text x="450" y="20" fill="black">Key:</text>
                                    <text x="450" y="40" fill="firebrick">Alcohol</text>
                                    <text x="450" y="60" fill="green">Tobacco</text>
                                    <text x="450" y="80" fill="blue">Other drugs</text>
                                </svg>
                            </div>
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
            <xsl:variable name="maximum" select="max(($maximums, $maximump, 1))"/>
            <!-- Sets maximum for vertical scale -->
            <xsl:variable name="max" select="max(($maximums, $maximump, 1)) div 400"/>
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
                        <link rel="stylesheet" type="text/css" href="../soviet-rock.css"/>
                    </head>
                    <body>
                        <div id="headerimg">
                            <img src="../soviet-rock-banner.jpg"/>
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
                                    <a href="ne-strelyai.xhtml">Не стреляй!</a>
                                    <a href="povorot.xhtml">Поворот</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab12">1981</button>
                                <div class="dropdown-content">
                                    <a href="skachki.xhtml">Скачки</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab13">1982</button>
                                <div class="dropdown-content">
                                    <a href="prosti-zemlya.xhtml">Прости Земля!</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab14">1983</button>
                                <div class="dropdown-content">
                                    <a href="kamchatka.xhtml">Камчатка</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab15">1984</button>
                                <div class="dropdown-content">
                                    <a href="storozh_sergeev.xhtml">Сторож Сергеев</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab16">1985</button>
                                <div class="dropdown-content">
                                    <a href="komarovo.xhtml">Комарово</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab17">1986</button>
                                <div class="dropdown-content">
                                    <a href="v_dobriy_chas.xhtml">В добрый час</a>
                                    <a href="vladimirskaya-rus.xhtml">Владимирская русь</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab18">1987</button>
                                <div class="dropdown-content">
                                    <a href="listya.xhtml">Листья</a>
                                    <a href="shar_tsveta.xhtml">Шар цвета хаки</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab19">1988</button>
                                <div class="dropdown-content"> </div>
                            </div>
                            <div class="dropdown">
                                <button id="tab20">1989</button>
                                <div class="dropdown-content"> </div>
                            </div>
                        </header>
                        <section id="section0">
                            <div id="Lyrics">
                                <h1>~<xsl:value-of select="//title"/>~</h1>
                                <h2><xsl:value-of select="//artist"/>, <xsl:value-of select="//year"
                                    /></h2>
                                <p><xsl:apply-templates select="//lyrics"/></p>
                                <div id="Video">
                                    <h1>Video</h1>
                                    <xsl:apply-templates select="//video"/>
                                </div>
                            </div>
                            <div class="Graph">
                                <h1>~Figurative Language Content~</h1>
                                <h2>Protest vs Satire</h2>
                                <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                    viewBox="0 0 675 500" preserveAspectRatio="none">
                                    <g transform="translate(0,500)">
                                        <line x1="50" y1="-50" x2="450" y2="-50" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <text x="50" y="44" text-anchor="middle"
                                            transform="rotate(-90)"> 0 </text>
                                        <text x="150" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum div 4"/>
                                        </text>
                                        <text x="350" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum * .75"/>
                                        </text>
                                        <text x="250" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum div 2"/>
                                        </text>
                                        <text x="450" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum"/>
                                        </text>
                                        <line x1="46" x2="53" y1="-150" y2="-150" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-350" y2="-350" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                            stroke-width="3"/>
                                        <text x="{$horizontal + 50}" y="-30" text-anchor="middle"
                                            >Satire</text>
                                        <text x="{$horizontal2 + 50}" y="-30" text-anchor="middle"
                                            >Protest</text>
                                        <rect width="100" height="{$satire_pol div $max}"
                                            x="{$horizontal}" y="{-$satire_pol div $max - 50}"
                                            fill="blue"/>
                                        <rect width="100" height="{$satire_cult div $max}"
                                            x="{$horizontal}"
                                            y="{-$satire_cult div $max - ($satire_pol div $max) - 50}"
                                            fill="red"/>
                                        <rect width="100" height="{$satire_sym div $max}"
                                            x="{$horizontal}"
                                            y="{-$satire_sym div $max - ($satire_pol div $max) - ($satire_cult div $max) - 50}"
                                            fill="green"/>
                                        <rect width="100" height="{$satire_met div $max}"
                                            x="{$horizontal}"
                                            y="{-$satire_met div $max - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - 50}"
                                            fill="black"/>
                                        <rect width="100" height="{$satire_analogy div $max}"
                                            x="{$horizontal}"
                                            y="{-$satire_analogy div $max  - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - ($satire_met div $max) - 50}"
                                            fill="brown"/>
                                        <rect width="100" height="{$satire_exp div $max}"
                                            x="{$horizontal}"
                                            y="{-$satire_exp div $max - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - ($satire_met div $max) - ($satire_analogy div $max) - 50}"
                                            fill="purple"/>
                                        <rect width="100" height="{$satire_pun div $max}"
                                            x="{$horizontal}"
                                            y="{-$satire_pun div $max - ($satire_pol div $max) - ($satire_cult div $max) - ($satire_sym div $max) - ($satire_met div $max) - ($satire_analogy div $max) - ($satire_pun div $max) - 50}"
                                            fill="magenta"/>
                                        <rect width="100" height="{$protest_pol div $max}"
                                            x="{$horizontal2}" y="{-$protest_pol div $max - 50}"
                                            fill="blue"/>
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
                                        <text x="250" y="20" text-anchor="middle"
                                            transform="rotate(-90)">Number of occurences</text>
                                    </g>
                                    <text x="450" y="20" fill="black">Key:</text>
                                    <text x="450" y="40" fill="blue">Political Reference</text>
                                    <text x="450" y="60" fill="red">Cultural Reference</text>
                                    <text x="450" y="80" fill="green">Symbolism</text>
                                    <text x="450" y="100" fill="black">Metaphor</text>
                                    <text x="450" y="120" fill="brown">Analogy</text>
                                    <text x="450" y="140" fill="purple">Explicit</text>
                                    <text x="450" y="160" fill="magenta">Pun</text>
                                </svg>
                                <xsl:variable name="maximum_graph2"
                                    select="max(($maximumh, $maximuma, 1))"/>
                                <xsl:variable name="max_graph2"
                                    select="max(($maximumh, $maximuma, 1)) div 400"/>
                                <xsl:variable name="apathy-DI_graph2" select="count(//apathy-DI)"/>
                                <xsl:variable name="hope_graph2" select="count(//hope)"/>
                                <h2>Apathy/Disillusionment vs Hope</h2>
                                <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                    viewBox="0 0 675 500" preserveAspectRatio="none">
                                    <g transform="translate(0,500)">
                                        <line x1="50" y1="-50" x2="450" y2="-50" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <text x="50" y="44" text-anchor="middle"
                                            transform="rotate(-90)"> 0 </text>
                                        <text x="150" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum_graph2 div 4"/>
                                        </text>
                                        <text x="350" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum_graph2 * .75"/>
                                        </text>
                                        <text x="250" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum_graph2 div 2"/>
                                        </text>
                                        <text x="450" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum_graph2"/>
                                        </text>
                                        <line x1="46" x2="53" y1="-150" y2="-150" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-350" y2="-350" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                            stroke-width="3"/>
                                        <text x="{$horizontal + 50}" y="-30" text-anchor="middle"
                                            >Apathy/Disillusionment</text>
                                        <text x="{$horizontal2 + 50}" y="-30" text-anchor="middle"
                                            >Hope</text>
                                        <rect width="100"
                                            height="{$apathy-DI_graph2 div $max_graph2}"
                                            x="{$horizontal}"
                                            y="{-$apathy-DI_graph2 div $max_graph2 - 50}"
                                            fill="blue"><title>Apathy/Disillusionment</title></rect>
                                        <rect width="100" height="{$hope_graph2 div $max_graph2}"
                                            x="{$horizontal2}"
                                            y="{-$hope_graph2 div $max_graph2 - 50}" fill="red"
                                                ><title>Hope</title></rect>
                                        <text x="250" y="20" text-anchor="middle"
                                            transform="rotate(-90)">Number of occurences</text>
                                    </g>
                                    <text x="450" y="20" fill="black">Key:</text>
                                    <text x="450" y="40" fill="Blue">Apathy/Disillusionment</text>
                                    <text x="450" y="60" fill="red">Hope</text>
                                </svg>
                                <xsl:variable name="maximum_graph3"
                                    select="max(($maximumc, $maximumt, 1))"/>
                                <xsl:variable name="max_graph3"
                                    select="max(($maximumc, $maximumt, 1)) div 400"/>
                                <xsl:variable name="change_graph3" select="count(//change)"/>
                                <xsl:variable name="time_graph3" select="count(//time)"/>
                                <h2>Change and Time</h2>
                                <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%"
                                    viewBox="0 0 675 500" preserveAspectRatio="none">
                                    <g transform="translate(0,500)">
                                        <line x1="50" y1="-50" x2="450" y2="-50" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <line x1="50" y1="-50" x2="50" y2="-580" stroke="black"
                                            stroke-width="3" stroke-linecap="round"/>
                                        <text x="50" y="44" text-anchor="middle"
                                            transform="rotate(-90)"> 0 </text>
                                        <text x="150" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum_graph3 div 4"/>
                                        </text>
                                        <text x="350" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum_graph3 * .75"/>
                                        </text>
                                        <text x="250" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum_graph3 div 2"/>
                                        </text>
                                        <text x="450" y="44" text-anchor="middle"
                                            transform="rotate(-90)">
                                            <xsl:value-of select="$maximum_graph3"/>
                                        </text>
                                        <line x1="46" x2="53" y1="-150" y2="-150" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-350" y2="-350" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-250" y2="-250" stroke="black"
                                            stroke-width="3"/>
                                        <line x1="46" x2="53" y1="-450" y2="-450" stroke="black"
                                            stroke-width="3"/>
                                        <text x="{$horizontal + 50}" y="-30" text-anchor="middle"
                                            >Change</text>
                                        <text x="{$horizontal2 + 50}" y="-30" text-anchor="middle"
                                            >Time</text>
                                        <rect width="100" height="{$change_graph3 div $max_graph3}"
                                            x="{$horizontal}"
                                            y="{-$change_graph3 div $max_graph3 - 50}" fill="red"
                                                ><title>Change</title></rect>
                                        <rect width="100" height="{$time_graph3 div $max_graph3}"
                                            x="{$horizontal2}"
                                            y="{-$time_graph3 div $max_graph3 - 50}" fill="blue"
                                                ><title>Time</title></rect>
                                        <text x="250" y="20" text-anchor="middle"
                                            transform="rotate(-90)">Number of occurences</text>
                                    </g>
                                    <text x="450" y="20" fill="black">Key:</text>
                                    <text x="450" y="40" fill="red">Change</text>
                                    <text x="450" y="60" fill="blue">Time</text>
                                </svg>
                            </div>
                        </section>
                    </body></html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="lyrics">
        <p>
            <xsl:apply-templates select="verse"/>
        </p>
    </xsl:template>
    <xsl:template match="verse">
        <p>
            <xsl:apply-templates select="l"/>
        </p>
    </xsl:template>
    <xsl:template match="l">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    <xsl:template match="video">
        <iframe width="420" height="315" src="{.}"> </iframe>
    </xsl:template>
</xsl:stylesheet>
