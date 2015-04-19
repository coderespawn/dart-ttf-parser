part of ttf_parser;

class ByteArrayStreamReader extends StreamReader {

  List<int> data;
  int position = 0;
  
  ByteArrayStreamReader(this.data);
  
  // Read an unsigned byte
  int read() {
    return data[position++];
  }
  
  // Read an unsigned byte
  List<int> readBytes(int count) {
    var result = new List<int>();
    result.addAll(data.getRange(position, position + count));
    position += count;
    return result;
  }

  // Close the stream
  void close() {
  }

  // Seek to the specified position in the stream
  void seek(int position) {
    this.position = position;
  }
  
  // Get the current seek position of the stream
  int get currentPosition => position;
  
  List<int> readOffsetFromArray(int offset, int length) {
    return data.getRange(offset, length);
  }
  
}
