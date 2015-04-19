part of ttf_parser;

class TtfTableHead implements TtfTable {
  num version;
  num fontRevision;
  int checkSumAdjustment;
  int magicNumber;
  int flags;
  int unitsPerEm;
  int created;
  int modified;
  int xMin;
  int yMin;
  int xMax;
  int yMax;
  int macStyle;
  int lowestRecPPEM;
  int fontDirectionHint;
  int indexToLocFormat;
  int glyphDataFormat;
  
  
  void parseData(StreamReader reader) {
    version = reader.read32Fixed();
    fontRevision = reader.read32Fixed();
    checkSumAdjustment = reader.readUnsignedInt();
    magicNumber = reader.readUnsignedInt();
    flags = reader.readUnsignedShort();
    unitsPerEm = reader.readUnsignedShort();
    created = reader.readDate();
    modified = reader.readDate();
    xMin = reader.readSignedShort();
    yMin = reader.readSignedShort();
    xMax = reader.readSignedShort();
    yMax = reader.readSignedShort();
    macStyle = reader.readUnsignedShort();
    lowestRecPPEM = reader.readUnsignedShort();
    fontDirectionHint = reader.readSignedShort();
    indexToLocFormat = reader.readSignedShort();
    glyphDataFormat = reader.readSignedShort();
    
    // Make sure the magic number is correct
    if (magicNumber != 0x5F0F3CF5) {
      throw new ParseException("File is not a TrueType font");
    }
  }
}
