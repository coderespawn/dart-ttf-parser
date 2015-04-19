part of ttf_parser;

class TtfTableMaxp implements TtfTable {
  num version;
  int numGlyphs;
  int maxPoints;
  int maxContours;
  int maxComponentPoints;
  int maxComponentContours;
  int maxZones;
  int maxTwilightPoints;
  int maxStorage;
  int maxFunctionDefs;
  int maxInstructionDefs;
  int maxStackElements;
  int maxSizeOfInstructions;
  int maxComponentElements;
  int maxComponentDepth;
  
  void parseData(StreamReader reader) {
    version = reader.read32Fixed();
    numGlyphs = reader.readUnsignedShort();
    maxPoints = reader.readUnsignedShort();
    maxContours = reader.readUnsignedShort();
    maxComponentPoints = reader.readUnsignedShort();
    maxComponentContours = reader.readUnsignedShort();
    maxZones = reader.readUnsignedShort();
    maxTwilightPoints = reader.readUnsignedShort();
    maxStorage = reader.readUnsignedShort();
    maxFunctionDefs = reader.readUnsignedShort();
    maxInstructionDefs = reader.readUnsignedShort();
    maxStackElements = reader.readUnsignedShort();
    maxSizeOfInstructions = reader.readUnsignedShort();
    maxComponentElements = reader.readUnsignedShort();
    maxComponentDepth = reader.readUnsignedShort();
  }
}
