<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="bar_width" select="20"/>
    <!--^^Width of the bars.-->
    <xsl:variable name="bar_space" select="$bar_width + 5"/>
    <!--^^Spacing between bars plus the bar itself. How far down the axis the bar has to be placed.-->
    <xsl:variable name="multiplier" select="25"/>
    <!--^^Makes bar heights visible.-->
    <xsl:variable name="x2_position" select="7*$bar_space+15"/>
    <!--^^Length of x-axis.-->
    <xsl:template match="/">
        <svg height="610" width="250">
            <g transform="translate(30, 500)">
                <line x1="12" x2="12" y1="0" y2="-450" stroke="black" stroke-width="1"/>
                <line x1="12" x2="{$x2_position}" y1="0" y2="0" stroke="black"
                    stroke-width="1"/>
                <text x="6" y="{-50}" text-anchor="end" font-size="14">2</text>
                <!--<text x="6" y="{-75}" text-anchor="end" font-size="14">3</text>-->
                <text x="6" y="{-100}" text-anchor="end" font-size="14">4</text>
                <!--<text x="6" y="{-125}" text-anchor="end" font-size="14">5</text>-->
                <text x="6" y="{-150}" text-anchor="end" font-size="14">6</text>
                <!--<text x="6" y="{-175}" text-anchor="end" font-size="14">7</text>-->
                <text x="6" y="{-200}" text-anchor="end" font-size="14">8</text>
                <!--<text x="6" y="{-225}" text-anchor="end" font-size="14">9</text>-->
                <text x="6" y="{-250}" text-anchor="end" font-size="14">10</text>
                <!--<text x="6" y="{-275}" text-anchor="end" font-size="14">11</text>-->
                <text x="6" y="{-300}" text-anchor="end" font-size="14">12</text>
                <!--<text x="6" y="{-325}" text-anchor="end" font-size="14">13</text>-->
                <text x="6" y="{-350}" text-anchor="end" font-size="14">14</text>
                <!--<text x="6" y="{-375}" text-anchor="end" font-size="14">15</text>-->
                <text x="6" y="{-400}" text-anchor="end" font-size="14">16</text>
                <!--<text x="6" y="{-425}" text-anchor="end" font-size="14">17</text>-->
                <text x="6" y="{-450}" text-anchor="end" font-size="14">18</text>
                <!--<text x="6" y="{-475}" text-anchor="end" font-size="14">19</text>
                <text x="6" y="{-500}" text-anchor="end" font-size="14">20</text>-->
                <line x1="8" x2="16" y1="-50" y2="-50" stroke="black"
                    stroke-width="1"/>
                <line x1="8" x2="16" y1="-100" y2="-100" stroke="black"
                    stroke-width="1"/>
                <line x1="8" x2="16" y1="-150" y2="-150" stroke="black"
                    stroke-width="1"/>
                <line x1="8" x2="16" y1="-200" y2="-200" stroke="black"
                    stroke-width="1"/>
                <line x1="8" x2="16" y1="-250" y2="-250" stroke="black"
                    stroke-width="1"/>
                <line x1="8" x2="16" y1="-300" y2="-300" stroke="black"
                    stroke-width="1"/>
                <line x1="8" x2="16" y1="-350" y2="-350" stroke="black"
                    stroke-width="1"/>
                <line x1="8" x2="16" y1="-400" y2="-400" stroke="black"
                    stroke-width="1"/>
                <line x1="8" x2="16" y1="-450" y2="-450" stroke="black"
                    stroke-width="1"/>
                <rect x="18" y="20" stroke="black" fill="white" stroke-width="0.5" width="125" height="80"/>
                <text x="25" y="30" text-anchor="start" font-size="10" fill="blue">"Change"</text>
                <text x="25" y="40" text-anchor="start" font-size="10" fill="cyan">"Hope"</text>
                <text x="25" y="50" text-anchor="start" font-size="10" fill="navy">"Community"</text>
                <text x="25" y="60" text-anchor="start" font-size="10" fill="aquamarine">"Protest"</text>
                <text x="25" y="70" text-anchor="start" font-size="10" fill="lightcyan">"Satire"</text>
                <text x="25" y="80" text-anchor="start" font-size="10" fill="royalblue">"Apathy/Disillusionment"</text>
                <text x="25" y="90" text-anchor="start" font-size="10" fill="powderblue">"Self"</text>
                <text x="{$x2_position div 2}" y="14" text-anchor="middle" font-size="14" fill="black">Elements Tagged</text>
                <text x="225" y="-10" text-anchor="middle" transform="rotate(-90)" font-size="14" fill="black"># of Appearance</text>
                <xsl:apply-templates select="//lyrics"/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="lyrics">
        <xsl:variable name="change" select="count(//change)"/>
        <xsl:variable name="hope" select="count(//hope)"/>
        <xsl:variable name="community" select="count(//community)"/>
        <xsl:variable name="protest" select="count(//protest)"/>
        <xsl:variable name="satire" select="count(//satire)"/>
        <xsl:variable name="apathy-DI" select="count(//apathy-DI)"/>
        <xsl:variable name="nature" select="count(//nature)"/>
        <xsl:variable name="self" select="count(//self)"/>
        <xsl:variable name="sum_elements" select="sum($change + $hope + $community + $protest + $satire + $apathy-DI + $nature + $self)"/>
        <xsl:variable name="change_perc" select="$change div $sum_elements"/>
        <xsl:variable name="hope_perc" select="$hope div $sum_elements"/>
        <xsl:variable name="community_perc" select="$community div $sum_elements"/>
        <xsl:variable name="protest_perc" select="$protest div $sum_elements"/>
        <xsl:variable name="satire_perc" select="$satire div $sum_elements"/>
        <xsl:variable name="apathy-DI_perc" select="$apathy-DI div $sum_elements"/>
        <xsl:variable name="nature_perc" select="$nature div $sum_elements"/>
        <xsl:variable name="self_perc" select="$self div $sum_elements"/>
        <rect x="25" y="-{$change * $multiplier}" stroke="black" fill="blue" stroke-width="0.5" width="{$bar_width}" height="{$change * $multiplier}"/>
        <rect x="50" y="-{$hope * $multiplier}" stroke="black" fill="cyan" stroke-width="0.5" width="{$bar_width}" height="{$hope * $multiplier}"/>
        <rect x="75" y="-{$community * $multiplier}" stroke="black" fill="navy" stroke-width="0.5" width="{$bar_width}" height="{$community * $multiplier}"/>
        <rect x="100" y="-{$protest * $multiplier}" stroke="black" fill="aquamarine" stroke-width="0.5" width="{$bar_width}" height="{$protest * $multiplier}"/>
        <rect x="125" y="-{$satire * $multiplier}" stroke="black" fill="lightcyan" stroke-width="0.5" width="{$bar_width}" height="{$satire * $multiplier}"/>
        <rect x="150" y="-{$apathy-DI * $multiplier}" stroke="black" fill="royalblue" stroke-width="0.5" width="{$bar_width}" height="{$apathy-DI * $multiplier}"/>
        <!--<rect x="175" y="-{$nature * $multiplier}" stroke="black" fill="lightblue" stroke-width="0.5" width="{$bar_width}" height="{$nature * $multiplier}"/>-->
        <rect x="175" y="-{$self * $multiplier}" stroke="black" fill="powderblue" stroke-width="0.5" width="{$bar_width}" height="{$self * $multiplier}"/>
    </xsl:template>
</xsl:stylesheet>