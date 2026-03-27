<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
  <title>Catàleg de Videojocs</title>
  <style>
    body { font-family: Arial, sans-serif; background: #111; color: #eee; padding: 20px; }
    h1 { text-align: center; color: #f9ca24; }
    .contenidor { display: flex; flex-wrap: wrap; gap: 16px; justify-content: center; }
    
    .targeta { background: #222; border-radius: 10px; padding: 16px; width: 200px; border: 1px solid #444; }
    
    .titol { font-size: 1.1em; font-weight: bold; color: #f9ca24; margin-bottom: 8px; }
    .plataforma { font-size: 0.9em; color: #aaa; margin-bottom: 12px; }
    .punts { font-size: 1.3em; font-weight: bold; margin-bottom: 10px; }
    .info { font-size: 0.85em; color: #bbb; margin-top: 10px; line-height: 1.5; }
    

    .excellent { color: #6ab04c; } 
    .be { color: #f9ca24; }     
    .regular { color: #e67e22; }  
    .dolent { color: #eb4d4b; }
  </style>
</head>
<body>
  <h1>🎮 El Meu Catàleg de Videojocs</h1>
  <div class="contenidor">
    <xsl:for-each select="videojocs/joc">
      
      <xsl:sort select="puntuacio" data-type="number" order="descending"/>
      
      <div class="targeta">
        <div class="titol"><xsl:value-of select="titol"/></div>
        
        <div class="plataforma">
          <xsl:choose>
            <xsl:when test="plataforma = 'Nintendo Switch'">🟥</xsl:when>
            <xsl:when test="plataforma = 'PlayStation 5'">🟦</xsl:when>
            <xsl:when test="plataforma = 'Xbox Series X'">🟩</xsl:when>
            <xsl:when test="plataforma = 'PC'">💻</xsl:when>
            <xsl:when test="plataforma = 'Mòbil'">📱</xsl:when>
            <xsl:otherwise>🎮</xsl:otherwise>
          </xsl:choose>
          <xsl:text> </xsl:text><xsl:value-of select="plataforma"/>
        </div>

        <div>
          <xsl:attribute name="class">punts <xsl:choose>
              <xsl:when test="puntuacio &gt;= 9">excellent</xsl:when>
              <xsl:when test="puntuacio &gt;= 7">be</xsl:when>
              <xsl:when test="puntuacio &gt;= 5">regular</xsl:when>
              <xsl:otherwise>dolent</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          ⭐ <xsl:value-of select="puntuacio"/> / 10
        </div>

        <div class="info">
          🎲 <strong>Gènere:</strong> <xsl:value-of select="genere"/><br/>
          📅 <strong>Any:</strong> <xsl:value-of select="any"/><br/>
          💰 <strong>Preu:</strong> <xsl:value-of select="preu"/> €
        </div>
      </div>
      
    </xsl:for-each>
  </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>