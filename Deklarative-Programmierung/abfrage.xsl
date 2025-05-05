<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" />
    <xsl:template match="/rechnungen">
        <xsl:for-each select="rechnung[Brutto &lt; 1000]">
            <xsl:if test="boolean(leistungs-empfaenger) and boolean(leistungs-empfaenger/title)">
                <xsl:value-of select="leistungs-empfaenger/title" />
                <xsl:text> </xsl:text>
                <xsl:if test="boolean(leistungs-empfaenger/nachname)">
                    <xsl:value-of select="leistungs-empfaenger/vorname" />
                    <xsl:text> </xsl:text>
                </xsl:if>
                <xsl:value-of select="leistungs-empfaenger/nachname" />
                <xsl:text>.&#xA;Danke f&#x00FC;r die Zahlung von </xsl:text>
                <xsl:value-of select="Brutto" />
                <xsl:text> f&#x00FC;r die Rechnung vom </xsl:text>
                <xsl:value-of
                    select="number(substring(ausstellungsdatum, 9, 2))" />
                <xsl:text>. </xsl:text>
                <xsl:value-of
                    select="number(substring(ausstellungsdatum, 6, 2))" />
                <xsl:text>. </xsl:text>
                <xsl:value-of
                    select="number(substring(ausstellungsdatum, 1, 4))" />
                <xsl:text>.</xsl:text>
                <xsl:text>&#xA;Ich hoffe die </xsl:text>
                <xsl:value-of select="count(abrechnungs-positionen/abrechnung/abrechnungs-position)"></xsl:value-of>
                <xsl:text> Einzelposten sind zu Ihrer Zufriedenheit geliefert worden.&#xA;&#xA;</xsl:text>
            </xsl:if>
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>