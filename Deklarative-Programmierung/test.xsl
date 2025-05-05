<!-- Zweite XSL-Transformation -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" />

  <!-- Vorlage für die Rechnungen mit Gesamtbruttobetrag < 1000 und Anrede -->
  <xsl:template match="rechnung[number(brutto) &lt; 1000 and leistungs-empfaenger/titel]">
    <!-- ANREDE NAME. -->
    <xsl:value-of select="leistungs-empfaenger/titel" />
    <xsl:text> </xsl:text>
    <xsl:value-of select="leistungs-empfaenger/name" />
    <xsl:text>.</xsl:text>
    <xsl:text>&#10;</xsl:text>
    
    <!-- Danke für die Zahlung von GESAMTBETRAG für die Rechnung vom AUSTELLUNGSDATUM. -->
    <xsl:text>Danke für die Zahlung von </xsl:text>
    <xsl:value-of select="brutto" />
    <xsl:text> für die Rechnung vom </xsl:text>
    <xsl:value-of select="concat(substring(ausstellungsdatum, 9, 2), '. ', substring(ausstellungsdatum, 6, 2), '. ', substring(ausstellungsdatum, 1, 4))" />
    <xsl:text>.</xsl:text>
    <xsl:text>&#10;</xsl:text>
    
    <!-- Ich hoffe die ANZAHL Einzelposten sind zu Ihrer Zufriedenheit geliefert worden. -->
    <xsl:text>Ich hoffe die </xsl:text>
    <xsl:value-of select="count(abrechnungs-positionen/abrechnung)" />
    <xsl:text> Einzelposten sind zu Ihrer Zufriedenheit geliefert worden.</xsl:text>
    <xsl:text>&#10;&#10;</xsl:text>
  </xsl:template>

  <!-- Kopieren aller anderen Elemente und Attribute unverändert -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
