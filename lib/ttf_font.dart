part of ttf_parser;

class TtfFont {
  FontDirectory directory;
  TtfTableHead head;
  TtfTableMaxp maxp;
  TtfTableCmap cmap;
  TtfTableHhea hhea;
  TtfTableHmtx hmtx;
  TtfTableLoca loca;
  TtfTableGlyf glyf;
  TtfTableKern kern;
  TtfTableName name;

  TtfFont() {
    directory = new FontDirectory();
    head = new TtfTableHead();
    maxp = new TtfTableMaxp();
    cmap = new TtfTableCmap();
    hhea = new TtfTableHhea();
    name = new TtfTableName();
    hmtx = new TtfTableHmtx(this);
    loca = new TtfTableLoca(this);
    glyf = new TtfTableGlyf(this);
    kern = new TtfTableKern(this);
  }
  
  int get unitsPerEm => head.unitsPerEm;
  int get numGlyphs => maxp.numGlyphs;

  GlyphInfo getGlyphInfo(String ch) {
    int charCode = ch.codeUnits[0];
    return getGlyphInfoFromCode(charCode);
  }
  
  GlyphInfo getGlyphInfoFromCode(int charCode) {
    int glyphIndex = cmap.charToGlyphIndexMap[charCode];
    if (glyphIndex == null) return null;
    var glyphInfo = glyf.glyphInfoMap[glyphIndex];
    return glyphInfo;
  }
  
  final int pixelsPerEm = 16;
  int getPixels(int unitsInEm, num sizeInEm) {
    var normalizedPixels = (unitsInEm * pixelsPerEm) / unitsPerEm;
    return (normalizedPixels * sizeInEm).round().toInt();
  }

  GlyphBoundingBox getGlyphBoundingBox(GlyphInfo glyphInfo, num sizeInEm) {
    var bbox = new GlyphBoundingBox();
    bbox.xMin = getPixels(glyphInfo.xMin, sizeInEm);
    bbox.yMin = getPixels(glyphInfo.yMin, sizeInEm);
    bbox.xMax = getPixels(glyphInfo.xMax, sizeInEm);
    bbox.yMax = getPixels(glyphInfo.yMax, sizeInEm);
    return bbox;
  }
}
