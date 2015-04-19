part of ttf_parser;

class TtfTableHmtx implements TtfTable {
  List<HtmxLongHorMetric> metrics = new List<HtmxLongHorMetric>();
  TtfFont font;
  TtfTableHmtx(this.font);
  
  void parseData(StreamReader reader) {
    for (var i = 0; i < font.hhea.numOfLongHorMetrics; i++) {
      var metric = new HtmxLongHorMetric();
      metric.advanceWidth = reader.readUnsignedShort();
      metric.leftSideBearing = reader.readSignedShort();
      metrics.add(metric);
//      print ("adv: ${metric.advanceWidth}  left: ${metric.leftSideBearing}");
    }
  }
}

class HtmxLongHorMetric {
  int advanceWidth;
  int leftSideBearing;
}
