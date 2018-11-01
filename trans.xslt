
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:variable name="delimiter" select="','"/>

    <xsl:key name="field" match="/*/*/*" use="local-name()"/>

    <!-- variable containing the first occurrence of each field -->
    <xsl:variable name="allFields"
         select="/*/*/*[generate-id()=generate-id(key('field', local-name())[1])]" />

    <xsl:template match="/">
	<xsl:for-each select="/*/*/*/child::*">
       <xsl:if test="position() &lt; 4">
            <xsl:variable name="lower" select="local-name()" />
			<xsl:variable name="upper" select="translate($lower, 'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
			<xsl:value-of select ="$upper"/>

            <xsl:if test="position() &lt; 3">
                <xsl:value-of select="$delimiter" /><xsl:text>&#160;</xsl:text>
            </xsl:if></xsl:if>
        </xsl:for-each>
	
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="*" />
    </xsl:template>

<xsl:template match="*">

<xsl:for-each select="/*/child::*">

<xsl:for-each select="child::*">
<xsl:for-each select="child::*">
<xsl:for-each select="child::*">

<xsl:if test="local-name() != 'born'">
<xsl:if test="local-name() != 'died'">
<xsl:if test="position() != last()"><xsl:value-of select="normalize-space(.)"/>
<xsl:if test="position() =1">
<xsl:text>&#160;</xsl:text></xsl:if></xsl:if>

</xsl:if></xsl:if>
</xsl:for-each>

<xsl:if test="local-name() != 'isbn'">
<xsl:if test="local-name() != 'author'">
<xsl:if test="position() != last()">,<xsl:text>&#160;</xsl:text><xsl:value-of select="normalize-space(.)"/>
</xsl:if></xsl:if></xsl:if>

<xsl:if test="local-name() != 'isbn'">
<xsl:if test="position() = last()">,<xsl:text>&#160;</xsl:text>
</xsl:if></xsl:if>

<xsl:if test="position()  = last()">
<xsl:if test="local-name() != 'isbn'"><xsl:value-of select="normalize-space(.)"/>
</xsl:if><xsl:text>&#xd;</xsl:text></xsl:if>


</xsl:for-each>

</xsl:for-each>

</xsl:for-each>
</xsl:template> 

</xsl:stylesheet>