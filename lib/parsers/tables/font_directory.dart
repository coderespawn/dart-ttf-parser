part of ttf_parser;

class TableDirectoryEntry {
  String name;
  int checksum;
  int offset;
  int length;
}

class FontDirectory implements TtfTable {
  int scalarType;
  int numTables;
  int searchRange;
  int entrySelector;
  int rangeShift;
  var tableEntries = new Map<String, TableDirectoryEntry>();

  void parseData(StreamReader reader) {
    scalarType = reader.readUnsignedInt();
    numTables = reader.readUnsignedShort();
    searchRange = reader.readUnsignedShort();
    entrySelector = reader.readUnsignedShort();
    rangeShift = reader.readUnsignedShort();
    // Extract the offset of each table
    for (var i = 0; i < numTables; i++) {
      var entry = new TableDirectoryEntry();
      entry.name = reader.readString(4);
      entry.checksum = reader.readUnsignedInt();
      entry.offset = reader.readUnsignedInt();
      entry.length = reader.readUnsignedInt();
      tableEntries[entry.name] = entry;
    }
  }
  
  bool containsTable(String tableName) => tableEntries.containsKey(tableName);
  
  TableDirectoryEntry getTableEntry(String tableName) {
    if (!tableEntries.containsKey(tableName)) {
      throw new ParseException("Cannot find table entry: $tableName");
    }
    return tableEntries[tableName];
  }
}
