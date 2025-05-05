<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="rechnungen">

        <xsl:element name="rechnungen">

            <xsl:for-each select="rechnung[number(translate(ausstellungsdatum, '-', '')) > 20100000]">
                <xsl:copy>
                    <xsl:copy-of select="ausstellungsdatum" />

            <xsl:copy-of select="rechnungsnummer" />
            <xsl:copy-of
                        select="brutto" />
            <xsl:if
                        test="leistungs-empfaenger[starts-with(titel, 'Herr') or starts-with(titel, 'Frau')]">
                        <xsl:copy-of select="leistungs-empfaenger" />
                    </xsl:if>
            <xsl:apply-templates
                        select="abrechnungs-positionen" /> 
                </xsl:copy>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xsl:template match="abrechnungs-positionen">
        <xsl:copy>
            <xsl:for-each select="abrechnung">
                <xsl:copy>
                   
                        
                            <xsl:copy-of select="leistung" />
                            <xsl:copy-of select="gesamt-preis" />
                          

                        



                    
                    
                </xsl:copy>
            </xsl:for-each>
        </xsl:copy>

    </xsl:template>
</xsl:stylesheet>
