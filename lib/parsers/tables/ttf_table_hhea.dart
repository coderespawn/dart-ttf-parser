part of ttf_parser;

/** 
 * The Horizontal header table 
 * Specs: https://developer.apple.com/fonts/TTRefMan/RM06/Chap6hhea.html
 * */
class TtfTableHhea implements TtfTable {
  num version;
  int ascent;
  int descent;
  int lineGap;
  int advanceWidthMax;
  int minLeftSideBearing;
  int minRightSideBearing;
  int xMaxExtent;
  int caretSlopeRise;
  int caretSlopeRun;
  int caretOffset;
  int reserved1;
  int reserved2;
  int reserved3;
  int reserved4;
  int metricDataFormat;
  int numOfLongHorMetrics;
  
  void parseData(StreamReader reader) {
    version = reader.read32Fixed();
    ascent = reader.readSignedShort();
    descent = reader.readSignedShort();
    lineGap = reader.readSignedShort();
    advanceWidthMax = reader.readUnsignedShort();
    minLeftSideBearing = reader.readSignedShort();
    minRightSideBearing = reader.readSignedShort();
    xMaxExtent = reader.readSignedShort();
    caretSlopeRise = reader.readSignedShort();
    caretSlopeRun = reader.readSignedShort();
    caretOffset = reader.readSignedShort();
    reserved1 = reader.readSignedShort();
    reserved2 = reader.readSignedShort();
    reserved3 = reader.readSignedShort();
    reserved4 = reader.readSignedShort();
    metricDataFormat = reader.readSignedShort();
    numOfLongHorMetrics = reader.readUnsignedShort();
  }
}
